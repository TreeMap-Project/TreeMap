package com.spring.treemap.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.treemap.dao.MapDAO;
import com.spring.treemap.domain.AddressVO;
import com.spring.treemap.domain.CategoryVO;
import com.spring.treemap.domain.MapVO;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	MapDAO dao;

	@Override
	public MapVO getMapBoardDetail(int adrNo, int catNo) {
		return dao.getMapBoardDetail(adrNo, catNo);
	}

	@Override
	public List<MapVO> getMapBoardList(int userNo,int displayPost, int postNum, String searchType, String keyword) {
		
			HashMap<String, Object> data = new HashMap<>();
			data.put("userNo", userNo);
			data.put("displayPost", displayPost);
			data.put("postNum", postNum);
			data.put("searchType", searchType);
			data.put("keyword", keyword);
			
		return dao.getMapBoardList(data);
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
	public List<CategoryVO> getMapBoardCateNameList(CategoryVO category) {
		List<CategoryVO> categoryvo=dao.getMapBoardCateNameList(category);
		//중복제거
		Set<CategoryVO> set = new HashSet<>(categoryvo);

		List<CategoryVO> list = new ArrayList<>(set);
		System.out.println(list);
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
	public List<MapVO> getCatNameList(int userNo,int displayPost, int postNum,String keyword) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("userNo", userNo);
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		
		return dao.getCatNameList(data);
	}

	@Override
	public int getAddressCount(String keyword) {
		
		return dao.getAddressCount(keyword);
	}

	@Override
	public int getCategoryCount(String catName) {
		return dao.getCategoryCount(catName);
	}

}
