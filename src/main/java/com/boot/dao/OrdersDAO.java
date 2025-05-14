package com.boot.dao;

import java.util.HashMap;
import java.util.List;

import com.boot.dto.OrderItemDTO;
import com.boot.dto.OrdersDTO;

public interface OrdersDAO {
    public List<OrdersDTO> getOrdersByCustomer(HashMap<String, String> param);
    void insertOrder(OrdersDTO orderDTO);
    void insertOrderItem(OrderItemDTO orderItemDTO);
    OrdersDTO selectOrderById(int orderId);
    List<OrderItemDTO> selectOrderItemsByOrderId(int orderId);
}
