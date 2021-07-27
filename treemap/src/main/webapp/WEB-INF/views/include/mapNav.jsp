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
	<div>
		<sec:authorize access="isAnonymous()">
			<p><!-- 
				<a href="<%=request.getContextPath()%>?subpage=../member/signup">회원가입</a>
				<a href="<%=request.getContextPath()%>?subpage=../member/customLogin">로그인</a>
			-->
			<button onclick="login();">로그인</button>
			<button onclick="signup();">회원가입</button>
			
			</p>
		</sec:authorize>

		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.username" var="userName" />
			<p>
				<a href="/logout">${userName }로그아웃</a>
			</p>
		</sec:authorize>
	</div>
</div>
<script type="text/javascript">

</script>
</html>