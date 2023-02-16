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
	String rv = request.getParameter("rv");
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
          <div class="dropdown nav-link">
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
              <a class="dropdown-item" href="<%= notice %>">Notice</a>
              <a class="dropdown-item" href="<%= rv %>">Review</a>
            </div>
          </div>
        </li>
        <c:if test="${loginMember == null}">
			<li class="nav-item"><a href="<%= login %>" class="nav-link" >Login</a></li>
		</c:if>
		<c:if test="${loginMember != null}">
		<li class="nav-item account">
			<div class="dropdown nav-link">
			    <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
	              ${loginMember.m_id} 님
	            </button>
	            <div class="dropdown-menu">
	              <a class="dropdown-item" href="<%= mypage %>">Mypage</a>
	              <a class="dropdown-item" href="<%= logout %>">logout</a>
	            </div>
            </div>
		</li>
		</c:if>
      </ul>
    </div>
  </div>
</nav>

