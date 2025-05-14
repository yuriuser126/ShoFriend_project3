package com.boot.controller;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.dto.CartDTO;
import com.boot.dto.CategoryDTO;
import com.boot.dto.CustomerDTO;
import com.boot.dto.OrderItemDTO;
import com.boot.dto.OrdersDTO;
import com.boot.dto.ProductDTO;
import com.boot.service.CartService;
import com.boot.service.CartServiceImpl;
import com.boot.service.OrdersService;
import com.boot.service.ProductService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.mysql.cj.Session;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CartController {

    private final CartServiceImpl CartService;

    @Autowired
    private ProductService productService;
	@Autowired
	private CartService service;

    CartController(CartServiceImpl CartService) {
        this.CartService = CartService;
    }

	@RequestMapping(value = "/addToCart", method = RequestMethod.POST)
	public String addToCart(@RequestParam("product_id") int product_id,
							@RequestParam("product_title") String product_title,
							@RequestParam("product_price") int product_price,
							@RequestParam("quantity") int quantity,
							HttpSession session,
							RedirectAttributes redirectAttributes) {
		log.info("addToCart()");

		
		CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
	    if (customer == null) {
	    	redirectAttributes.addFlashAttribute("msg", "로그인후 이용해 주세요 😭");
	    	return "redirect:log/login";
	    }
	    

	    log.info("getId", customer.getId());

		
	    HashMap<String, Object> param = new HashMap<>();
	    param.put("user_id", customer.getId());
	    param.put("product_id", product_id);
	    param.put("product_title", product_title);
	    param.put("price", product_price);
	    param.put("quantity", quantity);
		service.addToCart(param);
        redirectAttributes.addFlashAttribute("msg", "선택된 상품이 장바구니에 담겼습니다!");
		return "redirect:main";
	}
	
	@RequestMapping("/cart_view")
	public String viewCart(HttpSession session, Model model){
		CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
		log.info("@# cart_view()");
		
		if (customer == null) {
			return "redirect:log/login";
		}
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("user_id", String.valueOf(customer.getId()));
		int user_id = customer.getId();
//		List<CartDTO> items = service.getCartItems(param);
		List<CartDTO> items = service.getCartItemsWithProduct(user_id);
		model.addAttribute("items", items);
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		
		return "cart_view";
	}
	
	@PostMapping("/cartAction")
    public String handleCartAction(@RequestParam("selectedIds") List<Integer> selectedIds,
                                 @RequestParam("submitType") String submitType,
                                 HttpServletRequest request,
                                 HttpSession session,
                                 RedirectAttributes redirectAttributes) {
        CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
        if (customer == null) {
            redirectAttributes.addFlashAttribute("msg", "로그인 후 이용해 주세요!");
            return "redirect:/log/login";
        }

        if (selectedIds == null || selectedIds.isEmpty()) {
            redirectAttributes.addFlashAttribute("msg", "선택된 항목이 없습니다.");
            return "redirect:/cart_view";
        }

        if (submitType.equals("order")) {
            StringBuilder redirectURL = new StringBuilder("/pay/checkout?");
            List<Integer> productIdsList = new ArrayList<>();
            List<Integer> quantitiesList = new ArrayList<>();

            int userId = customer.getId();
            List<CartDTO> cartItems = service.getCartItemsByIds(selectedIds, userId);

            for (CartDTO cartItem : cartItems) {
                String quantityParamName = "cart_quantity_" + cartItem.getId();
                String quantityStr = request.getParameter(quantityParamName);
                if (quantityStr != null && !quantityStr.isEmpty()) {
                    try {
                        int quantity = Integer.parseInt(quantityStr);
                        productIdsList.add(cartItem.getProduct_id());
                        quantitiesList.add(quantity);
                    } catch (NumberFormatException e) {
                        redirectAttributes.addFlashAttribute("msg", "잘못된 수량 정보가 있습니다.");
                        return "redirect:/cart_view"; // 에러 발생 시 바로 리턴
                    }
                } else {
                    redirectAttributes.addFlashAttribute("msg", "수량 정보가 없습니다.");
                    return "redirect:/cart_view";
                }
            }
            session.setAttribute("selectedIdsToDelete", selectedIds);
            
            try { // productIdsList, quantitiesList  확정 후 urlencode
                for (int i = 0; i < productIdsList.size(); i++) {
                    redirectURL.append(URLEncoder.encode("product_id[]", StandardCharsets.UTF_8)).append("=")
                            .append(URLEncoder.encode(String.valueOf(productIdsList.get(i)), StandardCharsets.UTF_8)).append("&");
                    redirectURL.append(URLEncoder.encode("quantity[]", StandardCharsets.UTF_8)).append("=")
                            .append(URLEncoder.encode(String.valueOf(quantitiesList.get(i)), StandardCharsets.UTF_8)).append("&");
                }

                // 마지막 '&' 제거
                if (redirectURL.length() > "/pay/checkout?".length()) {
                    redirectURL.deleteCharAt(redirectURL.length() - 1);
                }

                return "redirect:" + redirectURL.toString();

            } catch (Exception e) {
                // URL 인코딩 실패 시 예외 처리
                redirectAttributes.addFlashAttribute("msg", "주문 처리 중 오류가 발생했습니다.");
                return "redirect:/cart_view";
            }

        } else if (submitType.equals("delete")) {
            service.deleteSelectedItems(selectedIds, customer.getId());
            redirectAttributes.addFlashAttribute("msg", "선택된 항목이 삭제되었습니다.");
        }
        return "redirect:/cart_view";
    }

	//원래장바구니코드
//	@PostMapping("/cartAction")
//	public String handleCartAction(@RequestParam("selectedIds") List<Integer> selectedIds
//								  ,@RequestParam("submitType") String submitType
//								  ,HttpSession session
//								  ,RedirectAttributes redirectAttributes) {
//		CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
//		if (customer == null) {
//			redirectAttributes.addFlashAttribute("msg","로그인 후 이용해 주세요");
//			return "redirect:/log/login";
//		}
//		
//		if (selectedIds == null || selectedIds.isEmpty()) {
//			redirectAttributes.addFlashAttribute("msg", "선택된 항목이 없습니다.");
//			return "redirect:/cart_view";
//		}
//		if (submitType.equals("order")) {
//			session.setAttribute("orderItems", selectedIds);
//			return "redirect:/order_view";
//		
//		}else if (submitType.equals("delete")) {
////			service.deleteSelectedItems(selectedIds);
//			service.deleteSelectedItems(selectedIds, customer.getId());
//			redirectAttributes.addFlashAttribute("msg","선택된 항목이 삭제되었습니다.");
//		}
//		return "redirect:/cart_view";
//	}
	

	@PostMapping("/deleteSoldOut")
	public String deleteSoldOut(HttpSession session) {
		CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
		if (customer != null) {
			service.deleteSoldOut(customer.getId());
		}
		return "redirect:/cart_view";
	}
	

}
