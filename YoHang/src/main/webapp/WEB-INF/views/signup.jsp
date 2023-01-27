<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	window.onload = function() {
		document.getElementById( 'signupbtn' ).onclick = function() {
			if( document.signupfrm.id.value.trim() == '' ) {
				alert( '아이디를 입력하세요.' );
				return false;
			}
			/* if( document.signupfrm.idcheck.value() == 'N') {
				alert( '아이디 중복체크를 해주세요.')
				return false;
			} */
			if( document.signupfrm.name.value.trim() == '' ) {
				alert( '이름을 입력하세요.' );
				return false;
			}
			if( document.signupfrm.password.value.trim() == '' ) {
				alert( '비밀번호를 입력하세요.' );
				return false;
			}
			if( document.signupfrm.password_check.value.trim() != document.signupfrm.password.value.trim() ) {
				alert( '비밀번호를 다시 확인해주세요.' );
				return false;
			}
			if( document.signupfrm.phone.value.trim() == '' ) {
				alert( '전화번호를 입력하세요.' );
				return false;
			}
			if( document.signupfrm.mail1.value.trim() == '' ) {
				alert( '메일을 입력하세요.' );
				return false;
			}
			if( document.signupfrm.mail2.value.trim() == '' ) {
				alert( '메일을 입력하세요.' );
				return false;
			}
			document.signupfrm.submit();
		}
		//document.getElementById( 'idcheckbtn' ).onclick = function() {
		//	}
	}
</script>
	<title>회원가입</title>
</head>
<body>
	<div>
		<form action="./signup_ok.do" method="post" name="signupfrm" >
			<div>
				<label>아이디</label>
				<input type="text" name="id" value="" />&nbsp;<input type="button" id="idcheckbtn" value="중복 확인" />
				<input type="hidden" name="idcheck" value="N" />
			</div>
				
			<div>
				<label>이름</label>
				<input type="text" name="name" value="" />
			</div>
			
			<div>
				<lable>비밀번호</lable>
				<input type="password" name="password" id="password" value="" />
			</div>
			
			<div>
				<lable>비밀번호확인</lable>
				<input type="password" name="password_check" id="password_check" value="" />
				<span id ="password_check_feedback"></span>
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

	<script type="text/javascript">
		// 비밀번호 확인
	   $('#password_check').focusout(function(){
	      let password1 = $("#password").val();
	      let password2 = $("#password_check").val();
	    
	      if (password1 !="" || password2 !=""){
	         if (password1 == password2) {
	            $("#password-check_feedback").html('사용할 수 있는 비밀번호 입니다.');
	            $("#password-check_feedback").css('color', 'green');
	         } else {
	            $("#password-check_feedback").html('비밀번호가 불일치합니다.');
	            $("#password-check_feedback").css('color', 'red');
	         }
	      }
	   });
	</script>
</body>
</html>