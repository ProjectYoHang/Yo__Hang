<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute("flag");
	// redirection	
	out.println( "<script type='text/javascript'>" );
	if ( flag == 0 ) {
		out.println( "alert( '회원가입 완료');" );
		out.println( "location.href='/login.do';");
	}else {
		out.println( "alert( '회원가입 실패');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>
 