<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.example.model.MemberTO"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
	<script>
	window.onload = function() {
		document.getElementById( 'mimBtn' ).onclick = function() {
			let frm = document.modifyFrm;
			if( frm.pw_rule_ok.value != 'Y' ) {
				alert( '허용되지 않는 비밀번호입니다.' );
				return false;
			}
			if( frm.phone_rule_ok.value != 'Y') {
				alert( '전화번호 형식이 맞지않습니다.')
				return false;	
			}
		}
	}
	</script>
</head>
<body>
	<div>
		<form action="./member_info_modify_ok.do" method="post" name="modifyFrm" >
			<div>
				<input type="hidden" name="id" value="${loginMember.m_id}" />
				비밀번호 <input type="password" name="pw" id ="pw" value="" /> <br />
				<input type="hidden" name="pw_rule_ok" id="pw_rule_ok" value=""  />
				<span id ="password_rule_feedback"></span><br />
			</div>
			<div>
				이름<input type="text" name="name" id="name" value="${loginMember.m_name }" readonly /> <br /><br />
			</div>
			<div>
				메일<input type="text" name="email" id="email" value="${loginMember.m_email }" /> <br /><br />
			</div>
			<div>
				번호<input type="text" name="phone" id="phone" value="${loginMember.m_phone }" /> <br />
				<span id ="phone_check_feedback"></span><br />
			</div>
			<div>
				생년월일<input type="text" name="birth" id="birth" value="${loginMember.m_birth }" readonly /><br /><br />
			</div>
			<input type="submit" name="mimBtn" value="정보 변경" /> 
		</form>
	</div>
	<div>
		<form action="./member_signout_ok.do" method="post">
			<input type="hidden" name="id" value="${loginMember.m_id}" />
			<input type="submit" name="msoBtn" value="회원 탈퇴" />
		</form>
	</div>


<script type="text/javascript">

		$('#pw').focusout(function(){
		    let password = $("#pw").val();
		    // 최소 8자, 하나의 이상의 대소문자 및 하나의 숫자, 하나의 특수문자	
		    let password_rule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		    
		    if( !password_rule.test(password) || password.length < 8) {
		  	  $("#password_rule_feedback").html( '영대소문자,숫자로 구성된 8글자 이상으로 조합하세요.' );
		  	  $("#password_rule_feedback").css('color', 'red');
		  	  $( "#pw_rule_ok" ).val('N')
		    } else {
		  	  $("#password_rule_feedback").html( ' ' );
		  	  $( "#pw_rule_ok" ).val('Y')
		    }
		});
	   
	    $('#phone').focusout(function() {
			//	앞자리가 01이며 (0,1,6,7,8,9) 이며 중간에 3~4자리, 세번째는 4자리인 전화번호
			let phone_rule = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			let phone_input = $('#phone').val();
			
			if( !phone_rule.test( phone_input ) ) {
				$("#phone_check_feedback").html('전화번호 형식이 맞지않습니다.')
				$("#phone_check_feedback").css('color', 'red');
				$( "#phone_rule_ok" ).val('N')
			} else {
				$("#phone_check_feedback").html('')
				$( "#phone_rule_ok" ).val('Y')
			}
		});
</script>
</body>
</html>









