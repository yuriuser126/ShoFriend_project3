package com.boot.service;

import java.util.List;

import com.boot.dto.ChatDTO;

//25.05.08 권준우
public interface ChatService {
	void saveMessage(ChatDTO dto);
	List<ChatDTO> getMessage(String userA, String userB);
	List<ChatDTO> getReceivedMessages(int id);
	List<ChatDTO> getConversationByUserId(int id);
	List<ChatDTO> getChatWithFriend(int myId, int friendId);

}
