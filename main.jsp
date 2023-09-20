<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./includes/menu.jsp" %>
	
<header class="bg-dark py-5">
	<div class="container px-5">
    	<div class="row gx-5 align-items-center justify-content-center">
        	<div class="col-lg-8 col-xl-7 col-xxl-6">
            	<div class="my-5 text-center text-xl-start">
                	<h1 class="display-5 fw-bolder text-white mb-2">READIYA에 방문해 주셔서 감사합니다!</h1>
                    <p class="lead fw-normal text-white-50 mb-4">READIYA는 현대인들의 독서 증진을 위하여 설립된 공간입니다. 자유롭게 둘러보시고 원하는 상품을 찾아보세요~</p>
                </div>
        	</div>
    	</div>
	</div>
</header>

<script>
$(document).ready(function(){
	let result = '<c:out value="${register_result}"/>';
    checkResult(result);
    
    function checkResult(result){
        if(result === '') {
            return;
        }
        
        alert("회원가입에 성공하였습니다.");
    }
    
});
</script>
<%@ include file="./includes/footer.jsp" %>
        