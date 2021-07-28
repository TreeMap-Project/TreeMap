package com.spring.treemap.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.treemap.domain.MemberVO;
import com.spring.treemap.mapper.MemberMapper;
import com.spring.treemap.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserName: "+username);
		
		MemberVO vo = mapper.read(username);
		log.warn("queried by member mapper: "+vo);
		return vo ==null? null: new CustomUser(vo);
	}
}
