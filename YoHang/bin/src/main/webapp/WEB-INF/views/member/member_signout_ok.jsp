<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute("flag");
	// redirection	
	out.println( "<script type='text/javascript'>" );
	if ( flag == 0 ) {
		out.println( "alert( '회원탈퇴 성공');" );
		out.println( "location.href='./home.do?';");
	}else {
		out.println( "alert( '회원탈퇴 실패');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>