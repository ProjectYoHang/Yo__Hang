<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head include-html="/static/html/common/head.html">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 가입</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById( 'signupbtn' ).onclick = function() {
			let frm = document.signupfrm;
			debugger;
			if( frm.id.value.trim() == '' ) {
				alert( '아이디를 입력하세요.' );
				return false;
			}
			if( frm.id_ok.value != 'Y'){
				alert( '사용할 수 없는 아이디입니다.' );
				return false;
			}
			if( frm.name.value.trim() == '' ) {
				alert( '이름을 입력하세요.' );
				return false;
			}
			if( frm.password.value.trim() == '' ) {
				alert( '비밀번호를 입력하세요.' );
				return false;
			}
			if( frm.pw_rule_ok.value != 'Y' ) {
				alert( '허용되지 않는 비밀번호입니다.' );
				return false;
			}
			if( frm.password_check.value.trim() != document.signupfrm.password.value.trim() ) {
				alert( '비밀번호를 다시 확인해주세요.' );
				return false;
			}
			
			if( frm.phone.value.trim() == '' ) {
				alert( '전화번호를 입력하세요.' );
				return false;
			}
			if( frm.mail.value.trim() == '' ) {
				alert( '메일을 입력하세요.' );
				return false;
			}
			/* if( frm.mail2.value.trim() == '' ) {
				alert( '메일을 입력하세요.' );
				return false;
			} */
			document.signupfrm.submit();
		}
		//document.getElementById( 'idcheckbtn' ).onclick = function() {
		//	}
	}
</script>
	<title>회원가입</title>
</head>

<body>
<!-- ---------------------------------------------------------------여기부터 부트스트랩 뜯어옴--------------------------------------------------------------- -->
<header id="header" class="site-header" include-html="/static/html/common/header.html"></header>

<div class="hero-wrap" style="background-image: url('../static/images/bg_1.jpg');">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
      <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
        <div class="text">
          <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home</a></span> <span>Signup</span></p>
          <h1 class="mb-4 bread">Signup</h1>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- content -->
<section class="ftco-section bg-light">
  <div class="container">
    <div class="row d-flex justify-content-center ftco-animate">      
      <div class="col-lg-6">
        <form action="./signup_ok.do" class="bg-white" name="signupfrm" method="post" style="padding: 50px;">
        
          <div class="form-group">
            <input type="text" class="form-control" name="id" id="id" placeholder="ID">
				<input type="hidden" name="id_ok" id="id_ok" value=""  />
				<span id ="id_check_feedback"></span><br />
          </div>
          
          <div class="form-group">
            <input type="password" class="form-control"   name="password" id="password" placeholder="Password">
            <input type="hidden" name="pw_rule_ok" id="pw_rule_ok" value=""  />
			<span id ="password_rule_feedback"></span><br />
          </div>
          
          <div class="form-group">
            <input type="password" class="form-control" name="password_check" id="password_check" placeholder="Password again">
            <span id ="password_check_feedback"></span><br />
          </div>
          
          <div class="form-group">
            <input type="text" class="form-control" name="name" placeholder="Name"><br />
          </div>
          
          <div class="form-group">
            <input type="text" class="form-control" name="mail" placeholder="Email"> <br />
          </div>
          
          <div class="form-group">
            <input type="text" class="form-control"  id="phone" name="phone" placeholder="PhoneNumber 000-0000-0000">
            <span id ="phone_check_feedback"></span><br />
          </div>
          
          <div class="form-group">
            <input type="text" class="form-control" name="birth" placeholder="Birthday"><br />
          </div>
          
          <div class="form-group"> 
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="radio-gender-women" value="F" checked >
              <label class="form-check-label" for="radio-gender-women">women</label>
            </div>
            
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="radio-gender-men" value="M" >
              <label class="form-check-label" for="radio-gender-men">men</label>
            </div>
            
          </div>
			<br />
          <!-- button -->
          <div class="form-group">
            <input type="submit" id="signupbtn" value="Signup" class="btn btn-primary w-100 py-3 px-5">
          </div>
          <div class="form-group">
            <input type="submit" id="kakao_signupbtn" value="Kakao Signup" class="btn w-100 py-3 px-5" style="border: 1px solid #8d703b; background: transparent; color: #8d703b;">
          </div>
        </form>
      </div>
    </div>
  </div>
</section>


<!--
// footer --------------------------------------->
<footer id="footer" class="site-footer" include-html="/static/html/common/footer.html"></footer>

<!--
// script --------------------------------------->
<script type="text/javascript" src="/static/js/yohang-bundle.js"></script>
<script type="text/javascript" src="/static/vendors/yohang-vendors-bundle.js"></script>

														<!-- 여기까지 -->

