package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemDTO {
    private int id;
    private int order_id;
    private int product_id;
    private int quantity;
    private int sale_price;
    private ProductDTO product;
}