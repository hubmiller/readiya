<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>READIYA</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"
</script>
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
    	<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        	<div class="container px-5">
            	<a class="navbar-brand" href="../main">READIYA</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                	<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                		<!-- 로그인 하지 않은 상태 -->
                		<c:if test = "${customer == null}">
                      		<li class="nav-item"><a class="nav-link" href="../customer/login">로그인</a></li>
                        	<li class="nav-item"><a class="nav-link" href="../customer/register">회원가입</a></li>
                        	<li class="nav-item"><a class="nav-link" href="../readiya/goodsManage">상품정보</a></li>
                		</c:if>    
       					
       					<!-- 로그인한 상태 -->
                		<c:if test="${customer != null}">
            				<li class="nav-item"><a class="nav-link">${customer.id}님 환영합니다!</a></li>
            				<li class="nav-item"><a class="nav-link" id="logout_btn">로그아웃</a></li>
                        	<li class="nav-item"><a class="nav-link" href="../readiya/goodsEnroll">상품등록</a></li>
                        	<li class="nav-item"><a class="nav-link" href="../readiya/goodsManage">상품관리</a></li>
                        	<li class="nav-item"><a class="nav-link" href="../readiya/authorEnroll">작가등록</a></li>
                        	<li class="nav-item"><a class="nav-link" href="../readiya/authorManage">작가관리</a></li>
                		</c:if>
                	</ul>
            	</div>
        	</div>
		</nav>
	</main>
	
	<script>
	    // 로그아웃 버튼 클릭
	    $("#logout_btn").click(function(){
	        //alert("버튼 작동");
	        $.ajax({
	            type: "POST",
	            url: "/customer/logout.do",
	            success:function(data){
	                alert("로그아웃 되었습니다.");
	                document.location.reload();
	            } 
        	}); 
	    });
	</script>