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
<h1>회원가입 화면</h1>
	<h2>
		<c:out value="${error}" />
	</h2>
	<h3>이메일과 비밀번호를 입력해주세요.</h3>

	<form id="form1" method="post" action="/signUp">
	<fieldset>
		<div>
			<label>Email</label> 
			<input type="email" name="userEmail" id="userEmail"
				placeholder="이메일을 입력해주세요." autofocus>
				<input type="button"  class="chkEmail" onclick="test();" value="이메일 중복 확인">
				<input type="hidden" id="emailChecked"> 
		</div>
		<div>
			<label>Password</label> 
			<input type="password" name="userPW" id="userPW"
				placeholder="비밀번호를 입력해주세요.">
		</div>
		<div>
		<label>사용자 이름</label>
		<input type="text" name="userName" id="userName">
		</div>
		<div>
			<button class="signupBtn">확인</button>
		</div>
		</fieldset>
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" />			
	</form>
	</div>
	</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var csrfHeaderName = "${_csrf.headerName }";
var csrfTokenValue = "${_csrf.token }";

$(document).ajaxSend(function(e,xhr,option){
	xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
});

let userEmail = document.getElementById('userEmail');
let userPW = document.getElementById('userEmail');
function test(){
	console.log(userEmail.value);
	$.ajax({
        type : "POST",
        url : "/chkEmail",
        data : {"userEmail":userEmail.value},
        //dataType : "text",
        success : function(res) {        	
          	if(res==0){
          		alert("사용 가능한 아이디입니다.");
          		//$("#emailChecked").val()="체크완료";
          	}
          	else{
          		alert("다른 아이디를 사용해주세요.");
          	}
          	},
        error: function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:"
                    + request.responseText + "\n" + "error:" + error);
           }
});}



/*
$(".chkEmail").on("click", function(e){
	e.preventDefault();
	$.ajax({
        type : "POST",
        url : "/chkEmail",
        data : {"userEmail":userEmail.value},
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
*/
 $(".signupBtn").on("click",function(e){
	e.preventDefault();
	$("#form1").submit();
});

</script>
</body>
</html>