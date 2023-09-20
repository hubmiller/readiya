<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
      href="/resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>작가 상세 페이지</title>
<style type="text/css">
	#enrollForm {
		margin-top: 100px;
	}
	
	#nationDiv {
		margin-top: 20px;
	}
	
	#introDiv {
		margin-top: 20px;
	}
	
	#dateDiv {
		margin-top: 20px;
	}
	
	#updateDiv {
		margin-top: 20px;
	}
	
	#btnDiv {
		margin-top: 20px;
	}
	
	#nameLabel {
		padding-top: 6px;
	}
	
	#introLabel {
		padding-top: 6px;
	}
	
	#dateLabel {
		padding-top: 6px;
	}
	
	#updateLabel {
		padding-top: 6px;
	}
</style>
</head>
<body>
	<%@ include file="../includes/menu.jsp" %>
	<div class="container">
		<form action="/readiya/authorEnroll.do" class="form-horizontal" method="post" id="enrollForm">
			<div class="form-group row" id="nameDiv">
				<label class="col-sm-2" id="nameLabel">작가 번호</label>
					<div class="col-sm-3">
						<input class="form-control" name="authorId" readonly="readonly" value="<c:out value='${authorInfo.authorId}'></c:out>">
					</div>
			</div>
		
			<div class="form-group row" id="nameDiv">
				<label class="col-sm-2" id="nameLabel">작가 이름</label>
					<div class="col-sm-3">
						<input class="form-control" name="authorName" readonly="readonly" value="<c:out value='${authorInfo.authorName}'></c:out>">
					</div>
			</div>
			
			<div class="form-group row" id="nationDiv">
				<label class="col-sm-2">소속 국가</label>
					<div class="col-sm-10" style="width:330px;">
						<input class="form-control" name="nationName" readonly="readonly" value="<c:out value='${authorInfo.nationName}'></c:out>">
				</div>
			</div>
			
			<div class="form-group row" id="introDiv">
				<label class="col-sm-2" id="introLabel">작가 소개</label>
					<div class="col-sm-3">
						<textarea class="form-control" name="authorIntro" readonly="readonly"><c:out value='${authorInfo.authorIntro}'/></textarea>
					</div>
			</div>
			
			<div class="form-group row" id="dateDiv">
				<label class="col-sm-2" id="dateLabel">등록 날짜</label>
					<div class="col-sm-3">
						<input class="form-control" type="text" readonly="readonly" value="<fmt:formatDate value="${authorInfo.regDate}" pattern="yyyy-MM-dd"/>">
					</div>
			</div>
			
			<div class="form-group row" id="updateDiv">
				<label class="col-sm-2" id="updateLabel">수정 날짜</label>
					<div class="col-sm-3">
						<input class="form-control" type="text" readonly="readonly" value="<fmt:formatDate value="${authorInfo.updateDate}" pattern="yyyy-MM-dd"/>">
					</div>
			</div>
			
			<div class="form-group row" id="btnDiv">
				<div class="col-sm-offset-2 col-sm-10">
					<button id="detail_modify" class="btn btn-primary">수정</button>
					<button id="detail_cancel" class="btn btn-primary">작가 관리</button>
				</div>
			</div>
		</form>
	</div>
	
	<form id="moveForm" method="get">
    	<input type="hidden" name="authorId" value='<c:out value="${authorInfo.authorId}"/>'>
        <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
        <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>' >
        <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
    </form>
    
	<%@ include file="../includes/footer.jsp" %>
	
	<script>
		let moveForm = $("#moveForm");
	
		// 수정 페이지 이동 
		$("#detail_modify").on("click", function(e){
			e.preventDefault();
			moveForm.attr("action", "/readiya/authorModify");
			moveForm.submit();
		});
		
		// 작가 관리 페이지 이동
		$("#detail_cancel").on("click", function(e){
			e.preventDefault();
			$("input[name=authorId]").remove();
			moveForm.attr("action", "/readiya/authorManage");
			moveForm.submit();
			
		});
		
	</script>
</body>
</html>