package com.spring.treemap.domain;



import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private int userNo;
	private String userEmail;
	private String userName;
	private String userPW;
	
	private char isDeleted;
	private Date createdAt;
	
	private List<AuthVO> authList;
}
