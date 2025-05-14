package com.boot.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrdersDTO {
    private int id;
    private String partner_order_id;
    private int customer_id;
    private Timestamp order_date;
    private String order_status;
    private int total_quantity;
    private int total_price;
    private String delivery_address;
    private String delivery_zipcode;
    private String delivery_memo;
    private String payment_method;
    private String payment_status;
    private String transaction_id;
    private Integer friend_order_id; // Nullable 외래 키이므로 Integer 사용
    private Integer posted;        // Nullable 외래 키이므로 Integer 사용

    // 필요한 경우 연관된 OrderItem 리스트를 가질 수도 있습니다.
    // private List<OrderItemDTO> orderItems;
}