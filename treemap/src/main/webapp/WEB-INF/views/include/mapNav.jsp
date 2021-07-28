<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../../../resources/css/mapNav.css" rel="stylesheet"
	type="text/css">
<html>

<div class="navbar">
	<div class="logoBox">
		<img class="logo" src="../../../../resources/imgs/treeLogo.png">
	</div>
	<div class="mapSearchBox">
		<form onsubmit="searchPlaces(); return false;">
			<!-- 
			키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> -->
			<input type="text" class="mapSearch" />
			<button class="SearchBtn" type="submit">
				<img class="searchImg" src="../../../../resources/imgs/search2.png">
			</button>
		</form>
	</div>
	<div class="rightBtns">
		<sec:authorize access="isAnonymous()">
			<button id="loginBtn" class="rightBtn" onclick="login();">로그인</button>
			<button id="signupBtn" class="rightBtn" onclick="signup();">회원가입</button>		
		</sec:authorize>

		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.username" var="userName" />
			<button class="rightBtn" onclick="location.href='/logout'">로그아웃</button>
		</sec:authorize>
	</div>
</div>
<script type="text/javascript">

</script>
</html>