<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  <div class="container">
    <a class="navbar-brand" href="home.do">YoHang</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="oi oi-menu"></span> Menu
    </button>

    <div class="collapse navbar-collapse" id="ftco-nav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active"><a href="home.do" class="nav-link">Home</a></li>
        <li class="nav-item"><a href="aboutus.do" class="nav-link">About us</a></li>
        <li class="nav-item"><a href=">findus.do" class="nav-link">How to find us</a></li>
        <li class="nav-item"><a href="board.do" class="nav-link">Board</a></li>
        <!-- <li class="nav-item"><a href="login.html" class="nav-link" onclick="href">Login</a></li>	-->
        <c:if test="${loginMember == null}">
			<li class="nav-item"><a href="login.do" class="nav-link" onclick="href">Login</a></li>
		</c:if>
		<c:if test="${loginMember != null}">
			<li class="nav-item"><a href="home.do" class="nav-link" onclick="location.href='./logout.do'">Logout</a></li>
		</c:if>
        
      </ul>
    </div>
  </div>
</nav>

<!--  

<input type="button" name="lbtn" value="로그인" onclick="location.href='./login.do'" />
 <input type="button" name="lobtn" value="로그아웃" onclick="location.href='./logout.do'"  />
 <!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
	</head>
	<body>
		<c:if test="${loginMember == null}">
			<input type="button" name="lbtn" value="로그인" onclick="location.href='./login.do'" />
		</c:if>
		<c:if test="${loginMember != null}">
			<input type="button" name="lobtn" value="로그아웃" onclick="location.href='./logout.do'"  />
			<table border='1' width='100'>
				<tr>
					
				</tr>
			</table>
		</c:if>
	
	</body>
</html> 
-->