<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='./book.css'>
</head>
<body>

<div id='chatt'>
	<h1>WebSocket booking</h1>
	<div id='rooms'>
		<input type='text' id='mid' value='홍길동'>
		<input type='button' value='로그인' id='btnLogin'>
		<br>
		<input type="button" id="one" value="1" />
		<input type="button" id="two" value="2" />
		<input type="button" id="three" value="3" />
		<input type="button" name="four" value="4" />
		<input type="button" name="5" value="5" /><br>
		<input type="button" name="6" value="6" />
		<input type="button" name="7" value="7" />
		<input type="button" name="8" value="8" />
		<input type="button" name="9" value="9" />
		<input type="button" name="10" value="10" /><br><br>
	</div>
	
	<input type='button' value='예약하기' id='bookbtn'>
	<br/>
	<div id='talk'></div>
	
</div>
<script src='./book.js'></script>

</body>
</html>