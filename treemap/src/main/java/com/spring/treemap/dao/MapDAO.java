package com.spring.treemap.dao;

import java.util.List;

import com.spring.treemap.domain.AddressVO;
import com.spring.treemap.domain.CategoryVO;
import com.spring.treemap.domain.MapVO;

public interface MapDAO {

	List<MapVO> getMapBoardList(int userNo);

	void insertCategory(CategoryVO vo);

	void insertAddress(AddressVO vo);

	MapVO getMapBoardDetail(int adrNo, int catNo);

	void updateAddress(AddressVO address);

	void updateCategory(CategoryVO category);
	
}
