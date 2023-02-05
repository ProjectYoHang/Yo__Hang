<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.example.model.QnABoardTO"%>
<%@page import="com.example.model.QnAReplyTO"%>
<%@page import="java.util.ArrayList"%>

<%
	// 사용자의 qna 데이터
	QnABoardTO qna = (QnABoardTO)request.getAttribute("qna");

	String qna_seq = (String)request.getAttribute("qna_seq");

	String qna_id = qna.getQna_id();
	String qna_subject = qna.getQna_subject();
	String qna_content = qna.getQna_content();
	String qna_date = qna.getQna_date();
	
	// 혹 이미 답변이 있다면 보여줄 답댓글 데이터
	QnAReplyTO qnaReplys = (QnAReplyTO)request.getAttribute("qnaReplys");

	// 로그인상태가 아니므로 관리자 아이디값을 임시로 지정함
	String qrpl_id = "admin1234";
	
	StringBuilder html = new StringBuilder();
	
	if(qnaReplys != null) {
		
		String qrpl_content = qnaReplys.getQrpl_content();
		
		html.append("<table>");
		html.append("<tr>");
		html.append("<td><댓글></td>");
		html.append("</tr>");
		html.append("<tr>");
		html.append("<td>" + qrpl_content + "&nbsp;&nbsp;&nbsp;</td>");
		html.append("<td><input type='button' value='수정'></td>");
		html.append("<td><input type='button' value='삭제'></td>");
		html.append("</tr>");
		html.append("</table>");
		
	} else {
		
		html.append("<form action='./qna_admin_write_ok.do' name='wfrm' method='post'>");
		html.append("<input type='hidden' name='qna_seq' value='" + qna_seq + "' />");
		html.append("<input type='hidden' name='qrpl_id' value='" + qrpl_id + "' />");
		html.append("답댓글 작성<br><br>");
		html.append("<input type='text' name='qrpl_content' />");
		html.append("<input type='button' id='wbtn' value='답댓글 쓰기' />");
		html.append("</form>");
		
	}
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	window.onload = function() {
		document.getElementById('wbtn').onclick = function() { 
			if(document.wfrm.qrpl_content.value.trim() == '') { 
				alert('댓글 내용을 입력하셔야 합니다.');
				return false;
			}
			document.wfrm.submit();
		};
	}
	
</script>


</head>
<body>

<table>
	<tr>
		<td><%= qna_id %></td>
		<td><%= qna_subject %></td>
		<td><%= qna_date %></td>
		<td><%= qna_content %></td>
	</tr>
</table>

<br><hr><br>

<%= html.toString() %>

</body>
</html>