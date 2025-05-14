package com.boot.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {
	private int id;
	private int productId;
	private int customerId;
	private String title;
	private String content;
	private int rating;
	private Timestamp createdAt;
	
	private String customerName; // 리뷰 작성자 이름 
}
