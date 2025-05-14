package com.boot.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FriendDTO {
	private int id;
	private int customer_id1;
	private int customer_id2;
	private String status;
	private Timestamp created_at;
}
