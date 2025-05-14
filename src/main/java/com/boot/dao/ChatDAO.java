package com.boot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.dto.ChatDTO;

//25.05.08 권준우
@Mapper
public interface ChatDAO {
	void insertMessage(ChatDTO dto);
	List<ChatDTO> getMessageBetween(String userA, String userB);
	List<ChatDTO> getReceivedMessages(int id);	// 받은 메세지 보여주는 메서드
	List<ChatDTO> getConversationByUserId(int id);	// 자연스러운 대화로 보여주는 메서드
	List<ChatDTO> getChatWithFriend(@Param("myId") int myId, @Param("friendId") int friendId);

}
