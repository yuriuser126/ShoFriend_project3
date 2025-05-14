package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.boot.dto.ProductDTO;
import com.boot.dto.StoreDTO;

public interface StoreDAO {
	
	public ArrayList<StoreDTO> store_list(int seller_id);
	public void store_write(HashMap<String, String> param);
	public StoreDTO store_view(HashMap<String, String> param);
	public void store_modify(HashMap<String, String> param);
	public void store_delete(HashMap<String, String> param);
	public String getStoreNameById(int storeId);
	public List<StoreDTO> getStoresBySellerId(int sellerId);
	List<ProductDTO> getProductsByStoreId(int storeId);
}