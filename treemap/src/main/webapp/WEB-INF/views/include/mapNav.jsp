<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../../../resources/css/mapNav.css" rel="stylesheet" type="text/css">
<html>

<div class="navbar">
	<div class="logoBox" onclick="window.location.reload();">
		<img class="logo" src="../../../../resources/imgs/treeLogo.png">
		<span class="mainTotle" >TREE MAP</span>
	</div>	
	<div class="mapSearchBox">
		<form onsubmit="searchPlaces(); return false;">
		<!--  	
			키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> -->
		<input type="text" class="mapSearch" placeholder="키워드로 검색" />
		<button class="SearchBtn" type="submit"><img class="searchImg" src="../../../../resources/imgs/search2.png"></button>
		</form>
	</div>
	<div class="rightBtns">
	
		<c:if test="${status eq 'fail'}">
			<button id="loginBtn" class="rightBtn" onclick="login();">로그인</button>
			<button id="signupBtn" class="rightBtn" onclick="signup();">회원가입</button>		
		</c:if>
		
		<sec:authorize access="isAnonymous()">
			<button id="loginBtn" class="rightBtn" onclick="login();">로그인</button>
			<button id="signupBtn" class="rightBtn" onclick="signup();">회원가입</button>		
		</sec:authorize>

		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.username" var="userName" />
			<button class="rightBtn" onclick="location.href='/logout'">로그아웃</button>
		</sec:authorize>
	</div>
	<div>
		<button class="menuBtn" onclick="boardOpen()"><img style="width: 30px;"src="../../../../resources/imgs/메뉴버튼.png"></button>
	</div>
</div>
<script type="text/javascript">
let board = true;
window.addEventListener('resize', function() {
	if(window.outerWidth<1100){
		document.querySelector(".boardNav").style="display:none";
		document.querySelector(".mapboardWrap").style="display: flex;width: 100%;";
		document.querySelector(".mapSearchBox").style="position:relative;";
		document.querySelector(".rightBtns").style="position: absolute;right:5%";
		document.querySelector(".logoBox").style="display:none;";
		document.querySelector(".menuBtn").style="display:block;";
		board=true;
	}else{
		document.querySelector(".boardNav").style="display:block";
		document.querySelector(".mapSearchBox").style="position: absolute; left:30%;";
		document.querySelector(".navbar").style="width: 100%;";
		document.querySelector(".rightBtns").style="position: absolute;right:33%;";
		document.querySelector(".menuBtn").style="display:none;";
		document.querySelector(".logoBox").style="display:flex;";
		board=false;
	
}
},true);

function boardOpen(){
	if (board==true){
		document.querySelector(".boardNav").style="display:block";
		document.querySelector(".mapSearchBox").style="position: absolute; left:20%";
		document.querySelector(".rightBtns").style="left:50%";
		board=false;
	}else{
		document.querySelector(".boardNav").style="display:none";
		document.querySelector(".mapSearchBox").style="position:relative;";
		document.querySelector(".rightBtns").style="right:5%";
		board=true;
	}
}
</script>
</html>