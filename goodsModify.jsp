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
<script>
	src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"
</script>
<title>상품 수정 페이지</title>
<style type="text/css">
	#modifyForm {
		margin-top: 30px;
		padding-left: 35px;
	}
	
	#nameLabel {
		padding-top: 6px;
	}
	
	#authorLabel {
		padding-top: 6px;
	}
	
	#pubLabel {
		padding-top: 6px;
	}
	
	#publisherLabel {
		padding-top: 6px;
	}
	
	#cateLabel {
		padding-top: 16px;
	}
	
	#priceLabel {
		padding-top: 6px;
	}
	
	#stockLabel {
		padding-top: 6px;
	}
	
	#discountLabel {
		padding-top: 6px;
	}
	
	#discountPriceLabel {
		padding-top: 6px;
	}
	
	#introLabel {
		padding-top: 6px;
	}
	
	#contentsLabel {
		padding-top: 6px;
	}
	
	#btnDiv {
		margin-top: 20px;
		padding-left: 25px;
	}
	
	input[type=text] {
		width: 250px;
	}
	
	#cateSelect select {
	    width: 60%;
	    height: 35px;
	    font-size: 17px;
	    text-align-last: center;
	    margin-left: 5px;
	    margin-top: 5px;
	}
	
	#cateSelect span {
	    font-weight: 600;
	}
	
	.span_discount {						
		display: block;
	    padding-top: 5px;
	    font-weight: 500;
	}

