package com.spring.treemap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.treemap.domain.MemberVO;
import com.spring.treemap.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	
	@Autowired
	MemberService service;
	
	@GetMapping("/member/signup")
	public void showSignin(String error, Model model) {
		log.info("회원가입 페이지");
		log.info("error: "+error);
			
		if(error != null){
			model.addAttribute("error",error);
		}
			
	}
	
    @PostMapping("/signUp")
    public String signUp(MemberVO member,Model model) {
    	
    	if(service.getSignUp(member)) {
    		model.addAttribute("msg",member.getUserName()+"님 환영합니다.");
    	}else {
    		log.info("회원가입오류");
    	}            
        return "redirect:/member/customLogin";
    }
    
    @PostMapping("/chkEmail")
	public boolean checkEmail(String userEmail) {
		log.info("이메일 중복체크");
		if(service.checkEmail(userEmail)) return true;
		else return false;
		
    }
	
	
	@GetMapping("/member/customLogin")
	public void showLogin(String error, String logout, Model model) {
		log.info("로그인 페이지");
		log.info("error: "+error);
		log.info("logout: "+logout);
		
		if(error != null){
			log.info("error: "+error);
		}
		if(logout !=null) {
			model.addAttribute("logout","로그아웃이 완료되었습니다.");
		}		
	}
	
	@GetMapping("/member/logout")
	public void logoutGet() {
		log.info("custom logout");
	}
	
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied: "+auth);
		
		model.addAttribute("msg", "Access Denied");
	}

}
