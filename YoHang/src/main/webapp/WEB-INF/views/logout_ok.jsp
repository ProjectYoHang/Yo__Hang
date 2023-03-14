<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<html>
	<script>
	Kakao.init('107544815e4e8a304fea6cafb9766ba8'); 
	//카카오로그아웃  
		function kakaoLogout() {
		console.log( "카카오 로그아웃 실행");
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  
	</script>
</html>
<%
	out.println( "<script type='text/javascript'>" );
	out.println( "kakaoLogout();");
	out.println( "location.href='/home.do';");
	out.println( "</script>" );
	
	
%>
