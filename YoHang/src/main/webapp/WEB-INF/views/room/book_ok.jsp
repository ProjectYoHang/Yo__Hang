<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int flag = (Integer)request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");
	if(flag == 0) {
		out.println("alert('예약되었습니다.');");
		out.println("location.href='/mypage/booklist.do';");
	} else {
		out.println("alert('예약에 실패했습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>