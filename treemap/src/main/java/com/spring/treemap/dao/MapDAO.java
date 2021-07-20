package com.spring.treemap.dao;

import java.util.List;

import com.spring.treemap.domain.AddressVO;
import com.spring.treemap.domain.CategoryVO;

public interface MapDAO {

	List<AddressVO> getMapBoardList(int userNo);

	void insertCategory(CategoryVO vo);

	void insertAddress(AddressVO vo);

	AddressVO getMapBoardDetail(int adrNo);
	
}
