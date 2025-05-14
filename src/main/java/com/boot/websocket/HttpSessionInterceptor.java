package com.boot.websocket;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import com.boot.dto.CustomerDTO;

import org.springframework.http.server.ServletServerHttpRequest;

import javax.servlet.http.HttpSession;
import java.util.Map;

// 25.05.08 권준우
// 기존 로그인 세션을 WebSocket 세션에 연결
// 원래는 HttpSession 에서 loginId를 꺼내 WebSocket 연결 객체에 속성으로 전달
// => ShoFriend 기준으론 session에 DTO 객체가 "loginCustomer"로 들어가 있으므로
// 이 DTO에서 고객 고유 ID(ex: CustomerDTO의 id)를 추출하도록 수정
// 이후 ChatWebSocketHandler에서 사용자 구분 가능
public class HttpSessionInterceptor implements HandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
								   WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
		if (request instanceof ServletServerHttpRequest servletRequest) {
			HttpSession session = servletRequest.getServletRequest().getSession(false);
			
			if (session != null) {
//				String loginId = (String) session.getAttribute("loginId");
				Object loginObj = session.getAttribute("loginCustomer");
				
//				if (loginId != null) {
//					attributes.put("loginId", loginId);
//					System.out.println("WebSocket handshake - 세션 로그인 ID: " + loginId);
				if (loginObj instanceof CustomerDTO customer) {
					attributes.put("loginId", customer.getId());
					System.out.println("WebSocket 연결됨 - customerId: " + customer.getId());
					
				} else {
					System.out.println("WebSocket handshake - 로그인 ID 없음");
				}
				
			} else {
				System.out.println("WebSocket handshake - HttpSession 없음");
			}
		}
		
		return true;
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response,
							   WebSocketHandler wsHandler, Exception exception) {
		// 필요 시 로그용
	}
}
