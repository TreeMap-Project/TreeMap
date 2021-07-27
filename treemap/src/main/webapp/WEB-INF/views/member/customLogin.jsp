<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../../../resources/css/customLogin.css" rel="stylesheet"
	type="text/css">
</head>
<body>
<div class="customLogin">
<div class="customLogin-header">
	
	</div>
	<div class="customLogin-body">
	<h1>Login</h1>
	<h2>
		<c:out value="${error}" />
	</h2>
	<h2>
		<c:out value="${logout}" />
	</h2>
	<h2>
		<c:out value="${msg}" />
	</h2>
	<h3>이메일과 비밀번호를 입력해주세요.</h3>

	<form method="post" action="/login" id="loginForm">
		<fieldset>
			<div>
				<label>Email</label> <input type="email" name="userEmail"
					placeholder="이메일을 입력해주세요." autofocus>
			</div>
			<div>
				<label>Password</label> <input type="password" name="userPW"
					placeholder="비밀번호를 입력해주세요.">
			</div>
			<div>
				<input type="checkbox" name="remember-me">Remember Me
			</div>
			<div>
				<button class="loginsubmit">확인</button>
			</div>
		</fieldset>
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" />
	</form>
	</div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(".loginsubmit").on("click", function(e) {
			e.preventDefault();
			$("#loginForm").submit();
		});
		
		
	</script>
</body>
</html>