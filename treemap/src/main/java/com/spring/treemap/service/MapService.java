package com.spring.treemap.service;

import java.util.List;

import com.spring.treemap.domain.AddressVO;
import com.spring.treemap.domain.MemberVO;

public interface MapService {

	//유저 아이디 체크
	int getUserId(MemberVO vo);
	
	//회원가입
	void createUser(MemberVO vo);
		
	//로그인 요청시
	MemberVO getLogin(MemberVO vo);
	
	// 사용자가 처음 켰을시 보여줄 리스트
	List<AddressVO> getMapBoardList(int userNo);

	// 카테고리에 따른 리스트
	List<AddressVO> getMapBoardCategoryList(int userNo, String catName);

	// 사용자가 등록한 지도 상세보기
	AddressVO getMapBoardDetail(int addressNo);
	
	// 사용자가 등록한 지도 삭제
	void deleteMapBoard(int addressNo);
	
	// 사용자가 등록한 지도 수정
	void modifyMapBoard(AddressVO vo);

	void insertCategory(AddressVO vo);

	void insertAddress(AddressVO vo);
	
	
	
}
