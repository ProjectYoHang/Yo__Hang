<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int flag = (Integer)request.getAttribute("flag");	

	String cpage = (String)request.getAttribute("cpage");
	String qna_seq = (String)request.getAttribute("qna_seq");
	

	out.println("<script type='text/javascript'>");
	if(flag == 0) {
		out.println("alert('글수정에 성공했습니다.');");
		out.println("location.href='./view.do?cpage=" + cpage + "&qna_seq=" + qna_seq + "';");
	} else if(flag == 1) {
		out.println("alert('비밀번호가 잘못 입력되었습니다.');");
		out.println("history.back();");
	} else if(flag == 2){
		out.println("alert('글수정에 실패했습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
	
%>
