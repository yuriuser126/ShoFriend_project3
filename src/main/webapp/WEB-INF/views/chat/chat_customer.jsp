<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.boot.dto.CustomerDTO" %>
<%
	CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
	if (customer == null) {
		response.sendRedirect("/log/login");
		return;
	}
	int customerId = customer.getId(); // 여기를 getId()로 수정
%>
<html>
<head>
	<title>채팅 - 고객용</title>
	<script>
		let socket = null;

		function connect() {
			socket = new WebSocket("ws://localhost:8485/chat");

			socket.onopen = function () {
				appendMessage("✅ WebSocket 연결됨");
			};

			socket.onmessage = function (event) {
				appendMessage("📩 받은 메시지: " + event.data);
			};

			socket.onclose = function () {
				appendMessage("❌ 연결 종료됨");
			};

			socket.onerror = function (error) {
				appendMessage("⚠️ 오류 발생: " + error);
			};
		}

		function sendMessage() {
			const receiverId = document.getElementById("receiver").value;
			const message = document.getElementById("message").value;
			if (socket && socket.readyState === WebSocket.OPEN) {
				socket.send(receiverId + ":" + message);
				appendMessage("📤 보낸 메시지: " + message + " → " + receiverId);
			} else {
				appendMessage("🚫 WebSocket 연결 안 됨");
			}
		}

		function appendMessage(msg) {
			const chatBox = document.getElementById("chatBox");
			chatBox.value += msg + "\n";
			chatBox.scrollTop = chatBox.scrollHeight;
		}
	</script>
</head>
<body onload="connect()">
	

<h2>채팅 - 고객 모드</h2>
<p>내 아이디(ID): <b><%= customerId %></b></p>

<h3>📥 받은 메시지 내역</h3>
<c:forEach var="msg" items="${receivedMessages}">
	<p><b>${msg.senderId}</b> → 나: ${msg.message}</p>
</c:forEach>

<p>
	<label>받는 사람 ID: <input type="text" id="receiver" placeholder="예: 2" /></label>
</p>
<p>
	<label>메시지 내용: <input type="text" id="message" /></label>
	<button onclick="sendMessage()">전송</button>
</p>

<textarea id="chatBox" rows="10" cols="60" readonly></textarea>

<br><br>

<h2>아래는 대화 스타일 어떤지 시험용</h2>


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

<h3>💬 대화 내용</h3>
<div style="width: 100%; height: 300px; overflow-y: auto; border: 1px solid #ccc; padding: 10px;">
	<c:forEach var="msg" items="${chatMessages}">
		<c:choose>
			<c:when test="${msg.senderId == myId}">
				<div class="chat-bubble chat-right">
					나: ${msg.message}
				</div>
			</c:when>
			<c:otherwise>
				<div class="chat-bubble chat-left">
					${msg.senderId}: ${msg.message}
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>

</body>
</html>
