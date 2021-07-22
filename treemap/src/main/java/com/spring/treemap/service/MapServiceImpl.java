package com.spring.treemap.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.treemap.dao.MapDAO;
import com.spring.treemap.domain.AddressVO;
import com.spring.treemap.domain.CategoryVO;
import com.spring.treemap.domain.MapVO;
import com.spring.treemap.domain.MemberVO;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	MapDAO dao;

	@Override
	public MapVO getMapBoardDetail(int adrNo, int catNo) {
		return dao.getMapBoardDetail(adrNo, catNo);
	}

	@Override
	public List<MapVO> getMapBoardList(int userNo) {
			
		return dao.getMapBoardList(userNo);
	}

	
	@Override
	public void insertCategory(CategoryVO vo) {
		dao.insertCategory(vo);
	}

	@Override
	public void insertAddress(AddressVO vo) {
		dao.insertAddress(vo);
	}

	@Override
	public List<CategoryVO> getMapBoardCateNameList(int userNo) {
		List<CategoryVO> category=dao.getMapBoardCateNameList(userNo);
		//중복제거
		Set<CategoryVO> set = new HashSet<>(category);

		List<CategoryVO> list = new ArrayList<>(set);

		return list;
	}

	@Override
	public void updateAddress(AddressVO address) {
		dao.updateAddress(address);
	}

	@Override
	public void updateCategory(CategoryVO category) {
		dao.updateCategory(category);
	}

	@Override
	public void deleteAddress(int adrNo) {
		dao.deleteAddress(adrNo);
	}

	@Override
	public void deleteCateGory(int catNo) {
		dao.deleteCategory(catNo);
	}

	@Override
	public List<MapVO> getCatNameList(String catName) {
		
		return dao.getCatNameList(catName);
	}

}
