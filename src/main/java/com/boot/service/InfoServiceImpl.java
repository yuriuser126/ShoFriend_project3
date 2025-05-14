package com.boot.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.InfoDAO;


@Service("InfoService")
public class InfoServiceImpl implements InfoService{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void updatePwd(HashMap<String, String> param) {
		InfoDAO dao = sqlSession.getMapper(InfoDAO.class);
		dao.updatePwd(param);
	}

	@Override
	public void updateInfo(HashMap<String, String> param) {
		InfoDAO dao = sqlSession.getMapper(InfoDAO.class);
		dao.updateInfo(param);
	}
	
	@Override
	public void updateCustomerAddress(HashMap<String, String> param) {
		InfoDAO dao = sqlSession.getMapper(InfoDAO.class);
		dao.updateCustomerAddress(param);
	}

	
	@Override
	public void updatePwd2(HashMap<String, String> param) {
		InfoDAO dao = sqlSession.getMapper(InfoDAO.class);
		dao.updatePwd2(param);
	}
	
	@Override
	public void updateInfo2(HashMap<String, String> param) {
		InfoDAO dao = sqlSession.getMapper(InfoDAO.class);
		dao.updateInfo2(param);
	}

}