package com.boot.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.ChatDTO;
import com.boot.dto.CustomerDTO;
import com.boot.service.ChatService;

import lombok.extern.slf4j.Slf4j;

//25.05.08 권준우 최초 작성
@Controller
@Slf4j
public class ChatController {
	
	@Autowired
	private ChatService chatService;

	// userA 테스트 채팅 호출 메서드
	@GetMapping("/chat/test")
	public String chatTestPage(HttpSession session) {
		log.info("@# chat_test_A()");
		
		session.setAttribute("loginId", "userA"); // 임시 로그인
		
		return "chat/chat_test"; // /WEB-INF/views/chat/chat_test.jsp
	}

	// userB 테스트 채팅 호출 메서드	
	@GetMapping("/chat/test-b")
	public String chatTestBPage(HttpSession session) {
		log.info("@# chat_test_B()");
		
		session.setAttribute("loginId", "userB"); // 임시 로그인
		
		return "chat/chat_test_b";
	}
	
//	@GetMapping("/chat/customer")
//	public String customerChatPage() {
//		log.info("@# chat_customer()");
//
//		return "chat/chat_customer";
//	}	
	
	// 호출 페이지
	@GetMapping("/chat/customer")
	public String customerChatPage(HttpSession session, Model model) {
		log.info("@# chat_customer()");
		
		CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
		if (customer == null) return "redirect:/log/login";

		int myId = customer.getId();

		// 전체 대화 조회 (내가 sender 또는 receiver인 메시지)
		List<ChatDTO> allMessages = chatService.getConversationByUserId(myId);
		model.addAttribute("chatMessages", allMessages);
		model.addAttribute("myId", String.valueOf(myId));

		return "chat/chat_customer";
	}

	
	@GetMapping("/chatWithFriend")
	public String chatWithFriend(@RequestParam int friendId,
	                             @RequestParam String friendName,
	                             HttpSession session,
	                             Model model) {
		log.info("@# chatWithFriend()");
		
		CustomerDTO me = (CustomerDTO) session.getAttribute("loginCustomer");
		if (me == null) return "redirect:/log/login";

		int myId = me.getId();

		// 나와 상대방(friendId) 간의 채팅 내역만 조회
		List<ChatDTO> conversation = chatService.getChatWithFriend(myId, friendId);

		model.addAttribute("friendId", friendId);
		model.addAttribute("friendName", friendName);
		model.addAttribute("myId", myId);
		model.addAttribute("chatMessages", conversation);

		return "chat/chat_friend"; // chat_friend.jsp로 이동
	}


}
