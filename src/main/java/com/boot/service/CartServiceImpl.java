package com.boot.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.CartDAO;
import com.boot.dao.OrdersDAO;
import com.boot.dto.CartDTO;
import com.boot.dto.OrdersDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("CartService")
public class CartServiceImpl implements CartService {

    @Autowired
    private SqlSession sqlSession;



	@Override
	public void addToCart(HashMap<String, Object> param) {
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
//		dao.insertCartItem(param);
		CartDTO existing = dao.findItem(param);
		if (existing != null) {
			int existingQty = existing.getQuantity();
			int newQty = existingQty+ Integer.parseInt(param.get("quantity").toString());
			param.put("quantity", newQty);
			dao.updateQuantity(param);
		} else {
			dao.insertCartItem(param);
		}
		
	}

	@Override
	public List<CartDTO> getCartItems(HashMap<String, String> param) {
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		return dao.getCartItems(param);
	}

	@Override
	public CartDTO findItem(HashMap<String, Object> param) {
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		return dao.findItem(param);
	}

	@Override
	public void updateQuantity(HashMap<String, Object> param) {
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		dao.updateQuantity(param);
	}



	@Override
	public void deleteSelectedItems(List<Integer> selectedIds, int user_id) {
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		Map<String, Object> param = new HashMap<>();
		param.put("selectedIds", selectedIds);
		param.put("user_id", user_id);
		dao.deleteSelectedItems(param);
		
	}

	@Override
	public List<CartDTO> getCartItemsWithProduct(int user_id) {
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		return dao.getCartItemsWithProduct(user_id);
	}

	@Override
	public void deleteSoldOut(int user_id) {
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		dao.deleteSoldOut(user_id);
		
	}

	@Override
	public List<CartDTO> getCartItemsByIds(List<Integer> cartItemIds, int userId) {
		log.info("getCartItemsByIds_sercvice");
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		log.info("cartItemIds=>"+cartItemIds);
		log.info("userId=>"+userId);
		return dao.selectCartItemsByIds(cartItemIds, userId);
	}
}
