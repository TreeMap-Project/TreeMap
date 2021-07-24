package com.spring.treemap.domain;

import lombok.Data;

@Data
public class Page {
	// 현재 페이지 번호
	private int num;

	// 게시물 총 갯수
	private int count;

	// 한 페이지에 출력할 게시물 갯수
	private int postNum = 8;

	// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
	private int pageNum;

	// 출력할 게시물
	private int displayPost;

	// 한번에 표시할 페이징 번호의 갯수
	private int pageNumCnt = 10;

	// 표시되는 페이지 번호 중 마지막 번호
	private int endPageNum;

	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPageNum;

	// 다음/이전 표시 여부
	private boolean prev;
	private boolean next;

	private String searchType;
	private String keyword;

	

	/*
	 * private String keyword;
	 * 
	 * public void setKeyword(String keyword) { System.out.println(keyword);
	 * if(keyword.equals("")) { this.keyword = ""; }else { this.keyword =
	 * "&keyword="+keyword; } }
	 * 
	 * public String getKeyword() { return keyword; }
	 */

	public void setCount(int count) {
		this.count = count;
		dataCalc();
	}

	private void dataCalc() {
		// ((올림)현재페이지 번호 / 하단에 나눌 페이지 번호) * 한번에 표시할 페이징 번호의 갯수
		// 마지막 번호
		endPageNum = (int) (Math.ceil((double) num / (double) pageNumCnt) * pageNumCnt);

		// 시작 번호 마지막번호 - (10 -1)
		startPageNum = endPageNum - (pageNumCnt - 1);

		// 마지막 번호 재계산 (총개수/10) 데이터가 없는대 11~20으로 나오면 안되서
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNumCnt));
		// 만약 마지박번호가 마지막번호 재계산한거보다 크다면 마지막번호는 재계산한걸로
		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		System.out.println(endPageNum_tmp);
		System.out.println(endPageNum);

		// 다음
		prev = startPageNum == 1 ? false : true;

		// 이전 (마지막번호 * 10)이 총 개시물 수보다 크면
		next = endPageNum * pageNumCnt >= count ? false : true;

		displayPost = (num - 1) * postNum;

	}
}
