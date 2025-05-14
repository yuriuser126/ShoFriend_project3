package com.boot.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.dto.CartDTO;
import com.boot.dto.CategoryDTO;
import com.boot.dto.CustomerDTO;
import com.boot.dto.ProductDTO;
import com.boot.dto.ReviewDTO;
import com.boot.dto.SellerDTO;
import com.boot.dto.StoreDTO;
import com.boot.service.CartService;
import com.boot.service.FriendService;
import com.boot.service.ProductService;
import com.boot.service.ReviewService;
import com.boot.service.StoreService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
/*
* 작성일      작성자   개발내용,수정내용
* 25/04/07    우주연   main, category, product_insert, product_modify 
* 25/04/10    우주연   product_write, product_delete, product_modify_ok , content
* 25/04/14    우주연   세션 추가
*/
	
	@Autowired
	private ProductService productService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private FriendService friendService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private CartService cartService;
	
	// 25.05.12 권준우 수정(인기 상품 목록에 별점 정보 가져와서 노출되도록 추가)
	@RequestMapping("/main")
	public String main(Model model,HttpSession session) {
		log.info("main()");
		
		List<ProductDTO> popularlist= productService.getPopularProducts();
		List<ProductDTO> latestProducts = productService.getLatestProducts();	// 최근상품에도 리뷰 추가 
		
		//	별점 연동
		Map<Integer, Double> avgRatings = new HashMap<>();
		Map<Integer, Integer> reviewCounts = new HashMap<>();
		for (ProductDTO product : popularlist) {
			int productId = product.getId();
			
			int count = reviewService.getReviews(productId).size();
			Double avg = reviewService.getAverageRating(productId);
			
			avgRatings.put(productId, avg != null ? avg : 0.0);
			reviewCounts.put(productId, count);
		}
		for (ProductDTO product : latestProducts) {
			int productId = product.getId();
			
			Double avg = reviewService.getAverageRating(productId);
			int count = reviewService.getReviews(productId).size();
			
			avgRatings.put(productId, avg != null ? avg : 0.0);
			reviewCounts.put(productId, count);
		}
		model.addAttribute("avgRatings", avgRatings);
		model.addAttribute("reviewCounts", reviewCounts);
		
		//살포시 없애보았음
//		model.addAttribute("popularlist", popularlist);
		
//		ArrayList<ProductDTO> list = service.product_list();
//		model.addAttribute("list", list);
//		
		ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		
		ArrayList<ProductDTO> flashlist = productService.selectFlashSaleItems();
		model.addAttribute("flashlist", flashlist);
		
		ProductDTO TopDiscountProduct = productService.findTopDiscountProductNearExpiration();
		model.addAttribute("TopDiscountProduct", TopDiscountProduct);
		
		ProductDTO latestProduct = null;
        if (!latestProducts.isEmpty()) {
            latestProduct = latestProducts.get(0);
        }
        model.addAttribute("latestProduct", latestProduct);
		
        List<Map<String, Object>> combinedProducts = new ArrayList<>();

        // 인기 상품 그룹
        Map<String, Object> popularGroup = new HashMap<>();
        popularGroup.put("title", "인기 상품");
        popularGroup.put("description", "가장 많이 팔린 상품이에요");
        popularGroup.put("products", popularlist);
        combinedProducts.add(popularGroup);

        // 최근 등록 상품 그룹
        Map<String, Object> latestGroup = new HashMap<>();
        latestGroup.put("title", "최근 등록 상품");
        latestGroup.put("description", "새롭게 등록된 상품들이에요");
        latestGroup.put("products", latestProducts);
        combinedProducts.add(latestGroup);
        
        model.addAttribute("combinedProducts", combinedProducts);
        model.addAttribute("categorylist", productService.categorylist());
        
		//로그인인 경우 친구추천상품, 장바구니 출력함
		CustomerDTO loginCustomer = (CustomerDTO) session.getAttribute("loginCustomer");
        if (loginCustomer != null) {
            int currentCustomerId = loginCustomer.getId();
            List<Map<String, Object>> friendRecentOrders = friendService.getFriendRecentOrders(currentCustomerId);
            List<CartDTO> items = cartService.getCartItemsWithProduct(currentCustomerId);
            model.addAttribute("items", items);
            
            if (!friendRecentOrders.isEmpty()) {
                Map<String, Object> latestFriendOrder = friendRecentOrders.get(0);
                int productId = (int) latestFriendOrder.get("product_id");
                ProductDTO friendOrderProduct = productService.getProductById(productId);
                log.info("friendOrderProduct()"+friendOrderProduct);
                model.addAttribute("friendOrderProduct", friendOrderProduct);
            }
        }
        
		
		return ("main");
	}
	
	@RequestMapping("/category")
	public String category(@RequestParam(name = "categoryId", required = false) Integer categoryId,
							@RequestParam(name = "keyword", required = false) String keyword,
							@RequestParam(name = "page", defaultValue = "1") int page,
							@RequestParam(name = "sort", defaultValue = "recommend") String sort,
							Model model, HttpSession session) {
		log.info("category()");
		
		List<ProductDTO> popularlist= productService.getPopularProducts();
		model.addAttribute("popularlist", popularlist);
		
		ArrayList<ProductDTO> flashlist = productService.selectFlashSaleItems();
		model.addAttribute("flashlist", flashlist);
		
	    ArrayList<CategoryDTO> categorylist = productService.categorylist();
		model.addAttribute("categorylist", categorylist);
		
		ArrayList<ProductDTO> sale50list = productService.select50percentSaleItems();
		model.addAttribute("sale50list", sale50list);
		
//		기존 list 조회 메서드 폐기 - 25.05.12 권준우
//		List<ProductDTO> list = service.product_list();
//		model.addAttribute("list", list);
		
// 		category&paging 처리 list - 25.05.12 권준우
		int pageSize = 30;
		int offset = (page - 1) * pageSize;
		
		List<ProductDTO> list;
		int totalCount;
		
		if (keyword != null && !keyword.isEmpty()) {
			// 검색 모드
			if (categoryId != null) {
				list = productService.searchProductsByCategory(categoryId, keyword, pageSize, offset, sort);
				totalCount = productService.countSearchedProductsByCategory(categoryId, keyword);
			} else {
				list = productService.searchAllProducts(keyword, pageSize, offset, sort);
				totalCount = productService.countAllSearchedProducts(keyword);
			}
			
		} else {
			// 검색 X
			if (categoryId != null) {
				list = productService.getProductsByCategorySorted(categoryId, pageSize, offset, sort);
				totalCount = productService.countProductsByCategory(categoryId);
			} else {
				list = productService.getAllProductsSorted(pageSize, offset, sort);
				totalCount = productService.countAllProducts();
			}			
		}

		int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		List<CategoryDTO> categoryList = productService.getAllCategories();
		Map<Integer, Integer> categoryCounts = productService.countProductsByAllCategories();

		model.addAttribute("list", list);
		model.addAttribute("categorylist", categoryList);
		model.addAttribute("categoryCounts", categoryCounts);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("sort", sort); // 선택 유지용
		
//		별점 연동 카테고리 페이지에도 구현 (list별로)
		Map<Integer, Double> avgRatings = new HashMap<>();
		Map<Integer, Integer> reviewCounts = new HashMap<>();
		
		for (ProductDTO product : list) {
			int productId = product.getId();
			
			int count = reviewService.getReviews(productId).size();
			Double avg = reviewService.getAverageRating(productId);
			
			avgRatings.put(productId, avg != null ? avg : 0.0);
			reviewCounts.put(productId, count);
		}
		for (ProductDTO product : popularlist) {
			int productId = product.getId();
			
			int count = reviewService.getReviews(productId).size();
			Double avg = reviewService.getAverageRating(productId);
			
			avgRatings.put(productId, avg != null ? avg : 0.0);
			reviewCounts.put(productId, count);
		}
		for (ProductDTO product : flashlist) {
			int productId = product.getId();
			
			Double avg = reviewService.getAverageRating(productId);
			int count = reviewService.getReviews(productId).size();
			
			avgRatings.put(productId, avg != null ? avg : 0.0);
			reviewCounts.put(productId, count);
		}
	
		model.addAttribute("avgRatings", avgRatings);
		model.addAttribute("reviewCounts", reviewCounts);
		
		//로그인인 경우 장바구니 출력함
		CustomerDTO loginCustomer = (CustomerDTO) session.getAttribute("loginCustomer");
        if (loginCustomer != null) {
            int currentCustomerId = loginCustomer.getId();
            List<CartDTO> items = cartService.getCartItemsWithProduct(currentCustomerId);
            model.addAttribute("items", items);
        }
        
		return ("category");
	}
	
	
	@RequestMapping("/product_insert")
	public String productInsert(HttpSession session, Model model,RedirectAttributes redirectAttributes) {
	    SellerDTO seller = (SellerDTO) session.getAttribute("loginSeller");
	    if (seller == null) {
	    	redirectAttributes.addFlashAttribute("msg", "판매자 로그인 후 이용해 주세요 😭");
	    	return "redirect:log/login";
	    }
	    
	    int sellerId = seller.getId();
	    // seller_id로 해당하는 가게 목록 조회
	    List<StoreDTO> stores = storeService.getStoresBySellerId(sellerId);
	    model.addAttribute("stores", stores);
  		ArrayList<CategoryDTO> categorylist = productService.categorylist();
  		model.addAttribute("categorylist", categorylist);
	    log.info("stores"+stores);

	    return "product_insert";
	}
	
	
	@RequestMapping("/product_modify")
	public String product_modify(@RequestParam("id") int product_id,Model model,HttpSession session,RedirectAttributes redirectAttributes) {
		log.info("product_modify()");
		SellerDTO seller = (SellerDTO) session.getAttribute("loginSeller");
	    if (seller == null) {
	    	redirectAttributes.addFlashAttribute("msg", "판매자 로그인 후 이용해 주세요 😭");
	    	return "redirect:log/login";
	    }
	    
	    int sellerId = seller.getId();
  		ArrayList<CategoryDTO> categorylist = productService.categorylist();
  		model.addAttribute("categorylist", categorylist);
		ProductDTO product = productService.getProductById(product_id); 
	    model.addAttribute("product", product); 
	    List<StoreDTO> stores = storeService.getStoresBySellerId(sellerId);
	    model.addAttribute("stores", stores);
		return ("product_modify");
	}
	
	
	@RequestMapping("/product_delete")
	public String product_delete(@RequestParam("id") int id,HttpSession session,RedirectAttributes redirectAttributes) {
		log.info("product_delete()");
		SellerDTO seller = (SellerDTO) session.getAttribute("loginSeller");
	    if (seller == null) {
	    	redirectAttributes.addFlashAttribute("msg", "판매자 로그인 후 이용해 주세요 😭");
	    	return "redirect:log/login";
	    }
	    
	    productService.product_delete(id);
		return ("redirect:/main");
	}
	
	@RequestMapping("/product_modify_ok")
	@ResponseBody
	public String product_modify_ok(
	        @RequestParam HashMap<String, String> param,
	        @RequestParam("picture") MultipartFile picture) {

	    log.info("product_modify_ok()");

	    if (!picture.isEmpty()) {
	        String savedFileName = productService.modifyImage(param, picture);
	        param.put("picture", savedFileName);  // 새 이미지 파일명 DB에 저장
	    }

	    log.info("product_modify_okpicture()"+picture);
	    productService.product_modify(param);  // DB 업데이트
	    return "ok";
	}

	
