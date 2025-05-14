package com.boot.service;

import java.util.List;
import java.util.HashMap;

import com.boot.dto.OrderDetailDTO;
import com.boot.dto.OrdersDTO;

public interface OrdersService {
    public List<OrdersDTO> getOrdersByCustomer(HashMap<String, String> param);
    OrderDetailDTO getOrderDetail(int orderId);
}
