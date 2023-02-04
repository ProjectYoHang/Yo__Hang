<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String kakao_id = "";
	if( request.getAttribute( "kakao_id") != null) {
		kakao_id = (String)request.getAttribute( "kakao_id" );	
	}
%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="common/head.jsp" flush="false"/>
<body>
<!-- 
// header --------------------------------------->
<jsp:include page="common/header.jsp" flush="false"/>

<!-- hero-wrap -->
<jsp:include page="common/hero.jsp" flush="false"/>


<script type="text/javascript">
	window.onload = function() {
		document.getElementById( 'signupbtn' ).onclick = function() {
			let frm = document.signupfrm;
			if( frm.id.value.trim() == '' ) {
				alert( '아이디를 입력하세요.' );
				return false;
			}else if( frm.id_ok.value != 'Y'){
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
			} else if( frm.pw_rule_ok.value != 'Y' ) {
				alert( '허용되지 않는 비밀번호입니다.' );
				return false;
			} else if( frm.password_check.value.trim() != frm.password.value.trim() ) {
				alert( '비밀번호가 일치하지 않습니다.' );
				return false;
			}
			
			if( frm.phone.value.trim() == '' ) {
				alert( '전화번호를 입력하세요.' );
				return false;
			} else if ( frm.phone_rule_ok.value != 'Y' ) {
				alert( '전화번호의 형식을 확인해주세요');
				return false;
			} 
			if( frm.mail.value.trim() == '' ) {
				alert( '메일을 입력하세요.' );
				return false;
			} else if ( frm.mail_rule_ok.value != 'Y' ) {
				alert( '메일 형식을 확인해주세요.' );
				return false;
			}
			if( frm.birth.value.trim() == '') {
				alert( '생년월일을 입력하세요')
				return false;
			}else if ( frm.birth.value.trim().length != 8 ) {
				alert( '생년월일은 8자리로 입력해주세요' );
				return false;
			}
			
			document.signupfrm.submit();
		}
	}
</script>
	<title>회원가입</title>
</head>
<body>

<!-- content -->
<section class="ftco-section bg-light">
  <div class="container">
    <div class="row d-flex justify-content-center ftco-animate">      
      <div class="col-lg-6">
        <form action="./signup_ok.do" class="bg-white" name="signupfrm" method="post" style="padding: 50px;">
        	<input type="hidden" name="kakao_id" value="<%=kakao_id%>"/>
        
          <div class="form-group">
            <input type="text" class="form-control" name="id" id="id" placeholder="ID">
				<input type="hidden" name="id_ok" id="id_ok" value="N"  />
				<span id ="id_check_feedback"></span><br />
          </div>
          
          <div class="form-group">
            <input type="password" class="form-control"   name="password" id="password" placeholder="Password">
            <input type="hidden" name="pw_rule_ok" id="pw_rule_ok" value="N"  />
			<span id ="password_rule_feedback"></span><br />
          </div>
          
          <div class="form-group">
            <input type="password" class="form-control" name="password_check" id="password_check" placeholder="Password again">
            <span id ="password_check_feedback"></span><br />
          </div>
          
          <div class="form-group">
            <input type="text" class="form-control" name="name" placeholder="Name"><br />
          </div>
          
          <div class="form-group"  >
          	<input type="text" class="form-control" name="mail" id="mail" placeholder="Email">
          	<input type="hidden" name="mail_rule_ok" id="mail_rule_ok" value="N"  />
          	<span id ="mail_check_feedback"></span><br />
          </div>
          
          <div class="form-group">
            <input type="text" class="form-control"  id="phone" name="phone" placeholder="PhoneNumber 000-0000-0000">
            <input type="hidden" name="phone_rule_ok" id="phone_rule_ok" value="N"  />
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
            <!--  <input type="submit" id="kakao_signupbtn" value="Kakao Signup" class="btn w-100 py-3 px-5" style="border: 1px solid #8d703b; background: transparent; color: #8d703b;"> -->
          </div>
        </form>
      </div>
    </div>
  </div>
</section>

<!-- script --------------------------------------->

<script type="text/javascript">
	
	$('#password').focusout(function(){
	      let password = $("#password").val();
	      // 최소 8자, 하나의 이상의 대소문자 및 하나의 숫자, 하나의 특수문자	
	      let password_rule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	      
	      if( !password_rule.test(password) || password.length < 8) {
	    	  $("#password_rule_feedback").html( '특수문자, 영문자, 숫자로 구성된 8글자 이상으로 조합하세요.' );
	    	  $("#password_rule_feedback").css('color', 'red');
	    	  $( "#pw_rule_ok" ).val('N')
	      } else {
	    	  $("#password_rule_feedback").html( '' );
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
            $("#pw_rule_ok").val('Y');
            
         } else {
            $("#password_check_feedback").html('비밀번호가 불일치합니다.');
            $("#password_check_feedback").css('color', 'red');
            $("#pw_rule_ok").val('N');
         }
      }
   });
	
	/// 메일정규식 확인
	$('#mail').focusout(function(){
      let mail = $("#mail").val();
      // 메일 정규식 xxx@xxx.
      let mail_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      console.log($("#mail_rule_ok").val());
      if (!mail_rule.test(mail)){
          $("#mail_check_feedback").html('메일의 형식이 올바르지 않습니다.');
          $("#mail_check_feedback").css('color', 'red');
          console.log($("#mail_rule_ok").val());
           
      } else {
          $("#mail_check_feedback").html('');
          $("#mail_rule_ok").val('Y');
          console.log($("#mail_rule_ok").val());
      }
   });
	
	$('#phone').focusout(function() {
		//	앞자리가 01이며 (0,1,6,7,8,9) 이며 중간에 3~4자리, 세번째는 4자리인 전화번호
		let phone_rule = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		let phone_input = $('#phone').val();
		
		if( !phone_rule.test( phone_input ) ) {
			$("#phone_check_feedback").html('전화번호 형식이 맞지않습니다.')
			$("#phone_check_feedback").css('color', 'red');
			$("#phone_rule_ok").val('N');
		} else {
			$("#phone_check_feedback").html('')
			$("#phone_rule_ok").val('Y');
		}
	});
	
	//function checkId() {
	$('#id').focusout(function(){
		// 아이디 정규식 검사
		let m_id = $('#id').val();
		// 영어와 숫자를 합친 아이디
		let id_rule = /^[a-z0-9]+$/ ;
		
	    if (!id_rule.test(m_id) || m_id.length < 6 || m_id.length > 10) {
	    	$("#id_check_feedback").html('아이디는 영소문자,숫자로 구성된 6 ~ 10 글자로 조합하세요')
			$("#id_check_feedback").css('color', 'red');
	    } else{
	    // 아이디 중복검사
		    $.ajax({
		    	url : "./check_id.do",
		    	data : {id : m_id },
		    	type : "post",
		    	success : function( result ){
		    		
		    	
		    	debugger;
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
	</script>
<jsp:include page="common/footer.jsp" flush="false"/>
<!-- script --------------------------------------->
<script type="text/javascript" src="../../YoHangFront/build/js/yohang-bundle.js"></script>
<script type="text/javascript" src="../../YoHangFront/build/vendors/yohang-vendors-bundle.js"></script>


</body>
</html>