//	25.05.09 권준우 수정 (친구 목록 조회, 리뷰 리스트, 별점 통계 추가)
	@RequestMapping("/content")
	public String content(@RequestParam("id") int product_id, Model model, HttpSession session) {
	    ProductDTO product = productService.getProductById(product_id);
	    model.addAttribute("product", product);

	    String storeName = storeService.getStoreNameById(product.getStore_id());
	    model.addAttribute("storeName", storeName); 

	    ArrayList<CategoryDTO> categorylist = productService.categorylist();
	    model.addAttribute("categorylist", categorylist);

	    // 로그인한 사용자 정보 가져오기
	    CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
	    if (customer != null) {
	        int myId = customer.getId();

	        // 친구 목록 조회 (이미 구현된 친구 서비스 사용)
	        List<CustomerDTO> myFriends = friendService.getAcceptedFriends(myId);
	        model.addAttribute("myFriends", myFriends);
	        
	        //05-13카트서비스에서 카트 상품 가져오기 전체페이지 추가
	        List<CartDTO> items = cartService.getCartItemsWithProduct(myId);
	        model.addAttribute("items", items);
	    }
            
	    
		// 리뷰 리스트 가져오기
		List<ReviewDTO> reviews = reviewService.getReviews(product_id);
		model.addAttribute("reviews", reviews);

		
		// 별점 통계 가져오기
		Map<String, Integer> ratingCounts = reviewService.getRatingCounts(product_id); // 1~5점 개수 map
		log.info("@# ratingCounts = " + ratingCounts);
		
		Double averageRatingObj = reviewService.getAverageRating(product_id);
		double averageRating = (averageRatingObj != null) ? averageRatingObj : 0.0;
		model.addAttribute("ratingCounts", ratingCounts);
		model.addAttribute("averageRating", averageRating);

		// 상품 클릭 시 추천 + 1
		productService.addRecommend(product_id, 1);
		
		return "content";
	}
	    
	
