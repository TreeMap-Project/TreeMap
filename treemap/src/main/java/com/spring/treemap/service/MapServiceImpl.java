package com.spring.treemap.service;

import java.util.List;

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
	public int getUserId(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void createUser(MemberVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberVO getLogin(MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MapVO getMapBoardDetail(int adrNo, int catNo) {

		return dao.getMapBoardDetail(adrNo, catNo);
	}

	@Override
	public void deleteMapBoard(int addressNo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<MapVO> getMapBoardList(int userNo) {

		return dao.getMapBoardList(userNo);
	}

	@Override
	public List<AddressVO> getCategoryList(int userNo, String catName) {
		return null;
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
	public List<CategoryVO> getMapBoardCategoryList(int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAddress(AddressVO address) {
			dao.updateAddress(address);
	}

	@Override
	public void updateCategory(CategoryVO category) {
		dao.updateCategory(category);
	}

}
