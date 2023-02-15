<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute("flag");
	// redirection	
	out.println( "<script type='text/javascript'>" );
	if ( flag == 0 ) {
		out.println( "alert( '회원탈퇴 성공');" );
		out.println( "location.href='/home.do';");
	}else if( flag == 3 ) {
		out.println( "alert( '예약된 내역이 확인되어 탈퇴가 불가능합니다.');" );
		out.println( "history.back();");
	}else {
		out.println( "alert( '회원탈퇴 실패');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>