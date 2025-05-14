package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.FriendDAO;
import com.boot.dao.OrdersDAO;
import com.boot.dao.ProductDAO;
import com.boot.dto.CustomerDTO;

@Service("FriendService")
public class FriendServiceImpl implements FriendService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public CustomerDTO findByEmail(String email) {
		FriendDAO dao = sqlSession.getMapper(FriendDAO.class);
		return dao.findByEmail(email);
	}

	@Override
	public void insertFriend(int id1, int id2, String status) {
		FriendDAO dao = sqlSession.getMapper(FriendDAO.class);
	    Map<String, Object> map = new HashMap<>();
	    map.put("customer_id1", id1);
	    map.put("customer_id2", id2);
	    map.put("status", status);
	    dao.insertFriend(map);

	}

	@Override
	public ArrayList<CustomerDTO> findpending(HashMap<String, String> param) {
		FriendDAO dao = sqlSession.getMapper(FriendDAO.class);
		return dao.findpending(param);
	}

	@Override
	public void updateFriendStatus(HashMap<String, String> param) {
		FriendDAO dao = sqlSession.getMapper(FriendDAO.class);
		dao.updateFriendStatus(param);
	}

	@Override
	public List<CustomerDTO> getAcceptedFriends(int id) {
		FriendDAO dao = sqlSession.getMapper(FriendDAO.class);
		return dao.getAcceptedFriends(id);
	}

	@Override
	public void rejectFriend(HashMap<String, String> param) {
		FriendDAO dao = sqlSession.getMapper(FriendDAO.class);
		dao.rejectFriend(param);
	}

	@Override
	public void deleteFriend(int myId, int friendId) {
		FriendDAO dao = sqlSession.getMapper(FriendDAO.class);
		int smaller = Math.min(myId, friendId);
	    int larger = Math.max(myId, friendId);

	    HashMap<String, String> param = new HashMap<>();
	    param.put("customer_id1", String.valueOf(smaller));
	    param.put("customer_id2", String.valueOf(larger));

	    dao.deleteFriend(param);
	}

	@Override
	public List<Map<String, Object>> getFriendRecentOrders(int currentCustomerId) {
		FriendDAO dao = sqlSession.getMapper(FriendDAO.class);
		return dao.getFriendRecentOrders(currentCustomerId);
	}	
}
