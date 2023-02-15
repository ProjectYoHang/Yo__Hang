<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>

<%
	String home = request.getParameter("home");
	String member = request.getParameter("member");
	String book = request.getParameter("book");
	String room = request.getParameter("room");
	String qna = request.getParameter("qna");
	String faq = request.getParameter("faq");
	String notice = request.getParameter("notice");
	String logout = request.getParameter("logout");
	
%>

<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  <div class="container">
    <a class="navbar-brand" href="<%= member %>">YoHang</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="oi oi-menu"></span> Menu
    </button>

    <div class="collapse navbar-collapse" id="ftco-nav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active"><a href="<%= member %>" class="nav-link">Home</a></li>
        <li class="nav-item active"><a href="<%= member %>" class="nav-link">회원관리</a></li>
        <li class="nav-item active"><a href="<%= book %>" class="nav-link">예약관리</a></li>
        <li class="nav-item active"><a href="<%= room %>" class="nav-link">객실관리</a></li>
        <li class="nav-item board">
          <div class="dropdown nav-link">
            <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
              게시판관리
            </button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="<%= qna %>">Q&A</a>
              <a class="dropdown-item" href="<%= faq %>">FAQ</a>
              <a class="dropdown-item" href="<%= notice %>">공지사항</a>
            </div>
          </div>
        </li>
        
		
		<!--  <li class="nav-item"><a href="<%= logout %>" class="nav-link" onclick="location.href='./logout.do'">Logout</a></li> -->
		<li class="nav-item account">
	         <div class="dropdown nav-link">
	           <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
	            	Admin 님
	           </button>
	           <div class="dropdown-menu">
	             <a class="dropdown-item" href="<%= logout %>">로그아웃</a>
	           </div>
	         </div>
       	</li>
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