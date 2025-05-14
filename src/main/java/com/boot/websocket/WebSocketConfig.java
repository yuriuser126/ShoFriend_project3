package com.boot.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.*;

// 25.05.08 권준우
// WebSocket 요청을 HttpSessionInterceptor를 거쳐서 ChatWebSocketHandler에 연결해주는 클래스
@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
	
	@Autowired
	private ChatWebSocketHandler chatWebSocketHandler;	
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chatWebSocketHandler, "/chat")
				.addInterceptors(new HttpSessionInterceptor())
				.setAllowedOrigins("*");
	}
}
