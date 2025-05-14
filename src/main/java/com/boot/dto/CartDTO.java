package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class CartDTO {
	private int id;
	private int user_id;
	private int product_id;
	private String product_title;
	private int quantity;
	private int stock;
	private int price;
	private String picture;
	private int final_price;
	private int discount_percentage;
	
}
