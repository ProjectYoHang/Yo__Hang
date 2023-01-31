<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
	</head>
	<body>
		<c:if test="${to == null}">
			<input type="button" name="lbtn" value="로그인" onclick="location.href='./login.do'" />
		</c:if>
		<c:if test="${to != null}">
			<input type="button" name="lobtn" value="로그아웃" onclick="location.href='./logout.do'"  />
			<table border='1' width='100'>
				<tr>
					<td>${to.m_id}</td>
					<td>${to.m_name}</td>
					<td>${to.m_email}</td>
					<td>${to.m_phone}</td>
					<td>${to.m_birth}</td>
				</tr>
			</table>
		</c:if>
	
	</body>
</html>