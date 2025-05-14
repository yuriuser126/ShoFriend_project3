package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.dto.CartDTO;
import com.boot.dto.CategoryDTO;
import com.boot.dto.CustomerDTO;
import com.boot.service.CartService;
import com.boot.service.FriendService;
import com.boot.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FriendController {
/*
* (메소드 동작 방식 기재)
* 작성일      작성자   개발내용,수정내용
* 25/04/10    우주연   친구
*/
	@Autowired
	private FriendService service;
	@Autowired
	private ProductService productService;
	@Autowired
	private CartService cartService;
	
	@GetMapping("/checkFriend")
	@ResponseBody
	public Map<String, Object> checkFriendByEmail(@RequestParam("email") String email) {
	    Map<String, Object> response = new HashMap<>();

	    CustomerDTO customer = service.findByEmail(email);
	    if (customer != null) {
	        response.put("id", customer.getId());
	        response.put("email", customer.getEmail());
	        response.put("name", customer.getName());
	    }

	    return response;
	}
	
	@PostMapping("/addFriend")
	@ResponseBody
	public Map<String, Object> addFriend(@RequestBody Map<String, Object> req, HttpSession session) {
	    Map<String, Object> result = new HashMap<>();
	    try {
	    	CustomerDTO loginCustomer = (CustomerDTO) session.getAttribute("loginCustomer");
	        int customerId1 = loginCustomer.getId();  // 로그인한 사람
	        int customerId2 = (int) req.get("customer_id2"); // 검색된 친구

	        //높은숫자 -> 낮은숫자 보내지기는 하는데 10->2 , 2->10 양방향친구가됨 (수정예정)
	        service.insertFriend(customerId1, customerId2, "pending");

	        result.put("success", true);
	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("success", false);
	        result.put("message", e.getMessage());
	    }

	    return result;
	}
	
	@RequestMapping("/friend")
	public String friend(HttpSession session,RedirectAttributes redirectAttributes, Model model) {
		log.info("friend()");
		CustomerDTO loginCustomer = (CustomerDTO) session.getAttribute("loginCustomer");
		if (loginCustomer == null) {
	    	redirectAttributes.addFlashAttribute("msg", "로그인후 이용해 주세요 😭");
	    	return "redirect:log/login";
	    }
        if (loginCustomer != null) {
            String myId = String.valueOf(loginCustomer.getId());

            HashMap<String, String> param = new HashMap<>();
            param.put("id", myId);

            List<CustomerDTO> acceptedFriends = service.getAcceptedFriends(Integer.parseInt(myId));
            model.addAttribute("acceptedFriends", acceptedFriends);
            
            // Pending 친구 요청 목록 조회
            ArrayList<CustomerDTO> pendingList = service.findpending(param);
            model.addAttribute("pendingList", pendingList);
            
            ArrayList<CategoryDTO> categorylist = productService.categorylist();
    		model.addAttribute("categorylist", categorylist);
    		List<CartDTO> items = cartService.getCartItemsWithProduct(Integer.parseInt(myId));
            model.addAttribute("items", items);
        }
        return "friend";
	}
	@PostMapping("/acceptFriend")
	public String acceptFriend(@RequestParam("customer_id1") int customerId1, HttpSession session) {
		log.info("acceptFriend()");
	    CustomerDTO loginCustomer = (CustomerDTO) session.getAttribute("loginCustomer");
	    int customerId2 = loginCustomer.getId();  // 수락한 사람의 ID

	    HashMap<String, String> param = new HashMap<>();
	    param.put("customer_id1", String.valueOf(customerId1));
	    param.put("customer_id2", String.valueOf(customerId2));
	    log.info("customer_id1"+ String.valueOf(customerId1));
	    log.info("customer_id2"+ String.valueOf(customerId2));

	    service.updateFriendStatus(param);
	    return "redirect:/friend"; // 수락 후 친구 페이지 리다이렉트
	    
	}
	@PostMapping("/rejectFriend")
	public String rejectFriend(@RequestParam HashMap<String, String> param, HttpSession session) {
		log.info("rejectFriend()");
	    CustomerDTO loginCustomer = (CustomerDTO) session.getAttribute("loginCustomer");
	    int customerId2 = loginCustomer.getId();  // 나 (거절하는 사람)
	    
	    param.put("customer_id2", String.valueOf(customerId2));
	    
	    service.rejectFriend(param);
	    
	    return "redirect:/friend";  // 거절 후 다시 친구 페이지로
	}
	
	@PostMapping("/deleteFriend")
	public String deleteFriend(@RequestParam("friend_id") int friendId, HttpSession session) {
		log.info("deleteFriend()");
	    CustomerDTO loginCustomer = (CustomerDTO) session.getAttribute("loginCustomer");
	    int myId = loginCustomer.getId();

	    service.deleteFriend(myId, friendId); // 로직 넘김

	    return "redirect:/friend";
	}
	
	
}
