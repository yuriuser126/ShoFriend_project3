package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.CartDTO;
import com.boot.dto.CategoryDTO;
import com.boot.dto.CustomerDTO;
import com.boot.dto.ProductDTO;
import com.boot.dto.SellerDTO;
import com.boot.service.CartService;
import com.boot.service.LogService;
import com.boot.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LogController {
	/*
	 * 25/04/08 성유리 
	 * login : 판매자 구매자 선택 
	 * customer_login : 구매자 로그인 
	 * seller_login : 판매자
	 * 로그인 loginYn : 구매자 로그인화면->로그인 여부 판단 체크 메소드 
	 * loginYns : 판매자 로그인화면->로그인 여부 판단 체크
	 * 메소드 main : 메인화면으로 이동 
	 * 25/04/09 성유리 추가및 수정 
	 * find_id (customer) 아이디 찾기 입력란
	 * searchId (customer) 이름과 이메일 체크 > 아이디 확인창 
	 * do_find_id (customer) 아이디 찾기 > 보이는란
	 * find_ids (seller) 아이디 찾기 입력란 
	 * searchIds (seller) 이름과 이메일 체크 > 아이디 확인창
	 * do_find_ids (seller) 아이디 찾기 > 보이는란
	 * 
	 * 25/04/11 성유리 추가 및 수정 
	 * 25/04/08 김채윤 추가 
	 * seller_register : 일반회원가입 
	 * registerOk : 일반회원가입 완료 
	 * seller_register : 판매자 회원가입 
	 * seller_registerOk : 판매자 회원가입 완료
	 * 
	 * 25.04.11 권준우 수정
	 * main : product 정보를 출력하기 위해 수정
	 */
	
	
	@Autowired
	private LogService service;
	@Autowired
	private CartService cartService;	
	@Autowired
	private ProductService productService;
//	메인 페이지 호출 메서드
//	25.04.11 권준우 - 메인 페이지에서 상품 정보를 띄우기 위해 수정
//	@RequestMapping("/main")
//	public String main(Model model) {
//		log.info("@# main()");
//		
//		List<ProductDTO> products = productService.getProductListTop10();  // product table 에서 가져온 리스트
//		model.addAttribute("productList", products);  // JSP에서 사용할 이름으로 전달
//		
//		return ("main");
//	}
	
	
/*	
	// 메인 페이지 // 삭제 - 25.04.11 권준우(수정버전 작성)
	@RequestMapping("/main")
	public String main() {
		log.info("@# main()");
		return ("main");
	}
*/	
	
	// 구매자 판매자 선택 페이지
	@RequestMapping("/log/login")
	public String login(Model model) {
		log.info("@# /log/login()");
		
		//2025.05.13 카테고리출력
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		return ("/log/login");
	}

	// (customer) 로그인 페이지
	@RequestMapping("/log/customer_login")
	public String customerLogin(Model model) {
		log.info("@# /log/customer_login()");
		//2025.05.13 카테고리출력
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		return ("/log/customer_login");
	}

	// (seller) 로그인 페이지
	@RequestMapping("/log/seller_login")
	public String sellerlogin(Model model) {
		log.info("@# /log/sellerLogin()");
		//2025.05.13 카테고리출력
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		return ("/log/seller_login");
	}

	// (customer) 로그인 체크 메소드
	@RequestMapping("/login_yn")
	public String loginYn(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		log.info("@#/login_Yn()");

		ArrayList<CustomerDTO> dtos = service.loginYn(param);

		if (dtos.isEmpty()) {
			return "redirect:log/login";
		} else {
			if (param.get("password").equals(dtos.get(0).getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("loginCustomer", dtos.get(0));
				session.setAttribute("userType", "customer"); // 로그인 타입 저장
				return "redirect:main";
			}
			return "redirect:log/login";
		}
	}

	// (seller) 로그인 체크 메소드
	@RequestMapping("/login_yns")
	public String loginYns(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		log.info("@#/loginYns()");

		ArrayList<SellerDTO> dtos = service.loginYns(param);

		if (dtos.isEmpty()) {
			return "redirect:log/login";
		} else {
			if (param.get("password").equals(dtos.get(0).getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("loginSeller", dtos.get(0));
				session.setAttribute("userType", "seller"); // 로그인 타입 저장
				return "redirect:main";
			}
			return "redirect:log/login";
		}
	}


	// (customer) 아이디 찾기 입력란
	@RequestMapping("/log/find_id")
	public String find_id(Model model) {
		log.info("@#/log/find_id()");
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		return ("/log/find_id");
	}

	// (customer) 아이디 확인창
	@RequestMapping("/searchId")
	public String searchId(@RequestParam HashMap<String, String> param) {
		log.info("@# searchId");
		service.searchId(param);
		return "redirect:main";
	}

	// (customer) 아이디 찾기 보이는란
	@RequestMapping("/log/do_find_id")
	public String do_find_id(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# /log/do_find_id()");
		CustomerDTO list = service.doFindId(param);
		model.addAttribute("list", list);
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		return "/log/do_find_id";
	}

	// (seller) 아이디 찾기 입력란
	@RequestMapping("/log/find_ids")
	public String find_ids(Model model) {
		log.info("@#/log/find_ids()");
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		return ("/log/find_ids");
	}

	// (seller) 아이디 확인창
	@RequestMapping("/searchIds")
	public String searchIds(@RequestParam HashMap<String, String> param) {
		log.info("@# searchIds");
		service.searchIds(param);
		return "redirect:main";
	}

	// (seller) 아이디 찾기 보이는란
	@RequestMapping("/log/do_find_ids")
	public String do_find_ids(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# /log/do_find_ids()");

		SellerDTO list = service.doFindIds(param);
		model.addAttribute("list", list);
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		return "/log/do_find_ids";
	}

	// (customer) 비밀번호 찾기 입력란
	@RequestMapping("/log/find_pw")
	public String find_pw(Model model) {
		log.info("@# /log/find_pw()");
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		return ("/log/find_pw");
	}

	// (customer) 비밀번호 확인창
	@RequestMapping("/searchPw")
	public String searchPw(@RequestParam HashMap<String, String> param) {
		log.info("@# searchPw");
		service.searchPw(param);
		return "redirect:main";
	}

//(customer) 비밀번호 찾기 보이는란 
	@RequestMapping("/log/do_find_pw")
	public String do_find_pw(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# /log/do_find_pw()");

		CustomerDTO list = service.doFindPw(param);
		model.addAttribute("list", list);
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		return "/log/do_find_pw";
	}

	// (seller) 비밀번호 찾기 입력란
	@RequestMapping("/log/find_pws")
	public String find_pws(Model model) {
		log.info("@# /log/find_pws()");
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		return ("/log/find_pws");
	}

	// (seller) 비밀번호 확인창
	@RequestMapping("/searchPws")
	public String searchPws(@RequestParam HashMap<String, String> param) {
		log.info("@# searchPws");
		service.searchPws(param);
		return "redirect:main";
	}

	// (seller) 비밀번호 찾기 보이는란
	@RequestMapping("/log/do_find_pws")
	public String do_find_pws(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# /log/do_find_pws()");

		SellerDTO list = service.doFindPws(param);
		model.addAttribute("list", list);
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		return "/log/do_find_pws";
	}

	// (일반회원가입) 25.04.08 김채윤
	@RequestMapping("/log/customer_register")
	public String customer_register(Model model) {
		log.info("@# /log/customer_register()");
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		return "/log/customer_register";
	}

	// (일반회원가입 완료) 25.04.08 김채윤
	// (일반회원가입 완료) 25.04.14 우주연
	@RequestMapping("/log/registerOk")
	public String registerOk(@RequestParam HashMap<String, String> param) {
		log.info("@# registerOk()");

		service.write(param);
		return "redirect:login";
	}

	// (판매자 회원가입) 25.04.08 김채윤
	@RequestMapping("/log/seller_register")
	public String seller_register(Model model) {
		log.info("@# /log/seller_register()");
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		return "/log/seller_register";
	}

	// (판매자 회원가입 완료) 25.04.08 김채윤
	// (판매자회원가입 완료) 25.04.14 우주연
	@RequestMapping("/log/seller_registerOk")
	public String seller_registerOk(@RequestParam HashMap<String, String> param) {
		log.info("@# seller_registerOk()");

		service.sell_write(param);
		return "redirect:login";
	}
	
}
