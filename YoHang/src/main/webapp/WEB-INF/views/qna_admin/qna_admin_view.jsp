<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

QNA 답댓글 작성 input box도 같이 있음

<table>
	<tr>
		<td><%= qna_id %></td>
		<td><%= qna_subject %></td>
		<td><%= qna_date %></td>
		<td><%= qna_content %></td>
	</tr>
</table>

<form action="" method="get">
답댓글 작성<br>
<input type="text" name="reply" />

</form>

</body>
</html>