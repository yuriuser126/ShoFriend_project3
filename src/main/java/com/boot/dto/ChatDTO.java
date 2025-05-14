package com.boot.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//25.05.08 권준우
@NoArgsConstructor
@Data
@AllArgsConstructor
public class ChatDTO {
	private int id;
	private String senderId;
	private String receiverId;
	private String message;
	private LocalDateTime sentAt;

}
