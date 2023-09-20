<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
	#email_num {
		display: none;
	}

	#email_confirm {
		display: none;
	}
</style>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"
</script>
</head>
<body>
	<%@ include file="../includes/menu.jsp" %>
	
	<div class="container" align="center" style="margin-top:70px;">
		<form name="newCustomer" id="register_form" class="form-horizontal"
		      method="post">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-6">
					<input name="id" id="id_input" style="float:left; width:35%;" type="text" class="form-control">
					<input type="button" id="id_confirm" style="float:left; margin-left:10px; width:22%" value="아이디 중복확인">			
				</div>
			</div>
			
			<div class="form-group row" style="clear:both;">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" id="password_input"type="password" class="form-control">				
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" id="password_confirm" type="password" class="form-control">				
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" id="name_input" type="text" class="form-control">				
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">나이</label>
				<div class="col-sm-3">
					<input name="age" id="age_input" type="text" class="form-control">				
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-3">
					<input name="gender" id="gender_input" type="text" class="form-control">				
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">생년월일</label>
				<div class="col-sm-3">
					<input name="birth" id="birth_input" type="text" class="form-control" placeholder="예)1990/09/15">				
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" id="phone_input" type="text" class="form-control" placeholder="예)010-1234-5678">				
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input name="address" id="address_input_1" style="float:left; width:60%;" type="text" class="form-control" readonly="readonly">
					<input type="button" id="address_btn" style="float:left; margin-left:10px; width:30%; margin-bottom:20px;" value="주소 찾기" onclick="execution_daum_address()">
					<input name="address" id="address_input_2" type="text" class="form-control" readonly="readonly">
				<input name="address" id="address_input_3" type="text" class="form-control" style="margin-top:10px;" readonly="readonly">			
				</div>
				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-6">
					<input name="email" id="email" type="text" style="float:left; width:35%;" class="form-control">
					<input type="button" id="email_btn" style="float:left; margin-left:10px; width:22%" value="인증번호 전송">				
				</div>
					
				<div class="col-sm-6" id="email_check_wrap" style="padding-left:232px; padding-top:15px; clear:both">
					<input name="email_num" id="email_num" type="text" style="float:left; width:54%;" class="form-control" placeholder="인증번호를 입력하세요">
					<input type="button" id="email_confirm" style="float:left; margin-left:10px; width:22%" value="확인">				
				</div>
			</div>
			
			<div class="form-group row" align="left" style="margin-left:50px;">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" id="register_btn" class="btn btn-primary" value="등록">
					<input type="reset" class="btn btn-primary" value="취소" onclick="reset()">
					<button type="button" class="btn btn-primary" onclick="location.href='../main'">홈으로</button>	
				</div>
			</div>
		</form>
	</div>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		// 이메일로 전송한 인증번호를 저장하는 변수
		var code = "";  
		
		// 유효성 검사 통과유무 변수 
		 var idCheck = false;                  // 아이디
		 var idckCheck = false;                // 아이디 중복 검사
		 var passwordCheck = false;            // 비밀번호
		 var passwordckCheck = false;          // 비밀번호 확인
		 var passwordckCorCheck = false;       // 비밀번호 확인 일치 확인
		 var nameCheck = false;          	   // 이름
		 var ageCheck = false;                 // 나이
		 var genderCheck = false;              // 성별
		 var birthCheck = false;               // 생년월일
		 var phoneCheck = false;               // 전화번호
		 var addressCheck = false              // 주소
		 var emailCheck = false;               // 이메일
		 var emailNumCheck = false;			   // 이메일 인증번호 전송
		 var emailNumInput = false;            // 이메일 인증번호 입력
		 var emailNumConfirm = false;          // 이메일 인증번호 확인
		 
		$(function(){
			//회원가입 버튼(회원가입 기능 작동)
			$("#register_btn").click(function(){
				// 입력값 변수
				var id = $('#id_input').val();                 		    // 아이디 입력란
				var password = $('#password_input').val();     		    // 비밀번호 입력란
				var passwordConfirm = $('#password_confirm').val();		// 비밀번호 확인 입력란
		        var name = $('#name_input').val();            		    // 이름 입력란
		        var age = $('#age_input').val();              		    // 나이 입력란
		        var gender = $('#gender_input').val();        		    // 성별 입력란
		        var birth = $('#birth_input').val();          		    // 생년월일 입력란
		        var phone = $('#phone_input').val();          		    // 전화번호 입력란
		        var address = $('#address_input_3').val();    		    // 상세주소 입력란
		        var email = $('#email').val();          			    // 이메일 입력란
		        var emailNum = $('#email_num').val();                   // 이메일 인증번호 입력란
		        
		     	// 아이디 유효성검사 
		        if (id == "") {
		        	alert("아이디를 입력해주세요.");
		        	idCheck = false;
		        }else {
		        	idCheck = true;
		        }
		        
		     	// 아이디 중복체크 유효성검사 
		        if (idckCheck == false) {
		        	alert("아이디 중복확인을 진행해주세요.");
		        }else {
		        	idchCheck = true;
		        }
		     	
		     	// 비밀번호 유효성검사 
		        if (password == "") {
		        	alert("비밀번호를 입력해주세요.");
		        	passwordCheck = false;
		        }else {
		        	passwordCheck = true;
		        }
		     	
		     	// 비밀번호 확인 유효성검사 
		        if (passwordConfirm == "") {
		        	alert("비밀번호를 입력해주세요.");
		        	passwordckCheck = false;
		        }else {
		        	passwordckCheck = true;
		        }
		        
		     	// 비밀번호 확인 유효성검사 
		        if (password != passwordConfirm) {
		        	alert("비밀번호를 동일하게 입력하세요.");
		        	passwordckCorCheck = false;
		        }else {
		        	passwordckCorCheck = true;
		        }
		     	
		        // 이름 유효성검사 
		        if (name == "") {
		        	alert("이름을 입력해주세요.");
		        	nameCheck = false;
		        }else {
		        	nameCheck = true;
		        }
		        
			    // 나이 유효성검사 
			    if (age == "") {
			    	alert("나이를 입력해주세요.");
			    	ageCheck = false;
			    }else {
			    	ageCheck = true;
			    }
			    
			 	// 성별 유효성검사 
			    if (gender == "") {
			    	alert("성별을 입력해주세요.");
			    	genderCheck = false;
			    }else {
			    	genderCheck = true;
			    }
			 	
			 	// 생년월일 유효성검사 
			    if (birth == "") {
			    	alert("생년월일을 입력해주세요.");
			    	birthCheck = false;
			    }else {
			    	birthCheck = true;
			    }
			 	
			 	// 전화번호 유효성검사 
			    if (phone == "") {
			    	alert("전화번호를 입력해주세요.");
			    	phoneCheck = false;
			    }else {
			    	phoneCheck = true;
			    }
			 	
			 	// 상세주소 유효성검사 
			    if (address == "") {
			    	alert("상세주소를 입력해주세요.");
			    	addressCheck = false;
			    }else {
			    	addressCheck = true;
			    }
			 	
			 	// 이메일 유효성검사 
			    if (email == "") {
			    	alert("이메일을 입력해주세요.");
			    	emailCheck = false;
			    }else {
			    	emailCheck = true;
			    }
			 	
			 	// 이메일 인증번호 전송 유효성검사 
		        if (emailNumCheck == false) {
		        	alert("이메일 인증번호를 전송해주세요.");
		        }else {
		        	emailNumCheck = true;
		        }
			 	
		     	// 이메일 인증번호 입력 유효성검사 
		        if (emailNum == false) {
		        	alert("이메일 인증번호를 입력해주세요.");
		        	emailNumInput = false;
		        }else {
		        	emailNumInput = true;
		        }
		     	
		    	 // 이메일 인증번호 확인 유효성검사 
		        if (emailNumConfirm == false) {
		        	alert("이메일 인증번호를 확인해주세요.");
		        }else {
		        	emailNumConfirm = true;
		        }
		    	 
		    	// 최종 유효성 검사
		    	if (idCheck&&idckCheck&&passwordCheck&&passwordckCheck&&passwordckCorCheck&&nameCheck
		    		&&ageCheck&&genderCheck&&birthCheck&&phoneCheck&&addressCheck&&emailCheck
		    		&&emailNumCheck&&emailNumInput&&emailNumConfirm) {
		    		$("#register_form").attr("action", "/customer/register");
					$("#register_form").submit();
		    	}
		    	
		    	return false;
			});
			
			// 메인 페이지로 이동
			$("#home_btn").click(function(){
				return "redirect:../main";
			});
		});
		
		//아이디 중복검사
		$("#id_confirm").on("click", function(){
			var customerId = $("#id_input").val();  // 아이디 입력칸에 입력되는 값
			var data = {customerId : customerId};
			
			$.ajax({
				type: 'POST',
				url: "/customer/customerIdChk",
				data: data,
				success: function(result) {
					// console.log("성공 여부: " + result);
					if (result != 'fail'){
						alert("사용 가능한 아이디입니다.");
						idckCheck = true;
					}else {
						alert("이미 존재하는 아이디입니다.");
						idckCheck = false;
					}
				}
			});
		});
		
		// 이메일 인증번호 전송하기
		$("#email_btn").click(function(){
		    var email = $("#email").val();
		    
		    $.ajax({ 
		        type: "GET",
		        url: "mailCheck?email=" + email,
		        success: function(data) {
		        	//console.log("data : " + data);
		        	code = data;
		        	alert("입력하신 이메일로 인증번호를 전송하였습니다.");
		        	$('#email_num').css("display","inline-block");
		        	$('#email_confirm').css("display","inline-block");
		        	emailNumCheck = true;
		        }
		    });
		});
		
		// 이메일 인증번호 일치하는지 확인하기
		$("#email_confirm").click(function(){
			var emailNum = $("#email_num").val();
			//console.log("code" + code);
			
			if (code == emailNum) {
				alert("인증에 성공하였습니다!");
				$('#email_num').css("background-color", "gray");
				emailNumConfirm = true;
			}else {
				alert("인증에 실패하셨습니다. 인증번호를 다시 확인해주세요.");
				$('#email_num').focus();
				emailNumConfirm = false;
			}
		});
		
		// 다음 주소 API 연동 
		function execution_daum_address() {
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                 	// 주소변수 문자열과 참고항목 문자열 합치기
	                    addr += extraAddr;
	                
	                } else {
	                	addr += ' ';
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("#address_input_1").val(data.zonecode);
            		//$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            		$("#address_input_2").val(addr);
            		//$("[name=memberAddr2]").val(addr);            // 대체가능
	                // 커서를 상세주소 필드로 이동한다.
            		$("#address_input_3").attr("readonly",false);
                    $("#address_input_3").focus();
                    $("#address_input_3").css("placeholder", "상세주소를 입력해주세요.");
		        }
		    }).open();  
		}
	</script>	
	<%@ include file="../includes/footer.jsp" %>
</body>
</html>