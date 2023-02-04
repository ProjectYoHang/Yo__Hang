<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.example.model.QnABoardTO"%>
<%@page import="java.util.ArrayList"%>

<% 
	ArrayList<QnABoardTO> qnaLists = (ArrayList<QnABoardTO>)request.getAttribute("qnaLists");

	StringBuilder html = new StringBuilder();

	for(QnABoardTO to : qnaLists) {
		String qna_seq = to.getQna_seq();
		String qna_id = to.getQna_id();
		String qna_subject = to.getQna_subject();
		String qna_date = to.getQna_date();
		
		html.append("<table>");
		html.append("<tr>");
		html.append("</td>" + qna_id + "&nbsp;&nbsp;&nbsp;</td>");
		html.append("</td>" + qna_subject + "&nbsp;&nbsp;&nbsp;</td>");
		html.append("</td>" + qna_date + "&nbsp;</td>");
		html.append("<input type='button' name='btn' value='상세보기' onClick='location.href='./qna_admin/qna_admin_view.do?qna_seq='" + qna_seq + "' />");
		html.append("</tr>");
		html.append("</table>");
	};
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%= html.toString() %>

</body>
</html>