</style>
</head>
<body>
	<%@ include file="../includes/menu.jsp" %>
	
	<div class="container">
		<form action="/readiya/goodsModify" method="post" id="modifyForm">
			<div class="form-group row" id="nameDiv">
				<label class="col-sm-2" id="nameLabel">상품 제목</label>
					<div class="col-sm-3">
						<input type="text" id="bookName" name="bookName" class="form-control" value="${goodsInfo.bookName}">
					</div>
			</div>
				
			<div class="form-group row" id="authorDiv">
				<label class="col-sm-2" id="authorLabel">작가</label>
					<div class="col-sm-3">
						<input type="text" id="authorId" name="readiya_author_Id" class="form-control" readonly="readonly" value="${goodsInfo.authorName}" style="position:relative;">
						<input id="authorId_input" name="authorId" type="hidden" value="${goodsInfo.authorId}">
						<button class="btn btn-primary" id="authorId_btn" style="position:absolute; left:280px; bottom:1px;">작가 선택</button>
					</div>
			</div>
				
			<div class="form-group row" id="pubDiv">
				<label class="col-sm-2" id="pubLabel">출판일</label>
					<div class="col-sm-3">
						<input type="text" id="publeYear" name="publeYear" class="form-control" value="${goodsInfo.publeYear}">
					</div>
			</div>
				
			<div class="form-group row" id="publisherDiv">
				<label class="col-sm-2" id="publisherLabel">출판사</label>
					<div class="col-sm-3">
						<input type="text" id="publisher" name="publisher" class="form-control" value="${goodsInfo.publisher}">
					</div>
			</div>
				
			<div class="form-group row" id="cateDiv">
				<label class="col-sm-2" id="cateLabel">상품 카테고리</label>
					<div class="col-sm-3" id="cateSelect">
						<span>대분류</span>
							<select class="cate1">
								<option selected value="none">선택</option>
							</select><br>
								
						<span>중분류</span>
							<select class="cate2">
								<option selected value="none">선택</option>
							</select><br>
								
						<span>소분류</span>
							<select class="cate3" name="cateCode">
								<option selected value="none">선택</option>
							</select>  
					</div>
			</div>
				
			<div class="form-group row" id="priceDiv">
				<label class="col-sm-2" id="priceLabel">상품 가격</label>
					<div class="col-sm-3">
						<input type="text" id="bookPrice" name="bookPrice" class="form-control" value="${goodsInfo.bookPrice}">
					</div>
			</div>
				
			<div class="form-group row" id="stockDiv">
				<label class="col-sm-2" id="stockLabel">상품 재고</label>
					<div class="col-sm-3">
						<input type="text" id="bookStock" name="bookStock" class="form-control" value="${goodsInfo.bookStock}">
					</div>
			</div>
				
			<div class="form-group row" id="discountDiv">
				<label class="col-sm-2" id="discountLabel">상품 할인율</label>
					<div class="col-sm-3">
						<input type="text" id="bookDiscount" name="bookDiscount" class="form-control" maxlength="2" value="0">
					</div>
			</div>
			
			<div class="form-group row" id="discountPriceDiv">
				<label class="col-sm-2" id="discountPriceLabel">할인된 가격</label>
					<div class="col-sm-3">
						<input name="bookDiscount_interface" type="hidden" value="${goodsInfo.bookDiscount}">
						<span class="span_discount"></span>
					</div>
			</div>
				
			<div class="form-group row" id="introDiv">
				<label class="col-sm-2" id="introLabel">상품 소개</label>
					<div class="col-sm-4">
						<textarea id="bookIntro" name="bookIntro" class="form-control">${goodsInfo.bookIntro}</textarea>
					</div>
			</div>
				
			<div class="form-group row" id="contentsDiv">
				<label class="col-sm-2" id="contentsLabel">상품 내용</label>
					<div class="col-sm-4">
						<textarea id="bookContents" name="bookContents" class="form-control">${goodsInfo.bookContents}</textarea>
					</div>
			</div>
			
			<input type="hidden" name='bookId' value="${goodsInfo.bookId}">
		</form>
		
		<div class="form-group row" id="btnDiv">
			<div class="col-sm-offset-2 col-sm-10">
				<button id="detail_modify" class="btn btn-primary">수정</button>
				<button id="detail_cancel" class="btn btn-primary">상품 관리</button>
				<button id="detail_delete" class="btn btn-primary">삭제</button>
			</div>
		</div>
		
		
		<form id="moveForm" action="/readiya/goodsManage" method="get" >
	 		<input type="hidden" name="pageNum" value="${cri.pageNum}">
			<input type="hidden" name="amount" value="${cri.amount}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
			<input type="hidden" name='bookId' value="${goodsInfo.bookId}">
	    </form>
	</div>
    
	<%@ include file="../includes/footer.jsp" %>
	
	<script>
		// 수정 버튼 
		$("#detail_modify").on("click", function(e){
			e.preventDefault();
			
			// 검사 통과 유무 변수 
			let bookNameCk = false;
			let authorIdCk = false;
			let publeYearCk = false;
			let publisherCk = false;
			let cateCodeCk = false;
			let priceCk = false;
			let stockCk = false;
			let discountCk = false;
			let introCk = false;
			let contentsCk = false;
			
			// 입력값 변수 
			let bookName = $("input[name='bookName']").val();
			let authorId = $("input[name='authorId']").val();
			let publeYear = $("input[name='publeYear']").val();
			let publisher = $("input[name='publisher']").val();
			let cateCode = $("select[name='cateCode']").val();
			let bookPrice = $("input[name='bookPrice']").val();
			let bookStock = $("input[name='bookStock']").val();
			let bookDiscount = $("input[name='bookDiscount']").val();
			let bookIntro = $("input[name='bookIntro']").val();
			let bookContents = $("input[name='bookContents']").val();
			
			// 상품 이름 유효성 검사
			if (bookName) {
				bookNameCk = true;
			}else {
				alert("상품 이름을 입력해주세요.");
				bookNameCk = false;
			}
			
			// 작가 이름 유효성 검사
			if (authorId) {
				authorIdCk = true;
			}else {
				alert("작가를 선택해주세요.");
				authorIdCk = false;
			}
			
			// 출판일 유효성 검사
			if (publeYear) {
				publeYearCk = true;
			}else {
				alert("출판일을 입력해주세요.");
				publeYearCk = false;
			}	
			
			// 츨판사 유효성 검사
			if (publisher) {
				publisherCk = true;
			}else {
				alert("출판사를 입력해주세요.");
				publisherCk = false;
			}
			
			// 카테고리 코드 유효성 검사
			if (cateCode != 'none') {
				cateCodeCk = true;
			}else {
				alert("카테고리 코드를 선택해주세요.");
				cateCodeCk = false;
			}
			
			// 상품 가격 유효성 검사
			if (bookPrice != 0) {
				priceCk = true;
			}else {
				alert("상품 가격을 입력해주세요.");
				priceCk = false;
			}	
			
			// 상품 재고 유효성 검사
			if (bookStock != 0) {
				stockCk = true;
			}else {
				alert("상품 재고를 입력해주세요.");
				stockCk = false;
			}		
			
			// 상품 할인율 유효성 검사
			if (!isNaN(bookDiscount)) {
				discountCk = true;
			}else {
				alert("상품 할인율 입력해주세요.(1~99 사이의 숫자)");
				discountCk = false;
			}	
			
			// 상품 소개 유효성 검사
			if ($("#bookIntro").val() != '') {
				introCk = true;
			}else {
				alert("상품 소개를 입력해주세요.");
				introCk = false;
			}	
			
			// 상품 내용 유효성 검사
			if ($("#bookContents").val() != '') {
				contentsCk = true;
			}else {
				alert("상품 내용을 입력해주세요.");
				contentsCk = false;
			}
			
			// 최종 유효성 검사
			if (bookNameCk && authorIdCk && publeYearCk && publisherCk && cateCodeCk && priceCk && stockCk && discountCk && introCk && contentsCk) {
				//alert('통과');
				$("#modifyForm").submit();
			}else {
				return false;
			}
		});
		
		// 상품 관리 버튼 
		$("#detail_cancel").on("click", function(e){
			e.preventDefault();
			$("#moveForm").submit();
		});
		
		// 삭제 버튼 
		$("#detail_delete").on("click", function(e){
			e.preventDefault();
			let moveForm = $("#moveForm");
			moveForm.find("input").remove();
			moveForm.append('<input type="hidden" name="bookId" value="${goodsInfo.bookId}">');
			moveForm.attr("action", "/readiya/goodsDelete");
			moveForm.attr("method", "post");
			moveForm.submit();
		});
		
		// 작가 선택 버튼 
		$('#authorId_btn').on("click",function(e){
			e.preventDefault();
			let popUrl = "/readiya/authorPop";
			let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
			
			window.open(popUrl,"작가 찾기",popOption);
		});
		
		// 카테고리 */
		let cateList = JSON.parse('${cateList}');
		
		let cate1Array = new Array();
		let cate2Array = new Array();
		let cate3Array = new Array();
		let cate1Obj = new Object();
		let cate2Obj = new Object();
		let cate3Obj = new Object();
		
		let cateSelect1 = $(".cate1");		
		let cateSelect2 = $(".cate2");
		let cateSelect3 = $(".cate3");
		
		// 카테고리 배열 초기화 메서드
		function makeCateArray(obj,array,cateList, tier){
			for(let i = 0; i < cateList.length; i++){
				if(cateList[i].tier === tier){
					obj = new Object();
					
					obj.cateName = cateList[i].cateName;
					obj.cateCode = cateList[i].cateCode;
					obj.cateParent = cateList[i].cateParent;
					
					array.push(obj);				
					
				}
			}
		}
		
		// 배열 초기화
		makeCateArray(cate1Obj,cate1Array,cateList,1);
		makeCateArray(cate2Obj,cate2Array,cateList,2);
		makeCateArray(cate3Obj,cate3Array,cateList,3);
		
		/*$(document).ready(function(){
			console.log(cate1Array);
			console.log(cate2Array);
			console.log(cate3Array);
		});
		*/
		
		// 대분류 <option> 태그
		for(let i = 0; i < cate1Array.length; i++){
			cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
		}
		
		// 중분류 <option> 태그
		$(cateSelect1).on("change",function(){
			let selectVal1 = $(this).find("option:selected").val();
			cateSelect2.children().remove();
			cateSelect3.children().remove();
			
			cateSelect2.append("<option value='none'>선택</option>");
			cateSelect3.append("<option value='none'>선택</option>");
			
			for (let i = 0; i < cate2Array.length; i++) {
				if (selectVal1 === cate2Array[i].cateParent) {
					cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
				}
			}// for
		});
		
		// 소분류 <option>태그
		$(cateSelect2).on("change",function(){
			let selectVal2 = $(this).find("option:selected").val();
			cateSelect3.children().remove();
			cateSelect3.append("<option value='none'>선택</option>");
			
			for (let i = 0; i < cate3Array.length; i++) {
				if (selectVal2 === cate3Array[i].cateParent) {
					cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");	
				}
			}// for		
			
		});
		
		// 할인율 input 설정
		$("#bookDiscount").on("propertychange change keyup paste input", function(){
			
			let userInput = $("#bookDiscount");
			let discountInput = $("input[name='bookDiscount_interface']");
			
			let discountRate = userInput.val();					            // 사용자가 입력할 할인값
			let sendDiscountRate = discountRate / 100;		                // 서버에 전송할 할인값
			let goodsPrice = $("input[name='bookPrice']").val();			// 원가
			let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
			
			if (!isNaN(discountRate)) {
				$(".span_discount").html(discountPrice);
				discountInput.val(sendDiscountRate);
			}
		});
		
		$("input[name='bookPrice']").on("change", function(){
			
			let userInput = $("#bookDiscount");
			let discountInput = $("input[name='bookDiscount_interface']");
			
			let discountRate = userInput.val();					            // 사용자가 입력한 할인값
			let sendDiscountRate = discountRate / 100;			            // 서버에 전송할 할인값
			let goodsPrice = $("input[name='bookPrice']").val();			// 원가
			let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
			
			if (!isNaN(discountRate)) {
				$(".span_discount").html(discountPrice);
			}
		});
	</script>
</body>
</html>