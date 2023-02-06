<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String menuName = request.getParameter("menuName");
	String title = request.getParameter("title");
%>

<div class="hero-wrap" style="background-image: url('../../YoHangFront/build/images/bg_1.jpg');">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
      <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
        <div class="text">
          <p class="breadcrumbs mb-2"><span class="mr-2"><a href="home.do">Home</a></span><%= menuName %><span></span></p>
          <h1 class="mb-4 bread"><%= title %></h1>
        </div>
      </div>
    </div>
  </div>
</div>