package com.boot.controller;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.dto.CustomerDTO;
import com.boot.dto.ProductDTO;
import com.boot.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductController {
	@Autowired
    private ProductService service;
	
	//25.04.11 권준우 - 제품 주문 메소드 제작
	//11일 우주연 수정- 재고 감소
	@RequestMapping(value = "/product_order", method = RequestMethod.POST)
	public String orderProduct(
	    @RequestParam("product_id") int productId,
	    @RequestParam("quantity") int quantity,
	    HttpSession session,
	    RedirectAttributes redirectAttributes) {

	    CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
	    if (customer == null) {
	    	redirectAttributes.addFlashAttribute("msg", "로그인후 이용해 주세요 😭");
	    	return "redirect:log/login";
	    }
	   
	    ProductDTO product = service.getProductById(productId);

	    int price = product.getPrice();
	    int discount = 0;

	    Date now = new Date();
	    if (product.getDiscount_start() != null && product.getDiscount_end() != null &&
	        now.after(product.getDiscount_start()) && now.before(product.getDiscount_end())) {
	        discount = product.getDiscount_percentage();
	    }

	    int finalPrice = price - (price * discount / 100);
	    int totalPrice = finalPrice * quantity;

	    HashMap<String, String> param = new HashMap<>();
	    param.put("product_id", String.valueOf(productId));
	    param.put("customer_id", String.valueOf(customer.getId()));
	    param.put("quantity", String.valueOf(quantity));
	    param.put("total_price", String.valueOf(totalPrice));
	    param.put("status", "pending");

//	    service.insertOrder(param);
	    service.decreaseStock(productId, quantity);
	    redirectAttributes.addFlashAttribute("msg", "구매가 완료되었습니다! 주문정보는 마이페이지>주문조회에서 확인해주세요! 😊");
	    return "redirect:main";
	}

	
	
}
