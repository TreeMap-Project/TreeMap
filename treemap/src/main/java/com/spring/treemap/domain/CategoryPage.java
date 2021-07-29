package com.spring.treemap.domain;

import lombok.Data;

@Data
public class CategoryPage {

	private int num = 1;

	private int endNum = 4;

	private int startNum = 0;

	public void setNum(int num) {
		this.num = num;
		setStartNum(num);
	}

	public void setStartNum(int num) {
		this.startNum = (num - 1) * endNum;
	}

}
