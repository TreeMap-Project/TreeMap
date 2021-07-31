<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../../resources/css/findPW.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<div class="myPage">
	<div class="findPW-header">
		</div>
			<div class="findPW-body">
				<div class="findPWBowWapper">
					<h3 style="margin-left:25px;">아이디 찾기</h3>
					<div class="findPWBox">
						<label class="findPWLabels">Name</label>
						<input type="text" class="findPWInput" id="findName" placeholder="이름을 입력하세요" onkeyup="enterkey();"/>
					</div>
					<div class="findPWBox">
							<label class="findPWLabels">Phone</label>
							<input type="text" class="findPWInput" id="findPhoneNum" placeholder="휴대폰 번호를 입력하세요" onkeyup="enterkey();">
					</div>
					<div class="findPWBox">
							<label class="findPWLabels">Birthday</label>
							<input type="text" class="findPWInput" id="findBirthday" placeholder="생년월일을 입력하세요" onkeyup="enterkey();">
					</div>
					<div class="findPWBtnBox">
						<button type="button" id="findBtn" class="findPWBtn" style="margin-right:10px;" onclick="findEmail();" >찾기</button>
						<button type="button" class="findPWBtn" onclick="reloadLogin()">돌아가기</button>
					</div>
				</div>
		</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	let userName = document.querySelector("#findName");
	let birthday = document.querySelector("#findBirthday");
	let phoneNum = document.querySelector("#findPhoneNum");
  
	function findEmail() {
		if (checkForm()) {
			$.ajax({
				url : '/member/findEmail',
				type : 'POST',
				data : {
					'userName' : userName.value,
					'birthday' : birthday.value,
					'phoneNum' : phoneNum.value
				},
				success : function(result) {
					console.log(result);
					if (result !== '') {
						alert(result);
					} else{
						alert("가입 정보가 없습니다.");
					}
				}
			});
		}
	}
	function checkForm() {
		var regexpBirth = /^[0-9]{8}$/;
		var regexpPhone = /^[0-9]{10,11}$/;
		if (userName.value == '') {
			alert("이름을 입력해주세요.");
			userName.focus();
			return false;
		}
		if (birthday.value == '' || !(regexpBirth.test(birthday.value))) {
			alert("생년월일의 연월일을 -없이 입력해주세요 (ex:20010101)");
			console.log(regexpBirth.test(birthday.value));
			birthday.focus();
			return false;
		}
		if (phoneNum.value == '' || !(regexpPhone.test(phoneNum.value))) {
			alert("휴대폰 번호를 입력값을 확인 해주세요.");
			phoneNum.focus();
			return false;
		} else
			return true;
	}
	
	function enterkey() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
             findEmail();
        }
   }
	
	function reloadLogin(){
	      console.log("login 페이지로 이동");
	      $.ajax({
	         url:'/member/customLogin',
	         type:'GET',
	         success : function(result) {
	            $('#include').html(result);
	         }
	      });
	   }
</script>
</html>