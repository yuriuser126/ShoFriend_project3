package com.boot.dto;

import lombok.Data;

@Data
//@AllArgsConstructor 모든 프로퍼티를 가진생성자 막음
//@NoArgsConstructor 기본생성자 따로 만들기 위해 주석처리
public class PageDTO {
	//1번부터 10페이지까지 있으면 1이 시작페이지
	//11~20 이면 11이 시작페이지 넘버
	//끝은 10,20 임.
	private int startpage;//시작 페이지 번호 1,11
	private int endpage;//끝 페이지 번호 10,20
	
	private boolean prev,next; //이전 다음 참거짓으로 보이냐
	private int total;//300개면 10개씩 30페이지 30이 토탈
	
	private Criteria cri;//화면에 출력개수

	
	public PageDTO(int total, Criteria cri) {
		this.total = total;
		this.cri = cri;
		
		//ex> 3페이지 = 3/10 -> 0.3 -> 1*10 = 10 끝페이지
		//ex> 11페이지 = 11/10 -> 1.1 -> 2*10 = 20 끝페이지
		this.endpage = (int)(Math.ceil(cri.getPageNum() / 10.0))*10;
		
		//ex>10-9 = 1page
		//ex>20-9 = 11page
		this.startpage = this.endpage - 9;
		
		//실제페이지 
		//ex> total : 300, 현재페이지 : 3-> endPage : 10 => 300*1.0 / 10 => 30페이지
		//70개면 7페이지만 나와야하니까
		//ex> total : 300, 현재페이지 : 3-> endPage : 10 => 70*1.0 / 10 => 7페이지
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		
		//조건을 걸어준다.
		//ex>  7페이지 <= 10페이지 endPage : 7페이지
		//ex>  30페이지 <= 10페이지 endPage : 10페이지
		if (realEnd <= this.endpage) {
			this.endpage = realEnd;
		}
		
		//1페이지보다 크면 존재 -> 참이고 아님 거짓으로 얻음
		this.prev = this.startpage > 1;
		
		//ex> 10페이지 < 30페이지
		this.next = this.endpage < realEnd;
	}
	
	
	


}

