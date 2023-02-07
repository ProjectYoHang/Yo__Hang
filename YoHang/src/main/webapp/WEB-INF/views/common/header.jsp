<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>

<%
	String home = request.getParameter("home");
	String aboutus = request.getParameter("aboutus");
	String findus = request.getParameter("findus");
	String qna = request.getParameter("qna");
	String faq = request.getParameter("faq");
	String notice = request.getParameter("notice");
	String login = request.getParameter("login");
	String logout = request.getParameter("logout");
	String mypage = request.getParameter("mypage");
	
%>

<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  <div class="container">
    <a class="navbar-brand" href="<%= home %>">YoHang</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="oi oi-menu"></span> Menu
    </button>

    <div class="collapse navbar-collapse" id="ftco-nav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active"><a href="<%= home %>" class="nav-link">Home</a></li>
        <li class="nav-item"><a href="<%= aboutus %>" class="nav-link">About us</a></li>
        <li class="nav-item"><a href="<%= findus %>" class="nav-link">How to find us</a></li>
        <li class="nav-item board">
          <div class="dropdown">
            <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
              Board
            </button>
            <div class="dropdown-menu">
            	<!-- 로그인상태 아니면 Q&A 게시판에 접근못하게 아예 게시판자체를 막아버림 / 로그인페이지로 이동 -->
            	<c:if test="${loginMember == null }">
            		<a class="dropdown-item" href="<%= login %>">Q&A</a>
            	</c:if>
            	<c:if test="${loginMember != null }">
            		<a class="dropdown-item" href="<%= qna %>">Q&A</a>
            	</c:if>
              <a class="dropdown-item" href="<%= faq %>">FAQ</a>
              <a class="dropdown-item" href="<%= notice %>">공지사항</a>
            </div>
          </div>
        </li>
        <!-- <li class="nav-item"><a href="login.html" class="nav-link" onclick="href">Login</a></li>	-->
        <c:if test="${loginMember == null}">
			<li class="nav-item"><a href="<%= login %>" class="nav-link" onclick="href">Login</a></li>
		</c:if>
		<c:if test="${loginMember != null}">
			<!-- <li class="nav-item"><a href="<%= logout %>" class="nav-link" onclick="location.href='./logout.do'">Logout</a></li>  -->
			<li class="nav-item account">
		         <div class="dropdown">
		           <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
		            	HONG GIL DONG 님
		           </button>
		           <div class="dropdown-menu">
		             <a class="dropdown-item" href="<%= mypage %>">마이페이지</a>
		             <a class="dropdown-item" href="<%= logout %>">로그아웃</a>
		           </div>
		         </div>
        	</li>
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