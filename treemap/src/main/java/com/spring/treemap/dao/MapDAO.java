package com.spring.treemap.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.treemap.domain.AddressVO;
import com.spring.treemap.domain.CategoryVO;
import com.spring.treemap.domain.MapVO;

public interface MapDAO {

	List<MapVO> getMapBoardList(HashMap<String, Object> data);
	
	void insertCategory(CategoryVO vo);

	void insertAddress(AddressVO vo);

	MapVO getMapBoardDetail(int adrNo, int catNo);

	void updateAddress(AddressVO address);

	void updateCategory(CategoryVO category);

	void deleteAddress(int adrNo);

	void deleteCategory(int catNo);

	List<CategoryVO> getMapBoardCateNameList(CategoryVO category);

	List<MapVO> getCatNameList(HashMap<String, Object> data);

	int getAddressCount(String keyword);

	int getCategoryCount(String catName);
	
}
