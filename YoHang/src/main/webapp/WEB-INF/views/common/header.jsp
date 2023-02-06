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
        <li class="nav-item board">
          <div class="dropdown">
            <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
              Board
            </button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">Q&A</a>
              <a class="dropdown-item" href="#">FAQ</a>
              <a class="dropdown-item" href="#">공지사항</a>
            </div>
          </div>
        </li>
        <c:if test="${loginMember == null}">
			<li class="nav-item"><a href="login.do" class="nav-link" onclick="href">Login</a></li>
		</c:if>
		<c:if test="${loginMember != null}">
		<li class="nav-item board">
			<div class="dropdown">
			    <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
	              ${loginMember.m_name} 님
	            </button>
	            <div class="dropdown-menu">
	              <a class="dropdown-item" href="./member_info.do">마이페이지</a>
	              <a class="dropdown-item" href="./logout.do">로그아웃</a>
	            </div>
            </div>
		</li>
		</c:if>
        
      </ul>
    </div>
  </div>
</nav>

