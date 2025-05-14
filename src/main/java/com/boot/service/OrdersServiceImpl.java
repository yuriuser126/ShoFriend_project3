package com.boot.service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.OrdersDAO;
import com.boot.dao.ProductDAO;
import com.boot.dto.OrderDetailDTO;
import com.boot.dto.OrderItemDTO;
import com.boot.dto.OrdersDTO;
import com.boot.dto.ProductDTO;

@Service("OrdersService")
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<OrdersDTO> getOrdersByCustomer(HashMap<String, String> param) {
        OrdersDAO dao = sqlSession.getMapper(OrdersDAO.class);
        return dao.getOrdersByCustomer(param);
    }

	@Override
	public OrderDetailDTO getOrderDetail(int orderId) {
//		OrdersDAO dao = sqlSession.getMapper(OrdersDAO.class);
//		OrdersDTO order = dao.selectOrderById(orderId);
//        List<OrderItemDTO> orderItems = dao.selectOrderItemsByOrderId(orderId);
//
//        OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
//        orderDetailDTO.setOrder(order);
//        orderDetailDTO.setOrderItems(orderItems);
//        
//        ProductDAO productDao = sqlSession.getMapper(ProductDAO.class);
//        ProductDTO product = productDao.getProductById(orderId);
//        
//        orderDetailDTO.setProduct(product);
//        
//        return orderDetailDTO;
		OrdersDAO ordersDAO = sqlSession.getMapper(OrdersDAO.class);
        OrdersDTO order = ordersDAO.selectOrderById(orderId);
        List<OrderItemDTO> orderItems = ordersDAO.selectOrderItemsByOrderId(orderId);

        // orderItems의 각 item에 대해 product 정보를 조회하여 OrderItemDTO에 설정
        List<OrderItemDTO> enrichedOrderItems = orderItems.stream().map(item -> {
        	ProductDAO productDao = sqlSession.getMapper(ProductDAO.class);
            ProductDTO product = productDao.getProductById(item.getProduct_id());
            item.setProduct(product); // OrderItemDTO 내부에 ProductDTO 설정
            return item;
        }).collect(Collectors.toList());

        OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
        orderDetailDTO.setOrder(order);
        orderDetailDTO.setOrderItems(enrichedOrderItems);

        return orderDetailDTO;
	}
}
