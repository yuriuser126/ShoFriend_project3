package com.boot.dto;

import lombok.Data;

import java.util.List;

@Data
public class OrderDetailDTO {
    private OrdersDTO order;
    private List<OrderItemDTO> orderItems;
    
}