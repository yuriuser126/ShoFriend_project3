package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.boot.dto.CustomerDTO;

public interface FriendService {
	public CustomerDTO findByEmail(String email);
	public void insertFriend(int id1, int id2, String status);
	public ArrayList<CustomerDTO> findpending(HashMap<String, String> param);
	public void updateFriendStatus(HashMap<String, String> param);
	public List<CustomerDTO> getAcceptedFriends(int id);
	public void rejectFriend(HashMap<String, String> param);
	void deleteFriend(int myId, int friendId);
	public List<Map<String, Object>> getFriendRecentOrders(int currentCustomerId);
}
