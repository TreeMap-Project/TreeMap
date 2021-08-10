package com.spring.treemap.service;

import javax.servlet.http.HttpServletResponse;

import com.spring.treemap.domain.MemberVO;

public interface MemberService {
	// 아이디 중복확인
	int checkEmail(String userEmail);

	// 회원가입
	boolean getSignUp(MemberVO member);

	// 아이디 찾기
	String findEmail(MemberVO member);

	// 비밀번호찾기
	public void findPw(HttpServletResponse resp, MemberVO vo) throws Exception;

	// 회원 정보 불러오기
	MemberVO read(MemberVO member);

	// 이름 수정
	void updateName(MemberVO vo);

	// 마이페이지 비밀번호 확인
	int passwordChk(MemberVO vo);

	// 비밀번호 변경
	void updatePassword(MemberVO vo);
}