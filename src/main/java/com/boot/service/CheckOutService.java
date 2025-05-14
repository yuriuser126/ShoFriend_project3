package com.boot.service;

import java.util.List;

import com.boot.dto.OrderItemDTO;
import com.boot.dto.OrdersDTO;

public interface CheckOutService {
	public String kakaoPayReady(int totalAmount, String itemName, int quantity);
	public String kakaoPayApprove(String pgToken);
	public int createOrder(OrdersDTO orderDTO, List<OrderItemDTO> orderItems);
}
