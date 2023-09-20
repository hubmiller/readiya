<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
      href="/resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>작가 등록</title>
<style type="text/css">
	#enrollForm {
		margin-top: 100px;
		padding-left: 35px;
	}
	
	#nationDiv {
		margin-top: 20px;
	}
	
	#introDiv {
		margin-top: 20px;
	}
	
	#btnDiv {
		margin-top: 20px;
		padding-left: 25px;
	}
	
	#nameLabel {
		padding-top: 6px;
	}
	
	#introLabel {
		padding-top: 6px;
	}
</style>
</head>
<body>
	<%@ include file="../includes/menu.jsp" %>
	<div class="container">
		<form action="/readiya/authorEnroll.do" class="form-horizontal" method="post" id="enrollForm">
			<div class="form-group row" id="nameDiv">
				<label class="col-sm-2" id="nameLabel">작가 이름</label>
					<div class="col-sm-3">
						<input type="text" id="authorName" name="authorName" class="form-control">
					</div>
			</div>
			
			<div class="form-group row" id="nationDiv">
				<label class="col-sm-2">소속 국가</label>
					<div class="col-sm-10">
						<select name="nationId" id="nationId">
							<option value="none" selected>=== 선택 ===</option>
							<option value="01">국내</option>
							<option value="02">국외</option>
						</select>			
					</div>
			</div>
			
			<div class="form-group row" id="introDiv">
				<label class="col-sm-2" id="introLabel">작가 소개</label>
					<div class="col-sm-3">
						<input type="text" id="authorIntro" name="authorIntro" class="form-control">
					</div>
			</div>
		</form>
		
		<div class="form-group row" id="btnDiv">
			<div class="col-sm-offset-2 col-sm-10">
				<button id="enroll_btn" class="btn btn-primary">등록</button>
				<button id="enroll_cancel" class="btn btn-primary">취소</button>
			</div>
		</div>	
	</div>
	
	<script>
		// 등록 버튼 
		$("#enroll_btn").click(function(){    
			// 검사 통과 유무 변수 
		    let nameCheck = false;             // 작가 이름
		    let nationCheck = false;           // 소속 국가
		    let introCheck = false;            // 작가 소개 
		    
		    // 입력값 변수 
		    let authorName = $('input[name=authorName]').val();        // 작가 이름
		    let nationId = $('select[name=nationId]').val();           // 소속 국가
		    let authorIntro = $('input[name=authorIntro]').val();      // 작가 소개
		    
		    // 작가 이름 유효성 검사
		    if (authorName === ''){
		       	alert("작가 이름을 입력해주세요.");
		        nameCheck = false;
		    }else{
		        nameCheck = true;
		    }
		    
		    // 소속 국가 유효성 검사
		    if (nationId === 'none'){
		        alert("소속 국가를 선택해주세요.");
		        nationCheck = false;
		    }else{
		        nationCheck = true;
		    }    
		    
		    // 작가 소개 유효성 검사 
		    if (authorIntro === ''){
		        alert("작가 소개를 입력해주세요.");
		        introCheck = false;
		    }else{	
		        introCheck = true;
		    }
		    
		    // 최종 유효성 검사
		    if (nameCheck && nationCheck && introCheck) {
		        $("#enrollForm").submit();    
		    }else{
		        return false;
		    }
		});
		 
		// 취소 버튼 
		$("#enroll_cancel").click(function(){
		    location.href="/readiya/authorManage";
		});
	</script>
	
	<%@ include file="../includes/footer.jsp" %>
</body>
</html>