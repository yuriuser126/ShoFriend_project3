package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.LogDAO;
import com.boot.dto.CustomerDTO;
import com.boot.dto.SellerDTO;


/**
*loginYn:
*
* 25/04/08 성유리 로그인 임플서비스 클래스
*/

@Service("LogService")
public class LogServiceImpl implements LogService {
	@Autowired
	private SqlSession sqlSession;
	
	
//*25.04.10 성유리 dao.login -> dao.logYn 수정
	@Override
	public ArrayList<CustomerDTO> loginYn(HashMap<String, String> param) {
		LogDAO dao = sqlSession.getMapper(LogDAO.class);
		ArrayList<CustomerDTO> list = dao.loginYn(param);

		return list;
	}
	
	@Override
	public ArrayList<SellerDTO> loginYns(HashMap<String, String> param) {
		LogDAO dao = sqlSession.getMapper(LogDAO.class);
		ArrayList<SellerDTO> lists = dao.loginYns(param);
		
		return lists;
	}


	@Override
	public CustomerDTO doFindId(HashMap<String, String> param) {
		LogDAO dao = sqlSession.getMapper(LogDAO.class);		
		CustomerDTO dto = dao.doFindId(param);
		return dto;
	}

	@Override
	public void searchId(HashMap<String, String> param) {
		LogDAO dao = sqlSession.getMapper(LogDAO.class);		
		dao.searchId(param);
	}

	@Override
	public SellerDTO doFindIds(HashMap<String, String> param) {
		LogDAO dao = sqlSession.getMapper(LogDAO.class);		
		SellerDTO dto = dao.doFindIds(param);
		return dto;
	}

	@Override
	public void searchIds(HashMap<String, String> param) {
		LogDAO dao = sqlSession.getMapper(LogDAO.class);		
		dao.searchIds(param);
		
	}

	@Override
	public CustomerDTO doFindPw(HashMap<String, String> param) {
		LogDAO dao = sqlSession.getMapper(LogDAO.class);		
		CustomerDTO dto = dao.doFindPw(param);
		return dto;
	}

	@Override
	public void searchPw(HashMap<String, String> param) {
		LogDAO dao = sqlSession.getMapper(LogDAO.class);		
		dao.searchPw(param);
		
	}

	@Override
	public SellerDTO doFindPws(HashMap<String, String> param) {
		LogDAO dao = sqlSession.getMapper(LogDAO.class);		
		SellerDTO dto = dao.doFindPws(param);
		return dto;
	}

	@Override
	public void searchPws(HashMap<String, String> param) {
		LogDAO dao = sqlSession.getMapper(LogDAO.class);		
		dao.searchPws(param);
		
	}
	
//	 25.04.11 성유리 RegiServiceImpl > LogServiceImpl 추가 수정
//	 25.04.08 김채윤 RegiServiceImpl 추가

	@Override
	public int emailCheck(String email) {
		LogDAO mapper = sqlSession.getMapper(LogDAO.class);
		int cnt = mapper.emailCheck(email);
		System.out.println("cnt: "+cnt);
		return cnt;
	}

	@Override
	public void write(HashMap<String, String> param) {
		LogDAO dao=sqlSession.getMapper(LogDAO.class);
		dao.write(param);
		
	}

	@Override
	public void sell_write(HashMap<String, String> param) {
		LogDAO dao=sqlSession.getMapper(LogDAO.class);
		dao.sell_write(param);		
	}


}