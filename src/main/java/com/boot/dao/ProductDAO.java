package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.boot.dto.CategoryDTO;
import com.boot.dto.ProductDTO;
import com.boot.dto.ProductPopularity;

public interface ProductDAO {
	/*
	* (메소드 동작 방식 기재)
	* 작성일      작성자   개발내용,수정내용
	* 25/04/10    우주연   메소드 9개 제작
	*/
	public ArrayList<ProductDTO> product_list();
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
    public int getPriceByProductId(int productId);
    public void decreaseStock(@Param("product_id") int productId, @Param("quantity") int quantity);
    public List<ProductDTO> getPopularProducts();
    public ProductDTO findTopDiscountProductNearExpiration();
    void addRecommend(Map<String, Object> param);
    List<ProductDTO> getAllProductsPaging(@Param("limit") int limit, @Param("offset") int offset);	// 상품 리스트 페이징
    int countAllProducts();	// 총 상품 개수
    List<ProductDTO> getProductsByCategoryPaging(@Param("categoryId") int categoryId, @Param("limit") int limit, @Param("offset") int offset);	// 카테고리별 상품 리스트 페이징
    int countProductsByCategory(int categoryId);	// 카테고리별 총 상품 개수
    List<ProductDTO> getLatestProducts();

    
    List<ProductDTO> getAllProductsSorted(@Param("limit") int limit,
    		@Param("offset") int offset,
    		@Param("sort") String sort);
    
    List<ProductDTO> getProductsByCategorySorted(@Param("categoryId") int categoryId,
    		@Param("limit") int limit,
    		@Param("offset") int offset,
    		@Param("sort") String sort);
    
    List<ProductDTO> searchProductsByCategory(@Param("categoryId") int categoryId,
			  @Param("keyword") String keyword,
			  @Param("limit") int limit,
			  @Param("offset") int offset,
			  @Param("sort") String sort);

	int countSearchedProductsByCategory(@Param("categoryId") int categoryId,
			@Param("keyword") String keyword);
	
	List<ProductDTO> searchAllProducts(@Param("keyword") String keyword,
		   @Param("limit") int limit,
		   @Param("offset") int offset,
		   @Param("sort") String sort);
	
	int countAllSearchedProducts(@Param("keyword") String keyword);

    
    List<CategoryDTO> getAllCategories();
    List<Map<String, Object>> countProductsByAllCategories();
    public ArrayList<ProductDTO> select50percentSaleItems();
}
