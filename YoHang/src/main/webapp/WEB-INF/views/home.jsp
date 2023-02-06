<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="common/head.jsp" flush="false"/>
<body>
<!-- 
// header --------------------------------------->

<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  <div class="container">
    <a class="navbar-brand" href="/home.do">YoHang</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="oi oi-menu"></span> Menu
    </button>

    <div class="collapse navbar-collapse" id="ftco-nav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active"><a href="/home.do" class="nav-link">Home</a></li>
        <li class="nav-item"><a href="aboutus.do" class="nav-link">About us</a></li>
        <li class="nav-item"><a href=">findus.do" class="nav-link">How to find us</a></li>
        <li class="nav-item board">
          <div class="dropdown">
            <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
              Board
            </button>
            <div class="dropdown-menu">
            	<!-- 로그인상태 아니면 Q&A 게시판에 접근못하게 아예 게시판자체를 막아버림 / 로그인페이지로 이동 -->
            	<c:if test="${loginMember == null }">
            		<a class="dropdown-item" href="login.do">Q&A</a>
            	</c:if>
            	<c:if test="${loginMember != null }">
            		<a class="dropdown-item" href="/qna/list.do">Q&A</a>
            	</c:if>
              <a class="dropdown-item" href="#">FAQ</a>
              <a class="dropdown-item" href="#">공지사항</a>
            </div>
          </div>
        </li>
       
        <!-- <li class="nav-item"><a href="login.html" class="nav-link" onclick="href">Login</a></li>	-->
        <c:if test="${loginMember == null}">
			<li class="nav-item"><a href="login.do" class="nav-link" onclick="href">Login</a></li>
		</c:if>
		<c:if test="${loginMember != null}">
			<!-- <li class="nav-item"><a href="home.do" class="nav-link" onclick="location.href='./logout.do'">Logout</a></li> -->
			<li class="nav-item"><a href="logout.do" class="nav-link" onclick="href">Logout</a></li>
		</c:if>
        
      </ul>
    </div>
  </div>
</nav>

<!-- hero-wrap -->
<jsp:include page="common/hero.jsp" flush="false"/>

<!-- content -->
<section class="ftco-section bg-light">
  <div class="container">
    <div class="row">
      
      
      
      
      
    </div>
  </div>
</section>

<!--
// instagram --------------------------------------->
<section class="instagram pt-5">
  <div class="container-fluid">
    <div class="row no-gutters justify-content-center pb-5">
      <div class="col-md-7 text-center heading-section ftco-animate">
        <h2><span>Instagram</span></h2>
      </div>
    </div>
    <div class="row no-gutters">
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../YoHangFront/build/images/insta-1.jpg" class="insta-img image-popup" style="background-image: url(../../YoHangFront/build/images/insta-1.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../YoHangFront/build/images/insta-2.jpg" class="insta-img image-popup" style="background-image: url(../../YoHangFront/build/images/insta-2.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../YoHangFront/build/images/insta-3.jpg" class="insta-img image-popup" style="background-image: url(../../YoHangFront/build/images/insta-3.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../YoHangFront/build/images/insta-4.jpg" class="insta-img image-popup" style="background-image: url(../../YoHangFront/build/images/insta-4.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../YoHangFront/build/images/insta-5.jpg" class="insta-img image-popup" style="background-image: url(../../YoHangFront/build/images/insta-5.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
    </div>
  </div>
</section>

<!-- 
// footer --------------------------------------->
<jsp:include page="common/footer.jsp" flush="false"/>

<!--
// script --------------------------------------->
<script type="text/javascript" src="../../YoHangFront/build/js/yohang-bundle.js"></script>
<script type="text/javascript" src="../../YoHangFront/build/vendors/yohang-vendors-bundle.js"></script>

</body>
</html>
