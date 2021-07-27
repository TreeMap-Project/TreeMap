<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<p><a href="/treeMap/map">지도보러가기</a></p>
<p><a href="/member/signup">회원가입</a></p>
<sec:authorize access="isAnonymous()">
<p><a href="/member/customlogin">로그인</a></p>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
<p><a href="/member/logout">로그아웃</a></p>
</sec:authorize>

</body>
</html>
