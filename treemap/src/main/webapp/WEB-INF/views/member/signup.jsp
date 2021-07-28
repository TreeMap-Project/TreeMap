<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../../../resources/css/signup.css" rel="stylesheet"
	type="text/css">
</head>
<body>
<div class="signup">
<div class="signup-header">
</div>
<div class="signup-body">
<h1 style="font-family:Open Sans; color:rgb(75,75,75)">Sign Up</h1>
	<h2>
		<c:out value="${error}" />
	</h2>
	<form method="post" action="/signUp" id="signupForm">
	<div  class="signupBoxWrapper">
		<div class="signupBox">
		<div id="emailSet">
			<label class="signupLabels">Email</label> 
			<input type="button"  class="chkEmail" onclick="emailChk();" value="이메일 중복 확인">
			</div>
			<input type="email" name="userEmail" id="userEmail" autofocus
				placeholder="이메일을 입력해주세요." class="signupInputs">
				
		</div>
		<div class="signupBox">
			<label class="signupLabels">Password</label> 
			<input type="password" name="userPW" id="userPW" class="signupInputs"
				placeholder="비밀번호를 입력해주세요.">
		</div>
		<div class="signupBox">
		<label class="signupLabels">사용자 이름</label>
		<input type="text" name="userName" id="userName" class="signupInputs">
		</div>
		<div class="signupBox">
			<button class="signupBtn">확 인</button>
		</div>
		</div>
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" />			
	</form>
	</div>
	</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/* var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

$(document).ajaxSend(function(e,xhr,option){
	xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
});
 */
let userEmail = document.getElementById('userEmail');

let userChk = false;
function emailChk(){
	console.log(userEmail.value);
	$.ajax({
        type : "POST",
        url : "/chkEmail",
        data : {"userEmail":userEmail.value},
        //dataType : "text",
        success : function(res) {        	
          	if(res==0){
          		alert("사용 가능한 아이디입니다.");
          		userChk =true;
          		console.log("이메일 체크 완료");
          	}
          	else{
          		alert("다른 아이디를 사용해주세요.");
          		userChk = false;
          	}
          	},
        error: function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:"
                    + request.responseText + "\n" + "error:" + error);
           }
});}

 $(".signupBtn").on("click",function(e){
	e.preventDefault();
	if(userChk){
		$("#signupForm").submit();	
	}
	else{alert("이메일 중복 확인해주세요.");}	
});

</script>
</body>
</html>