package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.boot.dto.CategoryDTO;
import com.boot.dto.ProductDTO;
import com.boot.dto.ProductPopularity;

public interface ProductService {
	/*
	* (메소드 동작 방식 기재)
	* 작성일      작성자   개발내용,수정내용
	* 25/04/10    우주연   메소드 9개 제작
	*/
	public ArrayList<ProductDTO> product_list();
	public ArrayList<ProductDTO> select50percentSaleItems();
	public void product_write(HashMap<String, String> param);
	public String saveImage(MultipartFile picture);
	public ArrayList<CategoryDTO> categorylist();
	public ProductDTO getProductById(int product_id);
	public ArrayList<ProductDTO> selectFlashSaleItems();
	public void product_modify(HashMap<String, String> param);
	public String modifyImage(HashMap<String, String> param, MultipartFile picture);
	public void product_delete(int id);
	public List<ProductDTO> getAllProducts();//목록 불러오는 테스트용 임시 메소드 입니다. 삭제해도됨.-25.04.10 권준우
    public List<ProductDTO> getProductListTop10();//목록 10개 불러오는 테스트용 임시 메소드 입니다. 삭제해도됨.-25.04.11 권준우
//    public void insertOrder(HashMap<String, String> param);
    public int getPriceByProductId(int productId);
    void decreaseStock(int productId, int quantity);
    public List<ProductDTO> getPopularProducts();
    public ProductDTO findTopDiscountProductNearExpiration();
    public void addRecommend(int productId, int recommendCount);

    List<ProductDTO> getAllProductsSorted(int limit, int offset, String sort);	// 상품 리스트 페이징&분류
    int countAllProducts();	// 총 상품 개수
    List<ProductDTO> getProductsByCategorySorted(int categoryId, int limit, int offset, String sort);	// 카테고리별 상품 리스트 페이징&분류
    int countProductsByCategory(int categoryId);	// 카테고리별 총 상품 개수
    List<ProductDTO> getLatestProducts();
    
    List<ProductDTO> searchProductsByCategory(int categoryId, String keyword, int limit, int offset, String sort);	// 검색시 상품 리스트 페이징&분류
    int countSearchedProductsByCategory(int categoryId, String keyword);	// 검색시 총 상품 개수
    List<ProductDTO> searchAllProducts(String keyword, int limit, int offset, String sort);	// 검색시 카테고리별 상품 리스트 페이징&분류
    int countAllSearchedProducts(String keyword);	// 검색시 카테고리별 총 상품 개수

    List<CategoryDTO> getAllCategories();	// 카테고리 목록
    Map<Integer, Integer> countProductsByAllCategories();	// 카테고리 개수
}
