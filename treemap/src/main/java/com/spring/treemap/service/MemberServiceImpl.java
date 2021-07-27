package com.spring.treemap.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.treemap.domain.MemberVO;
import com.spring.treemap.mapper.MemberMapper;
import com.spring.treemap.security.domain.CustomUser;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	

	public int checkEmail(String userEmail) {
		int cnt = mapper.emailCnt(userEmail);
		System.out.println(cnt);
		return cnt;
	}

	public boolean getSignUp(MemberVO member) {
		member.setUserPW(bcryptPasswordEncoder.encode(member.getUserPW()));
		return mapper.insertUser(member) ==1 && mapper.insertAuth(member)==1;
	}

	
	public boolean deleteAccount(MemberVO member) {
		return mapper.deleteUser(member) ==1 ;
		
	}

	public String findEmail(MemberVO member) {
		
		return null;
	}


	public String findPW(MemberVO member) {
		
		return null;
	}

	
	public MemberVO getLogin(MemberVO member) {
		return mapper.getUserByLogin(member);
	}



}
