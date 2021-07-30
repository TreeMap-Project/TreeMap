<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../../../resources/css/myPage.css" rel="stylesheet"
	type="text/css">
<link href="../../../../resources/css/myPageModal.css" rel="stylesheet"
	type="text/css">
<title>내 정보</title>
</head>
<body>
<div class="myPage">
<div class="signup-header">
</div>
	<div class="signup-body">
		<div class="myPageBoxWrapper">
			<h3>내 정보</h3>
			<div class="myPageBox">
				
				<label class="myPageLabels">Name</label>
				<span class="myPageInfo">${member.userName}조경훈</span>
				<button class="changeInfo" id="userName" onclick="nameModalOpen()">이름 변경</button>
			</div>
			<div class="myPageBox">
					<label class="myPageLabels">Birthday</label>
					<span class="myPageInfo" id="birthday" >${member.birthday}950804</span>
			</div>
			<div class="myPageBox">
					<label class="myPageLabels">Email</label>
					<span class="myPageInfo">${member.userEmail}whrudgns13@naver.com</span>
				<button class="changeInfo" id="userEmail" onclick="document.querySelector('#emailModal').style='display:block';" >이메일 변경</button>
			</div>
			<div class="myPageBox">
				<label class="myPageLabels">Password</label>
				<button class="changeInfo" id="userPW" onclick="document.querySelector('#passwordlModal').style='display:block';">비밀번호변경</button>	
			</div>
		</div>
	</div>
	<div id="nameModal" class="myPageModal">
		<!-- Modal content -->
		<div class="myPageModal-content">
			<div class="myPageModalTitle">
				<h3 style="color: darkslategray">이름 변경</h3>
				<input type="text" class="changeInput" value="${member.userName}"/>
			</div>
			<div class="myPageBtnBox" style="width: 100%; margin-top:20px;">
				<div class="myPageBtnBox">
					<button class="myPageBtn">
								<span class="pop_bt" style="font-size: 10pt;"> 수정 </span>
					</button>
				</div>
				<div class="myPageBtnBox">
					<button class="myPageBtn" onclick="document.querySelector('#nameModal').style='display:none';">
								<span class="pop_bt" style="font-size: 10pt;"> 취소 </span>
					</button>
				</div>		
		</div>
		</div>
	</div>
	<div id="emailModal" class="myPageModal">
		<!-- Modal content -->
		<div class="myPageModal-content">
			<div class="myPageModalTitle">
				<h3 style="color: darkslategray">이메일 변경</h3>
				<input type="email" class="changeInput" value="${member.userEmail}"/>
			</div>
			<div class="myPageBtnBox" style="width: 100%; margin-top:20px;">
				<div class="myPageBtnBox">
					<button class="myPageBtn">
								<span class="pop_bt" style="font-size: 10pt;"> 수정 </span>
					</button>
				</div>
				<div class="myPageBtnBox">
					<button class="myPageBtn" onclick="document.querySelector('#emailModal').style='display:none';">
								<span class="pop_bt" style="font-size: 10pt;"> 취소 </span>
					</button>
				</div>		
			</div>
		</div>
	</div>
	<div id="passwordlModal" class="myPageModal">
		<!-- Modal content -->
		<div class="myPageModal-content">
			<div class="myPageModalTitle">
				<h3 style="color: darkslategray">비밀번호 변경</h3>
			</div>
			<div class="myPagePasswordBox">
				<input type="password" class="changeInput" id="myPagePw" placeholder="비밀번호"/>
				<input type="password" class="changeInput" id="myPagePwChk" placeholder="비밀번호 재확인"/>
			</div>
			<span class="passwordErr">비밀번호가 같지 않습니다.</span>
			<div class="myPageBtnBox" style="width: 100%; margin-top:20px;">
				<div class="myPageBtnBox">
					<button class="myPageBtn" onclick="passwordChk();">
							<span class="pop_bt" style="font-size: 10pt;"> 수정 </span>
					</button>
				</div>
				<div class="myPageBtnBox">
					<button class="myPageBtn" onclick="document.querySelector('#passwordlModal').style='display:none';">
								<span class="pop_bt" style="font-size: 10pt;"> 취소 </span>
					</button>
				</div>		
			</div>
		</div>
	</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function nameModalOpen(){
	document.querySelector("#nameModal").style="display:block";
}
function passwordChk(){
	let password = document.querySelector("#myPagePw");
	let passwordChk = document.querySelector("#myPagePwChk");
	if(password.value!==passwordChk.value){
		console.log(password.value);
		console.log(passwordChk.value);
		document.querySelector(".passwordErr").style="display:block";
	}
}
</script>
</html>