package com.spring.treemap.dao;

import java.util.List;

import com.spring.treemap.domain.AddressVO;

public interface MapDAO {

	List<AddressVO> getMapBoardList(int userNo);

	void insertCategory(AddressVO vo);

	void insertAddress(AddressVO vo);

}
