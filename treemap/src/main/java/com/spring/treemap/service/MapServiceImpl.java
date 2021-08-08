package com.spring.treemap.service;

import java.util.HashMap;
import java.util.List;

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
		// 데이터를 한번에 넘길려고 map에 저장
				HashMap<String, Object> data = new HashMap<>();
				data.put("adrNo", adrNo);
				data.put("catNo", catNo);
				
		return dao.getMapBoardDetail(data);
	}

	@Override
	public List<MapVO> getMapBoardList(int userNo, int displayPost, int postNum, String searchType, String keyword) {
		// 데이터를 한번에 넘길려고 map에 저장
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
	public List<CategoryVO> getMapBoardCateNameList(int userNo, int startNum, int endNum) {
		// 데이터를 한번에 넘길려고 map에 저장
		HashMap<String, Integer> data = new HashMap<>();
		data.put("userNo", userNo);
		data.put("startNum", startNum);
		data.put("endNum", endNum);

		List<CategoryVO> category = dao.getMapBoardCateNameList(data);

		return category;
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
	public List<MapVO> getCatNameList(int userNo, int displayPost, int postNum, String keyword) {
		// 데이터를 한번에 넘길려고 map에 저장
		HashMap<String, Object> data = new HashMap<>();
		data.put("userNo", userNo);
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);

		return dao.getCatNameList(data);
	}

	@Override
	public int getAddressCount(int userNo,String keyword) {
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("userNo", userNo);
		data.put("keyword", keyword);
		
		return dao.getAddressCount(data);
	}

	@Override
	public int getCategoryCount(int userNo,String catName) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("userNo", userNo);
		data.put("catName", catName);
		
		return dao.getCategoryCount(data);
	}

	@Override
	public int getUserNo(String userEmail) {
		return dao.getUserNo(userEmail);
	}

}
