<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"
</script>
<style type="text/css">
	/* 로그인 실패시 경고글 */
	.login_fail{
	    margin-top: 10px;
	    padding-bottom: 10px;
	    text-align: center;
	    color : red;
	}
	
	.login_btn {
		padding-top: 20px;
	}
</style>
</head>
<body>
<%@ include file="../includes/menu.jsp" %>
	
	<div class="container" align="center" style="margin-top:230px;">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">로그인 화면입니다.</h3>
			
			<form class="form-signin" id="login_form" method="post">
				<div class="form-group">
					<label for="customerId">아이디</label>
					<input type="text" class="form-control" name="id"
					       id="customerId">
				</div>
				
				<div class="form-group">
					<label for="customerPassword">비밀번호</label>
					<input type="password" class="form-control" name="password"
					       id="customerPassword">
				</div>
				
				<c:if test="${result == 0}">
                	<div class="login_fail">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            	</c:if>
				
				<input type="button" class="btn btn-lg btn-success btn-block" id="login_btn" value="로그인">
			</form>
		</div>
	</div>
	
	<script>
	    // 로그인 버튼 클릭
	    $("#login_btn").click(function(){
	        //alert("로그인 버튼 작동");
	        
	    	// 로그인 메서드 서버 요청
	        $("#login_form").attr("action", "/customer/login");
	        $("#login_form").submit();
	 
	    });
	</script>
	
	<%@ include file="../includes/footer.jsp" %>
</body>
</html>