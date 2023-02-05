<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="sendMail.do" method="post" >
		받는사람 <input type="text" id="mail_to" name="mail_to" />
		제목 <input type="text" id="mail_title" name="mail_title" />
		내용 <input type="text" id="mail_content" name="mail_content" />
		<input type="submit" value="보내기" />
	</form>
</body>
</html>