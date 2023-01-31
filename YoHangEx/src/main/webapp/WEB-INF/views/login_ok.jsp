<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute("flag");
	
	out.println( "<script type='text/javascript'>" );
	if ( flag == 0 ) {
		out.println( "alert( '환영합니다.' );" );
		out.println( "location.href='./home.do?';");
	}else {
		out.println( "alert( '아이디 또는 비밀번호가 틀렸습니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
ID : ${to.m_id}
ID : ${to.m_pw}
</body>
</html>