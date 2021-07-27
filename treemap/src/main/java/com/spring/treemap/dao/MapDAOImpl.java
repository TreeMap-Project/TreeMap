package com.spring.treemap.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.treemap.domain.AddressVO;
import com.spring.treemap.domain.CategoryVO;
import com.spring.treemap.domain.MapVO;

@Repository
public class MapDAOImpl implements MapDAO {

	@Autowired
	private SqlSession sql;

	// mybatis에게 namespace가 여기인것을 알려줌
	private static String namespace = "com.spring.treemap";

	
	@Override
	public List<MapVO> getMapBoardList(HashMap<String, Object> data) {
		
		return sql.selectList(namespace+".getMapBoardList",data);
	}


	@Override
	public void insertCategory(CategoryVO vo) {
		sql.insert(namespace+".insertCategory",vo);
	}


	@Override
	public void insertAddress(AddressVO vo) {
		sql.insert(namespace+".insertAddress",vo);
	}


	@Override
	public MapVO getMapBoardDetail(int adrNo,int catNo) {
		return sql.selectOne(namespace+".getMapBoardDetail",adrNo);
	}


	@Override
	public void updateAddress(AddressVO address) {
		sql.update(namespace+".updateAddress",address);
	}


	@Override
	public void updateCategory(CategoryVO category) {
		sql.update(namespace+".updateCategory",category);
	}


	@Override
	public void deleteAddress(int adrNo) {
		sql.delete(namespace+".deleteAddress",adrNo);
	}


	@Override
	public void deleteCategory(int catNo) {
		sql.delete(namespace+".deleteCategory",catNo);
	}


	@Override
	public List<CategoryVO> getMapBoardCateNameList(HashMap<String, Integer> data) {
		return sql.selectList(namespace+".getMapBoardCategoryList",data);
	}


	@Override
	public List<MapVO> getCatNameList(HashMap<String, Object> data) {
		return sql.selectList(namespace+".getCatNameList",data);
	}


	@Override
	public int getAddressCount(String keyword) {
		return sql.selectOne(namespace+".getAddressCount",keyword);
	}


	@Override
	public int getCategoryCount(String keyword) {
		return sql.selectOne(namespace+".getCategoryCount",keyword);
	}

}
