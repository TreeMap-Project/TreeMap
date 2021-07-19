package com.spring.treemap.domain;

import lombok.Data;

@Data
public class AddressVO extends MemberVO{
	
	private int adrNo;
	private int userNo;
	private int catNo;
	private String lat;
	private String lng;
	private String adrName;
	private String category;
	private String rowaddress;
	private String address;
	private String memo;
	private String IconUrl;
	private String createdAt;

}
