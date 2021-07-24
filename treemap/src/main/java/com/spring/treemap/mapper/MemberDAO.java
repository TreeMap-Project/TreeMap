package com.spring.treemap.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.treemap.domain.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//아이디 개수 
	public int getEmailCnt(MemberVO vo) {
		return sqlSession.selectOne("MemberDAO.emailCnt",vo);
	}
	
	//회원가입
	public void insertMember(MemberVO vo) {
		sqlSession.insert("MemberDAO.insertUser",vo);
	}
	
	//로그인
	public MemberVO getLogin(MemberVO vo) {
		return sqlSession.selectOne("MemberDAO.getLogin",vo);
	}
	
	//회원탈퇴
	public int deleteUser(MemberVO vo) {
		return sqlSession.update("MemberDAO.deleteUser",vo);
	}
	
	//아이디 찾기
	//비밀번호 찾기
	
	
	
	

}
