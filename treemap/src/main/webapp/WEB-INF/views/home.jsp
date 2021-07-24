<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Main</title>
</head>
<link href="../../../../resources/css/main.css" rel="stylesheet"
	type="text/css">

<body>
	<div class="startMainWapper">
		<div class="styleBox">
			<div class="logo">
				<img style="width: 30%"
					src="../../../../resources/imgs/LogoColor.png" /> <span
					class="mainTotle">TREE MAP</span>
			</div>
			<div class="subTitleBox">
				<p>나만의 지도를</p>
				<p>만들어 보세요</p>
			</div>
			<a class="start" href='/treeMap/map?num=1'>시작하기</a>
		</div>
	</div>
</body>
</html>
