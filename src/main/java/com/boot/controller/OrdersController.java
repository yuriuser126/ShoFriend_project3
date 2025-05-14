package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.CartDTO;
import com.boot.dto.CategoryDTO;
import com.boot.dto.CustomerDTO;
import com.boot.dto.OrderDetailDTO;
import com.boot.dto.OrdersDTO;
import com.boot.service.CartService;
import com.boot.service.OrdersService;
import com.boot.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrdersController {

	@Autowired
	private OrdersService service;
	@Autowired
	private CartService cartService;	
	@Autowired
	private ProductService productService;
	@RequestMapping("/order_view")
	public String orderView(HttpSession session, Model model) {
		CustomerDTO loginCustomer = (CustomerDTO) session.getAttribute("loginCustomer");

		log.info("@# order_view_start()");
		
		if (loginCustomer == null)
			return "redirect:log/login";

		HashMap<String, String> param = new HashMap<String, String>();
		param.put("customer_id", String.valueOf(loginCustomer.getId()));

		List<OrdersDTO> orderList = service.getOrdersByCustomer(param);
		model.addAttribute("orderList", orderList);
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
        if (loginCustomer != null) {
            int currentCustomerId = loginCustomer.getId();
            List<CartDTO> items = cartService.getCartItemsWithProduct(currentCustomerId);
            model.addAttribute("items", items);
        }
		log.info("@# order_view_end()");

		return "order_view";
	}
	@RequestMapping("/pay/detail")
	public String getOrderDetail(@RequestParam("order_id") int order_id, Model model,HttpSession session) {
		log.info("@# getOrderDetail()");
		OrderDetailDTO orderDetail = service.getOrderDetail(order_id); // 주문 상세 정보 조회 로직
	    model.addAttribute("orderDetail", orderDetail);
	    ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		CustomerDTO loginCustomer = (CustomerDTO) session.getAttribute("loginCustomer");
        if (loginCustomer != null) {
            int currentCustomerId = loginCustomer.getId();
            List<CartDTO> items = cartService.getCartItemsWithProduct(currentCustomerId);
            model.addAttribute("items", items);
        }
	    return "pay/detail"; 
	}
	
}
