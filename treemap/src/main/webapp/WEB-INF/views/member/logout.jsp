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
<div>
<h1>Logout Page</h1>
</div>
<div>
<form action="/member/logout" method="post">
<fieldset>
<button>Logout</button>
</fieldset>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$("button").on("click", function(e){
	e.preventDefault();
	$("form").submit();
});
</script>
<c:if test="${param.logout != null }">
	<script>
	$(document).ready(function(){
		alert("로그아웃하였습니다.");
	});
	</script>
</c:if>

</body>
</html>