package com.lgy.shallweshare.admin.dto;

import lombok.Getter;

@Getter
public class PageDTO {
	//페이지번호가 10개씩 보이게 (1~10, 11~20)
	private int startPage;//시작페이지: 1, 11
	private int endPage;//끝페이지: 10, 20
	private boolean prev, next;
	private int total;
	private Criteria cri;// 화면에 출력 갯수
	
	public PageDTO(int total, Criteria cri) {
		this.total = total;
		this.cri = cri;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
//		ex> 3페이지=3/10->0.3 -> 1 * 10 =10(끝페이지)
//		ex> 11페이지=11/10->1.1 -> 2 * 10 =20(끝페이지)
		
		this.startPage = this.endPage - 9;
//		ex> 10 - 9 = 1페이지
//		ex> 20 - 9 = 11페이지
		
		int realEnd = (int)(Math.ceil((total*1.0) / cri.getAmount()));
//		ex>total: 70, 현재 페이지: 3 -> endPage: 10 => 70*1.0 / 10 => 7페이지
//		ex>total: 300, 현재 페이지: 3 -> endPage: 10 => 300*1.0 / 10 => 30페이지
		
		if (realEnd <= this.endPage) {
			this.endPage=realEnd;
		}
//		ex>7페이지 <= 10페이지 : endPage: 7페이지
//		ex>30페이지 <= 10페이지 : endPage: 10페이지
		
		this.prev = this.startPage > 1;
//		1페이지보다 크면 존재 -> 참이고 아님  거짓으로 없음
		
		this.next = this.endPage < realEnd;
//		ex>10페이지 < 30페이지
	}
}
