package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.CategoryDTO;
import com.boot.dto.ProductDTO;
import com.boot.dto.SellerDTO;
import com.boot.dto.StoreDTO;
import com.boot.service.CartService;
import com.boot.service.LogService;
import com.boot.service.ProductService;
import com.boot.service.StoreService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StoreController {

/*
 * 
 */
	
	@Autowired
	private StoreService service;
	private LogService logService;
	@Autowired
	private CartService cartService;	
	@Autowired
	private ProductService productService;
	
	//(등록된 점포 리스트) 25.04.09 김채윤
		@RequestMapping("/store_list")
		public String store_list(@RequestParam HashMap<String, String> param, HttpServletRequest request, Model model) {
			log.info("@# store_list()");
		
			
			HttpSession session = request.getSession();
			SellerDTO seller = (SellerDTO) session.getAttribute("loginSeller");
			ArrayList<CategoryDTO> categorylist = productService.categorylist();
			model.addAttribute("categorylist", categorylist);
			if (seller != null) {
				int seller_id = seller.getId();
				ArrayList<StoreDTO> store_list = service.store_list(seller_id);
				model.addAttribute("store_list", store_list);
				return "store_list";
			}else {
				log.info("로그인된 판매자 정보 없음");
			}return "my_page";



		}
		
	//(점포 보기)25.04.09 김채윤
		@RequestMapping("/store_view")
		public String store_view(@RequestParam HashMap<String, String> param, Model model) {
			log.info("@# store_view()");
			ArrayList<CategoryDTO> categorylist = productService.categorylist();
			model.addAttribute("categorylist", categorylist);
			StoreDTO dto = service.store_view(param);
			model.addAttribute("store_view", dto);
			return "store_view";
		}
		
//		(점포 수정) 25.04.09 김채윤
		@RequestMapping("/store_modify")
		public String store_modify(@RequestParam HashMap<String, String> param) {
			log.info("@# store_modify()");

	//	
			service.store_modify(param);
			return "redirect:store_list";
		}
		
//		(점포 삭제) 25.04.09 김채윤
		@RequestMapping("/store_delete")
		public String store_delete(@RequestParam HashMap<String, String> param) {
			log.info("@# store_delete()");

			service.store_delete(param);
			return "redirect:store_list";
		}
		
//		(점포 등록) 25.04.09 김채윤
		@RequestMapping("/store_register")
		public String store_register(@RequestParam HashMap<String, String> param, HttpServletRequest request,Model model) {
			log.info("store_register 컨트롤러");
			ArrayList<CategoryDTO> categorylist = productService.categorylist();
			model.addAttribute("categorylist", categorylist);
			return "store_register";

			

		}
		
		//(점포 등록 완료) 25.04.08 김채윤
		@RequestMapping("/store_registerOk")
			public String store_registerOk(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
			log.info("@# store_registerOk()");
			HttpSession session = request.getSession();
			SellerDTO seller = (SellerDTO) session.getAttribute("loginSeller");
			
			
			if (seller != null) {
				int seller_id = seller.getId();
				param.put("seller_id", Integer.toString(seller_id));
				service.store_write(param);
				
				return "redirect:store_list";
			}else {
				log.info("로그인된 판매자 정보 없음");
				return "redirect:store_register";
			}
			
			
		}
		
		@RequestMapping("/store_view_product")
		public String viewStoreProducts(@RequestParam("id") int storeId, Model model) {
			List<ProductDTO> productList = service.getProductsByStoreId(storeId);
			model.addAttribute("productList", productList);
			ArrayList<CategoryDTO> categorylist = productService.categorylist();
			model.addAttribute("categorylist", categorylist);
			return "store_view_product"; 
		}
	}