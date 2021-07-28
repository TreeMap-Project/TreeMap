package com.spring.treemap.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
	
	request.setAttribute("msg", "로그인을 다시 시도해주세요.");
		
	RequestDispatcher dispatcher = request.getRequestDispatcher("/treeMap/map");
	dispatcher.forward(request, response);
	}
}
