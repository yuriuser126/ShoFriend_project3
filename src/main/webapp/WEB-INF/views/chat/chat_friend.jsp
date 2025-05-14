<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>${friendName}님과의 채팅</title>
	<style>
		body {
		      font-family: "Manrope", sans-serif;
		      background-color: #f9f9f9;
		      margin: 0;
		      padding: 0;
		      display: flex;
		      justify-content: center;
		      align-items: center;
		      min-height: 100vh;
		  }

		  .chat-wrapper {
		      width: 100%;
		      max-width: 700px;
		      padding: 20px;
		      background-color: #ffffff;
		      border-radius: 12px;
		      box-shadow: 0 4px 10px rgba(0,0,0,0.08);
		      display: flex;
		      flex-direction: column;
		      align-items: center;
		  }

		  h2 {
		      font-weight: 600;
		      font-size: 20px;
		      margin-bottom: 16px;
		      width: 100%;
		      text-align: center;
		  }

		  #wsStatusBox {
		      font-size: 14px;
		      margin-bottom: 12px;
		      color: #4CAF50;
		      width: 100%;
		      text-align: center;
		  }

		  #chatContainer {
		      width: 100%;
		      height: 400px;
		      border: 1px solid #ccc;
		      background-color: #fff;
		      padding: 12px;
		      border-radius: 12px;
		      overflow-y: auto;
		      margin-bottom: 16px;
		      box-shadow: inset 0 2px 4px rgba(0,0,0,0.03);
		  }

		  .chat-bubble {
		      max-width: 70%;
		      padding: 10px 14px;
		      border-radius: 16px;
		      margin: 6px 0;
		      display: inline-block;
		      font-size: 14px;
		      line-height: 1.5;
		      word-break: break-word;
		      white-space: pre-line;
		      clear: both;
		  }

		  .chat-left {
		      background-color: #f1f1f1;
		      float: left;
		      text-align: left;
		      border-top-left-radius: 0;
		  }

		  .chat-right {
		      background-color: #d4f4dd;
		      float: right;
		      text-align: right;
		      border-top-right-radius: 0;
		  }

		  .chat-input-group {
		      display: flex;
		      width: 100%;
		      gap: 10px;
		  }

		  #message {
		      flex: 1;
		      padding: 10px;
		      border: 1px solid #ccc;
		      border-radius: 8px;
		      font-size: 14px;
		  }

		  button {
		      padding: 10px 16px;
		      font-size: 14px;
		      background-color: #4CAF50;
		      color: white;
		      border: none;
		      border-radius: 8px;
		      cursor: pointer;
		      transition: background-color 0.2s ease;
		  }

		  button:hover {
		      background-color: #45a049;
		  }

		  a {
		      font-size: 14px;
		      text-decoration: none;
		      color: #4CAF50;
		      margin-top: 12px;
		  }

		  a:hover {
		      text-decoration: underline;
		  }
		
		/* 반응형 처리 */
		   @media (max-width: 600px) {
		       .chat-wrapper {
		           border-radius: 0;
		           height: 100vh;
		           justify-content: center;
		       }

		       #chatContainer {
		           height: 300px;
		       }
		   }
	</style>

	<script>
		const friendName = "${friendName}";
		
		let socket = null;

		function connect() {
			socket = new WebSocket("ws://localhost:8485/chat");

			socket.onopen = function () {
				setStatus("✅ WebSocket 연결됨");
			};

			socket.onmessage = function (event) {
				appendMessage(friendName + ": " + event.data, false); // 친구 이름으로 출력
			};

			socket.onclose = function () {
				setStatus("❌ 연결 종료됨");
			};

			socket.onerror = function (error) {
				setStatus("⚠️ 오류 발생: " + error);
			};
		}

		// ✅ 상태 메시지는 따로 표시
		function setStatus(msg) {
			const statusBox = document.getElementById("wsStatusBox");
			statusBox.textContent = msg;
		}

		// ✅ 채팅 말풍선 출력 (기존 appendMessage 그대로 사용)
		function appendMessage(msg, isMine) {
			const container = document.getElementById("chatContainer");
			const div = document.createElement("div");
			div.className = "chat-bubble " + (isMine ? "chat-right" : "chat-left");
			
			// \n을 <br>로 변환하고 HTML로 출력
			const formattedMsg = msg.trim().replace(/\n/g, "<br>");
			div.innerHTML = formattedMsg;		
			
			container.appendChild(div);
			container.scrollTop = container.scrollHeight;
		}

		function sendMessage() {
			const message = document.getElementById("message").value;
			if (socket && socket.readyState === WebSocket.OPEN) {
				socket.send("${friendId}:" + message); // receiverId:message 형태
				appendMessage("나: " + message, true);
				document.getElementById("message").value = "";
			} else {
				appendMessage("🚫 WebSocket 연결 안 됨");
			}
		}
		
		// 엔터키 입력 시 전송
		document.addEventListener("DOMContentLoaded", function () {
			
			// 채팅창 스크롤을 맨 아래로 이동
			const chatBox = document.getElementById("chatContainer");
			chatBox.scrollTop = chatBox.scrollHeight;			
			
			const input = document.getElementById("message");
			input.addEventListener("keydown", function (event) {
				if (event.key === "Enter") {
					event.preventDefault(); // 줄바꿈 방지
					sendMessage(); // 전송 함수 호출
				}
			});
		});

	</script>
</head>

<body onload="connect()">
<div class="chat-wrapper">

    <div id="wsStatusBox"></div>

    <h2>💬 ${friendName} 님과의 채팅</h2>

    <div id="chatContainer">
        <c:forEach var="msg" items="${chatMessages}">
            <c:choose>
                <c:when test="${msg.senderId == myId}">
                    <div class="chat-bubble chat-right">
                        ${msg.message}
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="chat-bubble chat-left">
                        ${friendName}: ${msg.message}
                    </div>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>

    <div class="chat-input-group">
        <input type="text" id="message" placeholder="메시지를 입력하세요" />
        <button onclick="sendMessage()">전송</button>
    </div>

    <a href="/friend">친구 목록으로 돌아가기</a>
</div>
</body>
</html>
