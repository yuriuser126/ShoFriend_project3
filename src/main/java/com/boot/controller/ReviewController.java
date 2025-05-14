package com.boot.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.boot.dto.CustomerDTO;
import com.boot.dto.ReviewDTO;
import com.boot.service.ProductService;
import com.boot.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ProductService productService;

	@PostMapping("/review/write")
	public String writeReview(ReviewDTO dto, HttpSession session) {
		log.info("@# writeReview()");
		
		CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
		if (customer == null) {
			return "redirect:/log/login";
		}

		dto.setCustomerId(customer.getId());
		dto.setCreatedAt(Timestamp.valueOf(LocalDateTime.now()));
		reviewService.saveReview(dto);
		
		// 리뷰 작성 시 추천 + / -
		productService.addRecommend(dto.getProductId(),dto.getRating()-3);
		
		log.info("@# rating: " + dto.getRating());
		log.info("@# productId: " + dto.getProductId());

		return "redirect:/content?id=" + dto.getProductId(); // 다시 상품 페이지로 이동
	}
}