<!-- 

	<div>
		<form action="./signup_ok.do" method="post" name="signupfrm" >
			<div>
				<label>아이디</label>
				<input type="text" name="id" id="id" value=""  /> <br/>
				<input type="hidden" name="id_ok" id="id_ok" value=""  />
				<span id ="id_check_feedback"></span><br />
			</div>
				
			<div>
				<label>이름</label>
				<input type="text" name="name" value="" /> 
			</div>
			
			<div>
				<lable>비밀번호</lable>
				<input type="password" name="password" id="password" value="" /><br />
				<input type="hidden" name="pw_rule_ok" id="pw_rule_ok" value=""  />
				<span id ="password_rule_feedback"></span><br />
			</div>
			
			<div>
				<lable>비밀번호확인</lable>
				<input type="password" name="password_check" id="password_check" value="" /> <br />
				<span id ="password_check_feedback"></span><br />
			</div>
			
			<div>
				<lable>생년월일</lable>
				<input type="text" name="birth" value="" />
			</div>
			
			<div>
				<lable>전화번호</lable>
				<input type="text" name="phone" value="" />
			</div>
			
			<div>
				<lable>메일</lable>
				<input type="text" name="mail1" value="" /> @ <input type="text" name="mail2" value="" /> 
			</div>
			
			<div>
				<lable>성별</lable>
				여성<input type="radio" name="gender" value="F" checked /> 
				남성<input type="radio" name="gender" value="M" />
			</div>
			
			<div>
				<input type="button"  id="signupbtn" value="완료" />
			</div>
		</form>
	</div>
	 -->

	<script type="text/javascript">
	
	$('#password').focusout(function(){
	      let password1 = $("#password").val();
	      // 최소 8자, 하나의 이상의 대소문자 및 하나의 숫자, 하나의 특수문자	
	      let password_rule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	      
	      if( !password_rule.test(password1) || password1.length < 8) {
	    	  $("#password_rule_feedback").html( '영대소문자,숫자로 구성된 8글자 이상으로 조합하세요.' );
	    	  $("#password_rule_feedback").css('color', 'red');
	    	  $( "#pw_rule_ok" ).val('N')
	      } else {
	    	  $("#password_rule_feedback").html( ' ' );
	    	  $( "#pw_rule_ok" ).val('Y')
	      }
	      
	   });
	// 비밀번호 확인
	$('#password_check').focusout(function(){
      let password1 = $("#password").val();
      let password2 = $("#password_check").val();
      
      if (password1 !="" || password2 !=""){
         if (password1 == password2) {
            $("#password_check_feedback").html('비밀번호가 일치합니다.');
            $("#password_check_feedback").css('color', 'green');
            $("#pw_ok").val('Y');
            
         } else {
            $("#password_check_feedback").html('비밀번호가 불일치합니다.');
            $("#password_check_feedback").css('color', 'red');
            $("#pw_ok").val('N');
         }
      }
   });
	
	$('#phone').focusout(function() {
		//	앞자리가 01이며 (0,1,6,7,8,9) 이며 중간에 3~4자리, 세번째는 4자리인 전화번호
		let phone_rule = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		let phone_input = $('#phone').val();
		
		if( !phone_rule.test( phone_input ) ) {
			$("#phone_check_feedback").html('전화번호 형식이 맞지않습니다.')
			$("#phone_check_feedback").css('color', 'red');
		} else {
			$("#phone_check_feedback").html('')
		}
	});
	
	//function checkId() {
	$('#id').focusout(function(){
		// 아이디 정규식 검사
		let m_id = $('#id').val();
		let id_rule = /^[a-z0-9]+$/ ;
		
	    if (!id_rule.test(m_id) || m_id.length<6) {
	    	$("#id_check_feedback").html('아이디는 영소문자,숫자로 구성된 6 ~ 10 글자로 조합하세요')
			$("#id_check_feedback").css('color', 'red');
	    } else{
	    // 아이디 중복검사
		    $.ajax({
		    	url : "./check_id.do",
		    	data : {id : m_id },
		    	type : "post",
		    	success : function( result ){
		    		console.log("id 전송 성공");
		    		if( result == 0 ) {
		    			$("#id_check_feedback").html('사용할 수 있는 아이디입니다.')
		    			$("#id_check_feedback").css('color', 'green');
		    			$("#id_ok").val('Y');
		    		}else {
		    			$("#id_check_feedback").html('이미 사용중인 아이디입니다.')
		    			$("#id_check_feedback").css('color', 'red');
		    			$("#id_ok").val('N');
		    		}
		    	}
		   	});
	    }
	});
	// TODO( 메일, 전화번호 정규식 넣기?)
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>