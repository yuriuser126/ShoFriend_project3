package com.boot.dao;

import java.util.HashMap;

public interface InfoDAO {
	public void updatePwd(HashMap<String, String> param);
	public void updateInfo(HashMap<String, String> param);
	public void updateCustomerAddress(HashMap<String, String> param);
	public void updatePwd2(HashMap<String, String> param);
	public void updateInfo2(HashMap<String, String> param);
}