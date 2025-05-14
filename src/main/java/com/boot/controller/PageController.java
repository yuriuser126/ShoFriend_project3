package com.boot.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.dto.Criteria;
import com.boot.dto.PageDTO;
import com.boot.dto.ProductDTO;
import com.boot.service.PageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PageController {

	@Autowired
	private PageService service;
	
	
	@RequestMapping("/list")
	public String list(Criteria cri, Model model) {
		log.info("@# list()->");
		log.info("@# cri()->"+cri);
		
		
//		model.addAttribute("list", service.listWithPaging(cri));
		ArrayList<ProductDTO> list = service.listWithPaging(cri);
		int total = service.getTotalCount(cri);
		log.info("@# total()->"+total);
		
		
		model.addAttribute("list", list);
		
		//pdf에 깔끔하게 나왔던 정보들 아래 페이지 메이커
		//total 임시 실제는 300 test 123
//		model.addAttribute("PageMaker", new PageDTO(123, cri));
//		123에 진짜 토탈 넣어야함
//		model.addAttribute("toatal", service.getTotalCount(cri)); 혼자한거 맞았음 히히
		
		model.addAttribute("PageMaker", new PageDTO(total, cri));
		
		log.info("@# cri()->"+cri);
		log.info("list, PageMaker 이후");
		return "list";
	}
	
	
}







