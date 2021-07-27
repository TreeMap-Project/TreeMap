package com.spring.treemap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		log.info("error: "+"입력값을 다시 확인해주세요.");
			
		if(error != null){
			model.addAttribute("error",error);
		}
			
	}
	
    @PostMapping("/signUp")
    public String signUp(MemberVO member,Model model) {
    	
    	if(service.getSignUp(member)) {
    		model.addAttribute("msg",member.getUserName()+"님 로그인 해주세요.");
    	}else {
    		log.info("회원가입오류");
    	}            
        return "redirect:/treeMap/map";
    }
    
    @ResponseBody
    @PostMapping("/chkEmail")
	public Integer checkEmail(String userEmail) {
		log.info("이메일 중복체크");

		return service.checkEmail(userEmail);
    }
	
	
	@GetMapping("/member/customLogin")
	public String showLogin(String error, String logout, Model model) {
		log.info("로그인 페이지");
		log.info("error: "+error);
		log.info("logout: "+logout);
		
		if(error != null){
			log.info("error: "+"입력값을 다시 확인해주세요.");
		}
		if(logout !=null) {
			model.addAttribute("logout","로그아웃이 완료되었습니다.");
		}	
		return "member/customLogin";
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied: "+auth);
		
		model.addAttribute("msg", "Access Denied");
	}

}
