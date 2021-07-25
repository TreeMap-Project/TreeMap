package com.spring.treemap.domain;

import lombok.Data;

@Data
public class CategoryVO {
	private int userNo;
	private int catNo;
	private String iconUrl;
	private String catName;
	private String createdAt;
	
	
	private int startNum=0;
	
	private int endNum=4;
}
