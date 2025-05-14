package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.CustomerDTO;
import com.boot.dto.SellerDTO;

//* 추상클래스 로그인 서비스 sql
//* 25.04.08 성유리 로그인 dao
//* 25.04.10 성유리 추상클래스 이름login -> logYn 수정
//*25.04.11 성유리 RegiDAO > LogDAO추가 수정
public interface LogDAO {
	public ArrayList<CustomerDTO> loginYn(HashMap<String, String> param);
	public ArrayList<SellerDTO> loginYns(HashMap<String, String> param);
	public CustomerDTO doFindId(HashMap<String, String> param) ;
	public void searchId(HashMap<String, String> param);
	public SellerDTO doFindIds(HashMap<String, String> param) ;
	public void searchIds(HashMap<String, String> param);
	public CustomerDTO doFindPw(HashMap<String, String> param) ;
	public void searchPw(HashMap<String, String> param);
	public SellerDTO doFindPws(HashMap<String, String> param) ;
	public void searchPws(HashMap<String, String> param);
	
//*	25.04.08 김채윤 RegiDAO 추가
	public int emailCheck(String email);
	public void write(HashMap<String, String> param);
	public void sell_write(HashMap<String, String> param);
}