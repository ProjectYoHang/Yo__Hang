<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	out.println( "<script type='text/javascript'>" );
	out.println( "alert( '메일 전송' );" );
	out.println( "location.href='/Admin/member/list.do';");
	out.println( "</script>" );
%>
