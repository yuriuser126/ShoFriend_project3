package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
//@NoArgsConstructor 기본생성자 따로 만들기 위해 주석처리
public class Criteria {
	private int pageNum;//페이지 번호
	private int amount;//페이지 글 개수 int 해줘야함
	
	
	private String type; //타입을 준다
	private String keyword; //'kim ''shin' 등 키워드를 준다.
	
	
	//기본 생성자 초기값주기위해 막음
	public Criteria() {
//		1페이지당 10개
		this(1,10);
	}


	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	

}

