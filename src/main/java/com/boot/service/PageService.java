package com.boot.service;

import java.util.ArrayList;

import com.boot.dto.Criteria;
import com.boot.dto.ProductDTO;

public interface PageService {
//	Criteria 객체를 이용해서 페이징 처리 
	//게시글 가져가야하니까 보드디티오 / 
	//만든거 criteria 쓰겠다. 페이지 번호랑 글개수로 페이징 처릭하겟다
	public ArrayList<ProductDTO> listWithPaging(Criteria cri);
	//총 글개수 쿼리 아이디 그대로 들고옴 리턴타입 인트
	public int getTotalCount(Criteria cri);
	
}
