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
<title>상품 상세 페이지</title>
<style type="text/css">
	.goods_content {
		padding-left: 32px;
		padding-top: 10px;
	}
	
	#nameLabel {
		padding-top: 6px;
	}
	
	#dateLabel {
		padding-top: 6px;
	}
	
	#updateLabel {
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
	
	#quantityLabel {
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
	
	#quantity_input {
		width: 150px;
		position: relative;
	}
	
	.quantity_span {
		position: absolute;
		left: 180px;
		bottom: 1px;
	}
	
	#minus_btn {
		margin-left: 5px;
	}
</style>
</head>
<body>
	<%@ include file="../includes/menu.jsp" %>
	
	<div class="container">
		<div class="goods_content">
			<div class="form-group row" id="nameDiv">
				<label class="col-sm-2" id="nameLabel">상품 제목</label>
					<div class="col-sm-3">
						<input type="text" id="bookName" name="bookName" class="form-control" value="<c:out value="${goodsInfo.bookName}"/>" disabled>
					</div>
			</div>
				
			<div class="form-group row" id="authorDiv">
				<label class="col-sm-2" id="authorLabel">작가</label>
					<div class="col-sm-3">
						<input type="text" id="authorId" value="<c:out value="${goodsInfo.authorName}"/>" class="form-control" readonly="readonly">
					</div>
			</div>
				
			<div class="form-group row" id="pubDiv">
				<label class="col-sm-2" id="pubLabel">출판일</label>
					<div class="col-sm-3">
						<input type="text" id="publeYear" name="publeYear" class="form-control" readonly="readonly" autocomplete="off" value="<c:out value="${goodsInfo.publeYear}"/>" disabled>
					</div>
			</div>
				
			<div class="form-group row" id="publisherDiv">
				<label class="col-sm-2" id="publisherLabel">출판사</label>
					<div class="col-sm-3">
						<input type="text" id="publisher" name="publisher" class="form-control" readonly="readonly" value="<c:out value="${goodsInfo.publisher}"/>" disabled>
					</div>
			</div>
				
			<div class="form-group row" id="cateDiv">
				<label class="col-sm-2" id="cateLabel">상품 카테고리</label>
					<div class="col-sm-3" id="cateSelect">
						<span>대분류</span>
							<select class="cate1" disabled>
								<option value="none">선택</option>
							</select><br>
								
						<span>중분류</span>
							<select class="cate2" disabled>
								<option value="none">선택</option>
							</select><br>
								
						<span>소분류</span>
							<select class="cate3" name="cateCode" disabled>
								<option value="none">선택</option>
							</select>  
					</div>
			</div>
				
			<div class="form-group row" id="priceDiv">
				<label class="col-sm-2" id="priceLabel">상품 가격</label>
					<div class="col-sm-3">
						<input type="text" id="bookPrice" name="bookPrice" class="form-control" value="<c:out value="${goodsInfo.bookPrice}"/>" disabled>
					</div>
			</div>
			
			<div class="form-group row" id="stockDiv">
				<label class="col-sm-2" id="stockLabel">상품 재고</label>
					<div class="col-sm-3">
						<input type="text" id="bookStock" name="bookStock" class="form-control" value="<c:out value="${goodsInfo.bookStock}"/>" disabled>
					</div>
			</div>
			
			<c:if test="${customer != null}">
				<div class="form-group row" id="quantityDiv">
					<label class="col-sm-2" id="quantityLabel">주문수량</label>
						<div class="col-sm-3">
							<input type="text" id="quantity_input" value="1" class="form-control">
							<span class="quantity_span">
								<button class="btn btn-primary" id="plus_btn">+</button>
								<button class="btn btn-primary" id="minus_btn">-</button>
							</span>
						</div>
				</div>
			</c:if>
				
			<div class="form-group row" id="discountDiv">
				<label class="col-sm-2" id="discountLabel">상품 할인율</label>
					<div class="col-sm-3">
						<input type="text" id="bookDiscount" name="bookDiscount" class="form-control" maxlength="2" disabled>
					</div>
			</div>
				
			<div class="form-group row" id="introDiv">
				<label class="col-sm-2" id="introLabel">상품 소개</label>
					<div class="col-sm-4">
						<textarea id="bookIntro" name="bookIntro" class="form-control" disabled>${goodsInfo.bookIntro}</textarea>
					</div>
			</div>
				
			<div class="form-group row" id="contentsDiv">
				<label class="col-sm-2" id="contentsLabel">상품 내용</label>
					<div class="col-sm-4">
						<textarea id="bookContents" name="bookContents" class="form-control" disabled>${goodsInfo.bookContents}</textarea>
					</div>
			</div>
			
			<c:if test="${customer != null}"> 
				<div class="form-group row" id="btnDiv">
					<div class="col-sm-9">
						<button id="detail_modify" class="btn btn-primary">수정</button>
						<button id="detail_cancel" class="btn btn-primary">상품 관리</button>
						<button id="detail_cart" class="btn btn-primary">장바구니</button>
					</div>
				</div>
			</c:if>
			
			<c:if test="${customer == null}">
				<div class="form-group row" id="btnDiv">
					<div class="col-sm-offset-2 col-sm-10">
						<button id="detail_cancel" class="btn btn-primary">상품 관리</button>
					</div>
				</div>
			</c:if>
		</div>
		
		<form id="moveForm" action="/readiya/goodsManage" method="get" >
	 		<input type="hidden" name="pageNum" value="${cri.pageNum}">
			<input type="hidden" name="amount" value="${cri.amount}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
	    </form>
	</div>
    
	<%@ include file="../includes/footer.jsp" %>
	
	<script>
		$(document).ready(function(){
			// 할인율 값 삽입
			let bookDiscount = '<c:out value="${goodsInfo.bookDiscount}"/>';
			$("#bookDiscount").attr("value", bookDiscount);
			
			// 카테고리
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
			function makeCateArray(obj,array,cateList, tier) {
				for (let i = 0; i < cateList.length; i++) {
					if (cateList[i].tier === tier) {
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
			
			let targetCate2 = '';
			let targetCate3 = '${goodsInfo.cateCode}';
			
			for (let i = 0; i < cate3Array.length; i++) {
				if (targetCate3 === cate3Array[i].cateCode) {
					targetCate3 = cate3Array[i];
				}
			}	
			
			/*console.log("targetCate3 : " + 	targetCate3);
			console.log("targetCate3.cateName : " + targetCate3.cateName);
			console.log("targetCate3.cateCode : " + targetCate3.cateCode);
			console.log("targetCate3.cateParent : " + targetCate3.cateParent);
			*/
			
			for (let i = 0; i < cate3Array.length; i++) {
				if (targetCate3.cateParent === cate3Array[i].cateParent) {
					cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");
				}
			}
			
			$(".cate3 option").each(function(i,obj){
				if(targetCate3.cateCode === obj.value){
					$(obj).attr("selected", "selected");
				}
			});	
			
			for (let i = 0; i < cate2Array.length; i++) {
				if (targetCate3.cateParent === cate2Array[i].cateCode) {
					targetCate2 = cate2Array[i];	
				}
			}
			
			for (let i = 0; i < cate2Array.length; i++) {
				if (targetCate2.cateParent === cate2Array[i].cateParent) {
					cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");
				}
			}		
			
			$(".cate2 option").each(function(i,obj) {
				if(targetCate2.cateCode === obj.value) {
					$(obj).attr("selected", "selected");
				}
			});	
			
			for (let i = 0; i < cate1Array.length; i++) {
				cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
			}
			
			$(".cate1 option").each(function(i,obj) {
				if(targetCate2.cateParent === obj.value) {
					$(obj).attr("selected", "selected");
				}
			});	
			
			let moveForm = $("#moveForm");
			
			// 수정 페이지 이동
			$("#detail_modify").on("click", function(e){
				e.preventDefault();
				let addInput = '<input type="hidden" name="bookId" value="${goodsInfo.bookId}">';
				$("#moveForm").append(addInput);
				$("#moveForm").attr("action", "/readiya/goodsModify");
				$("#moveForm").submit();
			});	
			
			// 상품 관리 페이지 이동 
			$("#detail_cancel").on("click", function(e){
				e.preventDefault();
				$("input[name=bookId]").remove();
				moveForm.attr("action", "/readiya/goodsManage");
				moveForm.submit();	
			});	
			
			// 주문수량 버튼 조작
			let quantity = $("#quantity_input").val();
			let bookStock = $("#bookStock").val();

			$("#plus_btn").on("click", function(){
				if (quantity < bookStock)
					$("#quantity_input").val(++quantity);
				else
					alert("주문수량이 상품 재고수를 초과하였습니다.");
	
			});
			
			$("#minus_btn").on("click", function(){
				if (quantity > 1)
					$("#quantity_input").val(--quantity);	
				else 
					alert("상품은 최소 1개 이상 주문 가능합니다.");
	
			});
			
			// 장바구니 서버로 전송할 데이터
			const form = {
				id: '${customer.id}',
				bookId: '${goodsInfo.bookId}',
				bookCount: ''
			}
			
			// 장바구니 버튼
			form.bookCount = $("#quantity_input").val();
			
			$("#detail_cart").on("click", function(e){
				$.ajax({
					url: '/goodsCart',
					type: 'POST',
					data: form,
					success: function(result){
						cartAlert(result);
					}
				})
			});
			
			function cartAlert(result) {
				if (result == '1') {
					alert("장바구니에 추가되었습니다.");
				}else if (result == '2') {
					alert("장바구니에 이미 추가되어져 있습니다.");
				}
				
			}
			
		});
		
	</script>
</body>
</html>