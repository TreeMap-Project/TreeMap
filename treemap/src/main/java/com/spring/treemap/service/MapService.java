package com.spring.treemap.service;

import java.util.List;

import com.spring.treemap.domain.AddressVO;
import com.spring.treemap.domain.CategoryVO;
import com.spring.treemap.domain.MapVO;
import com.spring.treemap.domain.MemberVO;

public interface MapService {

	// 사용자가 처음 켰을시 보여줄 리스트
	List<MapVO> getMapBoardList(int userNo);

	// 사용자가 처음 켰을시 보여줄 리스트
	List<CategoryVO> getMapBoardCateNameList(int userNo);

	// 사용자가 등록한 지도 상세보기
	MapVO getMapBoardDetail(int addressNo, int catNo);

	// 카테고리 인서트
	void insertCategory(CategoryVO vo);

	// 주소 인서트
	void insertAddress(AddressVO vo);

	// 주소 업데이트
	void updateAddress(AddressVO address);

	// 카테고리 업데이트
	void updateCategory(CategoryVO category);

	// 주소삭제
	void deleteAddress(int adrNo);

	// 카테고리삭제
	void deleteCateGory(int catNo);

	List<MapVO> getCatNameList(String catName);

}
