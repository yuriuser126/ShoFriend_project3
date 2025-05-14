package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.StoreDAO;
import com.boot.dto.ProductDTO;
import com.boot.dto.StoreDTO;

@Service("StoreService")
public class StoreServiceImpl implements StoreService{

	@Autowired
	private SqlSession sqlSession;

	//점포 등록
	@Override
	public void store_write(HashMap<String, String> param) {
		StoreDAO dao=sqlSession.getMapper(StoreDAO.class);
		dao.store_write(param);
		
	}


	//등록한 점포 리스트
	@Override
	public ArrayList<StoreDTO> store_list(int seller_id) {
		StoreDAO dao=sqlSession.getMapper(StoreDAO.class);
		ArrayList<StoreDTO> store_list = dao.store_list(seller_id);
		return store_list;
	}
	
	@Override
	public List<ProductDTO> getProductsByStoreId(int storeId) {
		StoreDAO dao=sqlSession.getMapper(StoreDAO.class);
	    return dao.getProductsByStoreId(storeId);
	}
	








	//점포 수정
	@Override
	public void store_modify(HashMap<String, String> param) {
		StoreDAO dao=sqlSession.getMapper(StoreDAO.class);
		dao.store_modify(param);
		
	}


	//점포 삭제
	@Override
	public void store_delete(HashMap<String, String> param) {
		StoreDAO dao=sqlSession.getMapper(StoreDAO.class);
		dao.store_delete(param);
	}

	//점포수정 화면
	@Override
	public StoreDTO store_view(HashMap<String, String> param) {
		StoreDAO dao=sqlSession.getMapper(StoreDAO.class);
		StoreDTO dto = dao.store_view(param);
		return dto;
	}


	@Override
	public String getStoreNameById(int storeId) {
		StoreDAO dao=sqlSession.getMapper(StoreDAO.class);
		return dao.getStoreNameById(storeId);
	}


	@Override
	public List<StoreDTO> getStoresBySellerId(int sellerId) {
		StoreDAO dao=sqlSession.getMapper(StoreDAO.class);
		return dao.getStoresBySellerId(sellerId);
	}











	
}