package com.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.ChatDAO;
import com.boot.dto.ChatDTO;

//25.05.08 권준우
@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDAO chatDAO;
	
	@Override
	public void saveMessage(ChatDTO dto) {
		chatDAO.insertMessage(dto);
	}

	@Override
	public List<ChatDTO> getMessage(String userA, String userB) {
		return chatDAO.getMessageBetween(userA, userB);
	}
	
	@Override
	public List<ChatDTO> getReceivedMessages(int id) {
		return chatDAO.getReceivedMessages(id);
	}
	
	@Override
	public List<ChatDTO> getConversationByUserId(int id) {
		return chatDAO.getConversationByUserId(id);
	}
	
	@Override
	public List<ChatDTO> getChatWithFriend(int myId, int friendId) {
		return chatDAO.getChatWithFriend(myId, friendId);
	}

}
