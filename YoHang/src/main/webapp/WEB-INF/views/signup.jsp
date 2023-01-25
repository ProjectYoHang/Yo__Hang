<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
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
</head>
<body>
	회원가입
	<br /><hr /><br />
	
<form action="./signup_ok.do" method="post" name="signupfrm" >
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" value="" />&nbsp;<input type="button" id="idcheckbtn" value="중복 확인" />
				<input type="hidden" name="idcheck" value="N" />
			</td>
		</tr>
			
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" value="" />
			</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="password" value="" />
			</td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td>
				<input type="password" name="password_check" value="" />
			</td>
		</tr>
		
		<tr>
			<th>생년월일</th>
			<td>
				<input type="text" name="birth" value="" />
			</td>
		</tr>
		
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" name="phone" value="" />
			</td>
		</tr>
		
		<tr>
			<th>메일</th>
			<td>
				<input type="text" name="mail1" value="" /> @ <input type="text" name="mail2" value="" /> 
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				여성<input type="radio" name="gender" value="F" checked /> 
				남성<input type="radio" name="gender" value="M" />
			</td>
		</tr>
		
	</table>	
	<div>
		<input type="button"  id="signupbtn" value="완료" />
	</div>
</form>


</body>
</html>