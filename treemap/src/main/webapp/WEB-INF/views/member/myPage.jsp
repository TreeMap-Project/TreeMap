<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/myPage.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/resources/css/myPageModal.css"
	rel="stylesheet" type="text/css">
<title>내 정보</title>
</head>
<body>
	<div id="reloadMyPage">
		<div class="myPage">
			<div class="myPage-header">
				<div onclick="reloadMapList();" style="cursor: pointer">
					<span style="font-size: 13px; color: white;">내가 저장한 지도보기</span>
				</div>
			</div>
			<div class="myPage-body">
				<div class="myPageBoxWrapper">
					<h3 style="margin-left: 25px;">내 정보</h3>
					<div class="myPageBox">

						<label class="myPageLabels">Name</label> <span class="myPageInfo">${member.userName}</span>
						<button class="changeInfo" id="userName"
							onclick="document.querySelector('#nameModal').style='display:block';">이름
							변경</button>
					</div>
					<div class="myPageBox">
						<label class="myPageLabels">Birthday</label> <span
							class="myPageInfo" id="birthday">${member.birthday}</span>
					</div>
					<div class="myPageBox">
						<label class="myPageLabels">Email</label> <span class="myPageInfo">${member.userEmail}</span>
					</div>
					<div class="myPageBox">
						<label class="myPageLabels">Password</label>
						<button class="changeInfo" id="userPW" style="height: 27px;"
							onclick="document.querySelector('#passwordChkModal').style='display:block';">비밀번호
							변경</button>
					</div>
				</div>
			</div>
			<div id="nameModal" class="myPageModal">
				<!-- Modal content -->
				<div class="myPageModal-content">
					<div class="myPageModalTitle">
						<h3 style="color: darkslategray">이름 변경</h3>
						<input type="text" class="changeInput" id="changeName"
							value="${member.userName}" onkeyup="enterkeyName()" />
					</div>
					<div class="myPageBtnBox" style="width: 100%; margin-top: 20px;">
						<div class="myPageBtnBox">
							<button class="myPageBtn" onclick="modifyName();">
								<span class="pop_bt" style="font-size: 10pt;"> 수정 </span>
							</button>
						</div>
						<div class="myPageBtnBox">
							<button class="myPageBtn"
								onclick="document.querySelector('#nameModal').style='display:none';">
								<span class="pop_bt" style="font-size: 10pt;"> 취소 </span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div id="passwordChkModal" class="myPageModal">
				<!-- Modal content -->
				<div class="myPageModal-content">
					<div class="myPageModalTitle">
						<h3 style="color: darkslategray">비밀번호 확인</h3>
					</div>
					<div class="myPagePasswordBox">
						<input type="password" class="changeInput" id="passwordCheck"
							onkeyup="enterkeyPasswordChk();" placeholder="비밀번호 확인" />
					</div>
					<span class="passwordErr" id="passwordChkErr">비밀번호가 같지 않습니다.</span>
					<div class="myPageBtnBox" style="width: 100%; margin-top: 20px;">
						<div class="myPageBtnBox">
							<button class="myPageBtn" onclick="pwChk();">
								<span class="pop_bt" style="font-size: 10pt;"> 확인 </span>
							</button>
						</div>
						<div class="myPageBtnBox">
							<button class="myPageBtn"
								onclick="document.querySelector('#passwordChkModal').style='display:none';">
								<span class="pop_bt" style="font-size: 10pt;"> 취소 </span>
							</button>
						</div>
					</div>
				</div>
			</div>

			<div id="passwordModal" class="myPageModal">
				<!-- Modal content -->
				<div class="myPageModal-content">
					<div class="myPageModalTitle">
						<h3 style="color: darkslategray">비밀번호 변경</h3>
					</div>
					<div class="myPagePasswordBox">
						<input type="password" class="changeInput" id="myPagePw"
							placeholder="비밀번호" onkeyup="enterkeyPassword();" /> <input
							type="password" class="changeInput" id="myPagePwChk"
							placeholder="비밀번호 재확인" onkeyup="enterkeyPassword();" />
					</div>
					<span class="passwordErr" id="passwordErr">비밀번호가 같지 않거나 빈칸이
						있습니다.</span>
					<div class="myPageBtnBox" style="width: 100%; margin-top: 20px;">
						<div class="myPageBtnBox">
							<button class="myPageBtn" onclick="passwordChange();">
								<span class="pop_bt" style="font-size: 10pt;"> 수정 </span>
							</button>
						</div>
						<div class="myPageBtnBox">
							<button class="myPageBtn"
								onclick="document.querySelector('#passwordModal').style='display:none';">
								<span class="pop_bt" style="font-size: 10pt;"> 취소 </span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

function modifyName(){
	let name = document.querySelector("#changeName");
	if(name.value===''){
		alert('이름을 확인해주세요');
		name.focus();
		return false;
	}
	$.ajax({
		url:'/member/myPage/modifyName',
		type:'POST',
		data:{
			'userEmail':'${member.userEmail}',
			'userNo':${member.userNo},
			'userName':name.value
			},
		success : function(res) {
			alert('이름 변경 성공');
			$('#include').html(res);
		},
		error: function(request, status, error) {
		        alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:" + error);
		 }
	});
	document.querySelector('#nameModal').style='display:none';
	
}
//비밀번호 체크
function pwChk(){
	let password = document.querySelector("#passwordCheck");
	if(password===""){
		alert('비밀번호를 확인해주세요');
		password.focus();
		return false;
	}
	$.ajax({
		url:'/member/myPage/passwordChk',
		type:'GET',
		data:{
			'userEmail':'${member.userEmail}',
			'userPW':password.value
			},
		success : function(res) {
			if(res===1){
				document.querySelector("#passwordChkModal").style="display:none";
				document.querySelector("#passwordModal").style="display:block";
			}else{
				document.querySelector("#passwordChkErr").style="display:block";
			}
			
		},
		error: function(request, status, error) {
		        alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:" + error);
		}
	});
	
	
}
//비밀번호 변경
function passwordChange(){
	let password = document.querySelector("#myPagePw");
	let passwordChk = document.querySelector("#myPagePwChk");
	
	if(password.value!==passwordChk.value||password.value==''||passwordChk.value==''){
		document.querySelector("#passwordErr").style="display:block";
		return false;
	}
	
	$.ajax({
		url:'/member/myPage/modifyPassword',
		type:'POST',
		data:{
			'userEmail':'${member.userEmail}',
			'userPW':password.value
			},
		success : function(res) {
			alert('비밀번호 변경 성공');
			$('#include').html(res);
		},
		error: function(request, status, error) {
		        alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:" + error);
		}
	});
}

function enterkeyName() {
    if (window.event.keyCode === 13) {
    	 // 엔터키가 눌렸을 때 실행할 내용
    	modifyName();
    }
}
function enterkeyPasswordChk() {
    if (window.event.keyCode === 13) {
    	 // 엔터키가 눌렸을 때 실행할 내용
    	pwChk();
    }
}
function enterkeyPassword() {
    if (window.event.keyCode === 13) {
    	 // 엔터키가 눌렸을 때 실행할 내용
    	passwordChange();
    }
}
</script>
</html>