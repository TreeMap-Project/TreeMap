<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입 화면</h1>
	<h2>
		<c:out value="${error}" />
	</h2>
	<h3>이메일과 비밀번호를 입력해주세요.</h3>

	<form method="post" action="/signUp">
	<fieldset>
		<div>
			<label>Email</label> 
			<input type="email" name="userEmail" id="userEmail"
				placeholder="이메일을 입력해주세요." autofocus>
				<input type="button" class="chkEmail" value="이메일 중복 확인">
		</div>
		<div>
			<label>Password</label> 
			<input type="password" name="userPW"
				placeholder="비밀번호를 입력해주세요.">
		</div>
		<div>
		<label>사용자 이름</label>
		<input type="text" name="userName">
		</div>
		<div>
			<input type="submit" name="확인">
		</div>
		</fieldset>
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" />			
	</form>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
let userEmail = document.getElementById('userEmail');

$(".chkEmail").on("click", function(e){
	e.preventDefault();
	$.ajax({
        type : "POST",
        url : "/chkEmail",
        data : userEmail,
        success : function(res) {        	
          	console.log("아이디중복검사 완료");
          	if(res=="true"){
          		alert("사용 하실 수 있는 이메일입니다.");         		
          	}else{
          		alert("이미 사용중인 이메일입니다.");
          		userEmail.value='';
          		}
          	}
        },
        error: function(){
        	alert("다시 시도해주시기 바랍니다.");
     });
});

$("button").on("click",function(e){
	e.preventDefault();
	$("form").submit();
});
</script>
</body>
</html>