<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"
</script>
<style type="text/css">
	.goods_wrap {
		padding: 20px 35px;
	}
	
	.goods_table {
		width: 80%;
		margin-left: 200px;
		margin-top: 50px;
	    border: 1px solid #d3d8e1;
	    text-align: center;
	    border-collapse: collapse;
	}
	
	.goods_table td {
		padding: 10px 5px;
		border : 1px solid #e9ebf0;
	}
	
	.goods_table thead {
		background-color: #f8f9fd;	
		font-weight: 600;
	}
	
	.book_id {
		width: 120px;
	}
	
	.book_name {
		width: 120px;
	}
	
	.author_name {
		width: 110px;
	}
	
	.category {
		width: 140px;
	}
	
	.book_stock {
		width: 140px;
	}
	
	.book_reg{
		width: 140px;
	}
	
	.book_update{
		width: 140px;
	}
	
	.pageMaker_wrap {
		text-align: center;
	    margin-top: 30px;
	    margin-bottom: 40px;
	}
	
	.pageMaker_wrap a {
		color : black;
	}
	
	.pageMaker {
	    list-style: none;
	    display: inline-block;
	}	
	
	.pageMaker_btn {
	    float: left;
	    width: 40px;
	    height: 40px;
	    line-height: 40px;
	    margin-left: 20px;
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
	    text-align:center;	
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
	    bottom: 2px;
	    background-color: #f8f9fd;
	}	
	
	.table_empty{
		height: 50px;
	    text-align: center;
	    margin: 200px 0 215px 0px;
	    font-size: 25px;
	}
	
	.goods_table a{
		color:#1088ed;
		font-weight: 500;
	}
</style>	
</head>
<body>
	<%@ include file="../includes/menu.jsp" %>
    
    <div style="padding-top: 50px" class="goods_wrap">
		<c:if test="${listCheck != 'empty' }">
			<table class="goods_table">
				<thead>
					<tr>
						<td class="book_id">상품 번호</td>
						<td class="book_name">상품 이름</td>
						<td class="author_name">작가 이름</td>
						<td class="category">카테고리</td>
						<td class="book_stock">재고</td>
						<td class="book_reg">등록 날짜</td>
						<td class="book_update">수정 날짜</td>
					</tr>
				</thead>	
				
				<c:forEach items="${list}" var="list">
					<tr>
						<td><c:out value="${list.bookId}"></c:out></td>
						<td>
							<a class="move" href='<c:out value="${list.bookId}"/>'>
								<c:out value="${list.bookName}"></c:out>
							</a>
						</td>
						<td><c:out value="${list.authorName}"></c:out></td>
						<td><c:out value="${list.cateName}"></c:out></td>
						<td><c:out value="${list.bookStock}"></c:out></td>
						<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${list.updateDate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		
		<c:if test="${listCheck == 'empty'}">
        	<div class="table_empty">
            	등록된 상품이 없습니다.
            </div>
        </c:if>  
	</div>
	
	<div class="search_wrap">
    	<form id="searchForm" action="/readiya/goodsManage" method="get">
        	<div class="search_input">
            	<input type="text" name="keyword" placeholder="상품 이름을 입력하세요." value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
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
	
	<form id="moveForm" action="/readiya/goodsManage" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>
    
	<%@ include file="../includes/footer.jsp" %>
	
	<script>
		// 등록 성공
		$(document).ready(function(){
			let eResult = '<c:out value="${enroll_result}"/>';
			checkResult(eResult);
			
			function checkResult(result) {
				
				if (result === '') {
					return;
				}
				
				alert("상품'"+ eResult +"'을 등록하였습니다.");
				
			}
			
			// 수정 성공
			let modify_result = '${modify_result}';
			
			if (modify_result == 1) {
				alert("상품 수정이 완료되었습니다.");
			}	
			
			// 삭제 성공
			let delete_result = '${delete_result}';
			
			if (delete_result == 1) {
				alert("선택하신 상품이 삭제되었습니다.");
			}
		});
		
		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');

		// 상품 검색 버튼 동작 
		$("#searchForm button").on("click", function(e){
			e.preventDefault();
			
			// 검색 키워드 유효성 검사 
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			searchForm.submit();
			
		});
	
		// 페이지 이동 버튼 
		$(".pageMaker_btn a").on("click", function(e){
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.submit();
			
		});
		
		// 상품 상세 페이지 이동
		$(".move").on("click", function(e){
			e.preventDefault();
			
			moveForm.append("<input type='hidden' name='bookId' value='"+$(this).attr("href") + "'>");
			moveForm.attr("action", "/readiya/goodsDetail");
			moveForm.submit();
			
		});
	</script>
</body>
</html>