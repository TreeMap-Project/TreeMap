package com.spring.treemap.service;

import com.spring.treemap.domain.MemberVO;

public interface MemberService {
	//아이디 중복확인
	int checkEmail(String userEmail);
	
	//회원가입
	boolean getSignUp(MemberVO member);
	
	//아이디 찾기
	String findEmail(MemberVO member);
	
	//비밀번호 찾기
	String findPW(MemberVO member);	
	
	//회원 탈퇴 처리
	int deleteUser(MemberVO member);

}
