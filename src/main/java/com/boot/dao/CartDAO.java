package com.boot.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.boot.dto.CartDTO;
import com.boot.dto.OrdersDTO;

public interface CartDAO {
	public CartDTO findItem(HashMap<String, Object> param);
	public void insertCartItem(Map<String, Object> param);
	public void updateQuantity(Map<String, Object> param);
	public List<CartDTO> getCartItems(HashMap<String, String> param);
	public List<CartDTO> getCartItemsWithProduct(int user_id);
	public void deleteSoldOut(int user_id);
	public void deleteSelectedItems(Map<String, Object> param);
	List<CartDTO> selectCartItemsByIds(@Param("cartItemIds") List<Integer> cartItemIds, @Param("userId") int userId);
}
