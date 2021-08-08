<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath() %>/resources/css/findPW.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/resources/css/myPageModal.css" rel="stylesheet" type="text/css">
<title>비밀번호 찾기</title>
</head>
<body>

<div class="myPage">
	<div class="findPW-header">
		</div>
			<div class="findPW-body">
				<div class="findPWBowWapper">
					<h3 style="margin-left:25px;">비밀번호 찾기</h3>
					<div class="findPWBox">
						<label class="findPWLabels">Name</label>
						<input type="text" class="findPWInput" id="findName" placeholder="이름을 입력하세요">
					</div>
					<div class="findPWBox">
							<label class="findPWLabels">Email</label>
							<input type="text" id="findEmail" class="findPWInput" placeholder="이메일을 입력하세요">
					</div>
					<div class="findPWBtnBox">
						<button type="button" id="findBtn" class="findPWBtn" style="margin-right:10px;" onclick="findPw()" >찾기</button>
						<button type="button" class="findPWBtn" onclick="reloadLogin()">돌아가기</button>
					</div>
				</div>
		</div>
</div>


</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	let userName = document.querySelector("#findName");
	let userEmail = document.querySelector("#findEmail");
	function findPw(){
		$.ajax({
			url:'/member/findPw',
			type:'POST',
			data:{
				'userName':userName.value,
				'userEmail':userEmail.value	
			},
			success : function(result) {
				alert(result);
			}
		});
	}
	
	function reloadLogin(){
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