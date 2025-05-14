package com.boot.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import com.boot.dto.CartDTO;
import com.boot.dto.OrdersDTO;

public interface CartService {
	public void addToCart(HashMap<String, Object> param);
    public List<CartDTO> getCartItems(HashMap<String, String> param);
    public CartDTO findItem(HashMap<String, Object> param);
    public void updateQuantity(HashMap<String, Object> param);
    public List<CartDTO> getCartItemsWithProduct(int user_id);
    public void deleteSoldOut(int user_id);
	public void deleteSelectedItems(List<Integer> selectedIds, int user_id);
	List<CartDTO> getCartItemsByIds(List<Integer> cartItemIds, int userId); 
}
