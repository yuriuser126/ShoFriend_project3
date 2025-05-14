package com.boot.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.boot.dto.ChatDTO;
import com.boot.service.ChatService;

import lombok.extern.slf4j.Slf4j;

import java.util.*;

// 25.05.08 권준우
// 실제 채팅 송수신 처리 클래스
@Slf4j
@Component
public class ChatWebSocketHandler extends TextWebSocketHandler {
	
	@Autowired
	private ChatService chatService;

	// 사용자 세션 저장소 (1:1 채팅 위해 Map 사용)
	private final Map<String, WebSocketSession> userSessions = new HashMap<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("@# afterConnectionEstablished() 실행");

		try {
			String userId = getUserId(session);
			userSessions.put(userId, session);
			System.out.println(userId + " connected");
		} catch (Exception e) {
			System.out.println("⚠️ afterConnectionEstablished 중 예외 발생:");
			e.printStackTrace();
		}
	}

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("Message received: " + message.getPayload());

		// 메시지 파싱 예시: "receiverId:messageContent"
		String[] parts = message.getPayload().split(":", 2);
		if (parts.length != 2) return;

		String receiverId = parts[0];
		String content = parts[1];
//		String senderId = (String) session.getAttributes().get("loginId");
		String senderId = String.valueOf(session.getAttributes().get("loginId"));

		try {
			// 👉 DB 저장
			ChatDTO dto = new ChatDTO();
			dto.setSenderId(senderId);
			dto.setReceiverId(receiverId);
			dto.setMessage(content);
			System.out.println(">> DB 저장 직전: " + senderId + " → " + receiverId + ": " + content);
			chatService.saveMessage(dto);
			System.out.println(">> DB 저장 완료");
		} catch (Exception e) {
			System.out.println("❌ DB 저장 중 예외 발생:");
			e.printStackTrace();
		}
		
		WebSocketSession receiverSession = userSessions.get(receiverId);
		if (receiverSession != null && receiverSession.isOpen()) {
			System.out.println(">> 실시간 전송 시작");
			receiverSession.sendMessage(new TextMessage(content));
			System.out.println(">> 실시간 전송 완료");
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("@# afterConnectionClosed() 실행");
		
		String userId = getUserId(session);
		userSessions.remove(userId);
		System.out.println(userId + " disconnected");
	}

	private String getUserId(WebSocketSession session) {
		try {
			Object loginId = session.getAttributes().get("loginId");
			if (loginId == null) System.out.println("⚠️ loginId가 null입니다!");
			return String.valueOf(loginId); // ✅ 이게 핵심 수정
		} catch (Exception e) {
			System.out.println("⚠️ getUserId() 예외 발생:");
			e.printStackTrace();
			return "unknown";
		}
	}

}
