<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 선택 pop 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"
</script>
<style type="text/css">
	.author_wrap {
		width: 100%;
	}
	
	.author_table {
		width: 80%;
		margin-left: 60px;
		margin-top: 10px;
	    border: 1px solid #d3d8e1;
	    text-align: center;
	    border-collapse: collapse;
	}
	
	.author_table td {
		padding: 10px 5px;
		border : 1px solid #e9ebf0;
	}
	
	.author_table thead {
		background-color: #f8f9fd;	
		font-weight: 600;
	}
	
	.author_id {
		width: 120px;
	}
	
	.author_name {
		width: 120px;
	}
	
	.author_nation {
		width: 110px;
	}
	
	.pageMaker_wrap {
		padding:0.1em;
		text-align: center;
	    margin-top: 30px;
	    margin-bottom: 40px;
	}
	
	.pageMaker_wrap a {
		color : black;
		padding: 0.1em;
	}
	
	.pageMaker {
		width: 100%;
	    list-style: none;
	    display: inline-block;
	}	
	
	.pageMaker_btn {
	    float: left;
	    width: 40px;
	    height: 40px;
	    line-height: 40px;
	    margin-left: 4px;
	}
	
	.next, .prev {
	    border: 1px solid #ccc;
	}
	
	.next a, .prev a {
	    color: #ccc;
	}
	
	.active {							
		border : 2px solid black;
		font-weight:400;
	}
	
	.search_wrap {
		margin-top:15px;
	}
	
	.search_input {
	    position: relative;
	    text-align: center;
	    margin-right: 50px;	
	}
	
	.search_input input[name='keyword'] {
		padding: 4px 10px;
	    font-size: 15px;
	    height: 30px;
	    line-height: 20px;
	    
	}
	
	.search_btn {
		height: 32px;
	    width: 80px;
	    font-weight: 600;
	    font-size: 18px;
	    line-height: 20px;
	    position: absolute;
	    margin-left: 15px;
	    margin-top: 5px;
	    background-color: #f8f9fd;
	}
	
	.table_empty{
		height: 50px;
	    text-align: center;
	    margin: 200px 0 215px 0px;
	    font-size: 25px;
	}
	
	.author_table a{
		color:#1088ed;
		font-weight: 500;
	}
</style>
</head>
<body>
	<div style="padding-top: 50px" class="author_wrap">
		<c:if test="${listCheck != 'empty' }">
			<table class="author_table">
				<thead>
					<tr>
						<td class="author_id">작가 번호</td>
						<td class="author_name">작가 이름</td>
						<td class="author_nation">작가 국가</td>
					</tr>
				</thead>	
				
				<c:forEach items="${list}" var="list">
					<tr>
						<td><c:out value="${list.authorId}"></c:out></td>
						<td>
							<a class="move" href='<c:out value="${list.authorId}"/>' data-name='<c:out value="${list.authorName}"/>'>
								<c:out value="${list.authorName}"/>
							</a>
						</td>
						<td><c:out value="${list.nationName}"></c:out></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		
		<c:if test="${listCheck == 'empty'}">
        	<div class="table_empty">
            	등록된 작가가 없습니다. 다시 검색해주세요.
            </div>
        </c:if>  
	
	
		<div class="search_wrap">
	    	<form id="searchForm" action="/readiya/authorPop" method="get">
	        	<div class="search_input">
	            	<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
	                <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
	                <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
	                <button class='btn search_btn'>검 색</button>
	            </div>
	    	</form>
		</div>  
		
	    <div class="pageMaker_wrap" >
			<ul class="pageMaker">
		    	<c:if test="${pageMaker.prev}">
		        	<li class="pageMaker_btn prev">
		            	<a href="${pageMaker.pageStart - 1}">이전</a>
		            </li>
		        </c:if>
		                    
		        <c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
		        	<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
		            	<a href="${num}">${num}</a>
		            </li>
		        </c:forEach>
		                    	
		        <c:if test="${pageMaker.next}">
		        	<li class="pageMaker_btn next">
		            	<a href="${pageMaker.pageEnd + 1 }">다음</a>
		            </li>
		        </c:if>	
			</ul>   
    	</div>
    
	    <form id="moveForm" action="/readiya/authorPop" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
	</div>
	
	<script>
		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');
		const openerWindow = window.opener;
		 
		// 페이지 이동 버튼
		$(".pageMaker_btn a").on("click", function(e){
		    e.preventDefault();
		    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		    moveForm.submit();
		});
		
		// 작가 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e){
			e.preventDefault();
	
			// 검색 키워드 유효성 검사
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하십시오.");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			searchForm.submit();
		});
		
		// 작가 선택 및 팝업창 닫기
		$(".move").on("click", function(e){
			e.preventDefault();
			let authorId = $(this).attr("href");
			let authorName = $(this).data("name");
			
			$(opener.document).find("#authorId_input").val(authorId);
			$(opener.document).find("#authorId").val(authorName);
			
			window.close();
		});	
	</script>
</body>
</html>