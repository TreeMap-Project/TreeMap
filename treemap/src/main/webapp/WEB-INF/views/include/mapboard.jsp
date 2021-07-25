<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../../../resources/css/mapboardNav.css" rel="stylesheet"
	type="text/css">
<html>
<meta charset="UTF-8">
<body>
	<div class="boardNav">

		<div class="category">
			<sec:authorize access="isAnonymous()">
				<p>
					<a href="/member/signup">회원가입</a>
				</p>
		</div>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<ul>
				<li>맛집</li>
				<li>쇼핑</li>
				<li>카테고리</li>
			</ul>
	</div>
	<div class="mapboardListBox">
		<div class="mapboardListSearch">
			<input class="boardSearch" placeholder="검색" />
		</div>
		<c:forEach items="${mapBoardList}" var="list" varStatus="status">
			<div class="boardList">
				<button class="addrName"
					onclick="addrmarker(${list.lat},${list.lng},'${list.rowaddress}','${list.address}','${list.adrName}');">
					<span>${list.adrName}</span>
				</button>
				<p class="address">${list.address}</p>
			</div>
		</c:forEach>
		
	</div>
	</sec:authorize>
	</div>
</body>
</html>