//package com.spring.treemap.controller;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.spring.treemap.domain.MemberVO;
//import com.spring.treemap.service.MemberService;
//
//import lombok.AllArgsConstructor;
//import lombok.extern.log4j.Log4j;
//
//@Log4j
//@Controller
//@RequestMapping("/member/*")
//@AllArgsConstructor
//public class MemberController {
//	
//	@Autowired
//	MemberService service;
//	
//	@GetMapping("/signup")
//	public void showSignUp() {
//		log.info("회원가입 페이지");
//	
//	}
//	
//	@PostMapping("/signup")
//	public void doSignUp(MemberVO vo) {
//		log.info("회원가입 요청");
//		
//	}
//	
//	@GetMapping("/login")
//	public void showLogin(String error, String logout, Model model) {
//		log.info("로그인 페이지");
//		log.info("error: "+error);
//		log.info("logout: "+logout);
//		
//		if(error != null){
//			model.addAttribute("error","Login Error Check Your Account");
//		}
//		if(logout !=null) {
//			model.addAttribute("logout","로그아웃이 완료되었습니다.");
//		}		
//	}
//	
//	@PostMapping("/login")
//	public String doLogin(MemberVO vo, HttpServletRequest request, Model model) {
//		log.info("로그인 요청");
//		
//		HttpSession session = request.getSession();
//		MemberVO login = service.getLogin(vo);
//		
//		if(login !=null) { 
//			session.setAttribute("member", login.getUserNo());
//			model.addAttribute("userName",login.getUserName());
//			System.out.println(session.getAttribute("member"));
//	
//		}else session.setAttribute("member", null);	
//		return "redirect: /";
//	}
//	
//	@PostMapping("/logout")
//	public void logout() {
//		log.info("로그아웃 페이지");
//	}
//	
//	@PostMapping("/chkEmail")
//	public void checkEmail(String userEmail) {
//		log.info("이메일 중복체크");
//		service.checkEmail(userEmail);
//	
//	}
//	
//	@PostMapping("/findEmail")
//	public void findEmail(MemberVO vo, RedirectAttributes rttr) {
//		
//	}
//	
//	
//
//}
