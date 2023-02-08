<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute("flag");	
	String cpage = (String)request.getAttribute("cpage");
	String rv_seq = (String)request.getAttribute("rv_seq");
	
	out.println("<script type='text/javascript'>");
	if(flag == 0) {
		out.println("alert('글수정에 성공했습니다.');");
		out.println("location.href='./view.do?cpage=" + cpage + "&rv_seq=" + rv_seq + "';");
	} else if(flag == 1){
		out.println("alert('글수정에 실패했습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
	
%>