<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int flag = (Integer)request.getAttribute("flag");
	String qna_seq = (String)request.getAttribute("qna_seq");
	
	out.println("<script type='text/javascript'>");
	if(flag == 0) {
		out.println("alert('댓글쓰기에 성공했습니다.');");
		out.println("location.href='./view.do?qna_seq='" + qna_seq + ";");
	} else {
		out.println("alert('댓글쓰기에 실패했습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>