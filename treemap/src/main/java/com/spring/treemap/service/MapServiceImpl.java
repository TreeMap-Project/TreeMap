package com.spring.treemap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.treemap.dao.MapDAO;
import com.spring.treemap.domain.AddressVO;
import com.spring.treemap.domain.MemberVO;

@Service
public class MapServiceImpl implements MapService{
	
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
	public AddressVO getMapBoardDetail(int addressNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteMapBoard(int addressNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyMapBoard(AddressVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<AddressVO> getMapBoardList(int userNo) {

		return dao.getMapBoardList(userNo);
	}

	@Override
	public List<AddressVO> getMapBoardCategoryList(int userNo, String catName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertCategory(AddressVO vo) {
		dao.insertCategory(vo);
	}

	@Override
	public void insertAddress(AddressVO vo) {
		dao.insertAddress(vo);
	}
	
}
