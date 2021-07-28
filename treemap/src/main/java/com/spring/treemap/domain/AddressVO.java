package com.spring.treemap.domain;

import lombok.Data;

@Data
public class AddressVO {
	private int adrNo;			//주소번호
	private int userNo;			//유저번호
	private int catNo;			//카테고리번호
	private String adrName;		//주소별칭
	private String lat;			//위도
	private String lng;			//경도
	private String rowaddress;	//도로명
	private String address;		//지번
	private String memo;		//메모
	private String createdAt;	//생성일
	private boolean detail;
	
}