//	이미지파일을 받아서 화면에 출력(byte 배열타입)
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("@# display fileName=>"+fileName);
		
//		File file = new File("C:\\develop\\upload"+fileName);
		File file = new File("C:\\develop\\upload\\"+fileName);
		log.info("@# file=>"+file);
		
		ResponseEntity<byte[]> result=null;
		HttpHeaders headers = new HttpHeaders();
		
		try {
//			파일타입을 헤더에 추가
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
//			파일정보를 byte 배열로 복사+헤더정보+http상태 정상을 결과에 저장
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			log.debug("이미지 파일 읽기 오류 (파일 없음): {}", e.getMessage()); // debug 또는 trace
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return result;
	}
	
	private final ResourceLoader resourceLoader = null;
	
	@ExceptionHandler(NoSuchFileException.class)
    public ResponseEntity<Resource> handleNoSuchFileException(NoSuchFileException e) {
        log.error("파일을 찾을 수 없습니다: {}", e.getMessage());
        // 대체 이미지 응답
        Resource defaultImage = resourceLoader.getResource("classpath:static/assets/images/products/product-5.jpg");
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.IMAGE_JPEG); // 대체 이미지 형식에 맞게 설정
            return new ResponseEntity<>(defaultImage, headers, HttpStatus.OK);
        } catch (Exception ex) {
            log.error("대체 이미지 로드 실패: {}", ex.getMessage());
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 대체 이미지 로드 실패 시 500 응답
        }
    }
	
	@RequestMapping("/product_write")
	public String insert(
	    @RequestParam HashMap<String, String> param,
	    @RequestParam("picture") MultipartFile picture
	) {
	    log.info("product_write()");
	    if (!picture.isEmpty()) {
	        String savedFileName = productService.saveImage(picture);
	        param.put("picture", savedFileName);
	    }
	    productService.product_write(param);
	    return "redirect:/main";
	}
	
}
