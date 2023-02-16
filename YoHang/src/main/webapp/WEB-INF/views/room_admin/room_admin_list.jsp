<%@page import="com.example.model.room_typeTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.example.model.QnABoardTO"%>
<%@page import="java.util.ArrayList"%>

<%
	//jsp hero parameters
	String menuName = "객실관리";
	String title = "객실관리";
	
	// jsp header parameters
	String home = "/Admin/home.do";
	String member = "/Admin/member/list.do";
	String book = "/Admin/book/list.do";
	String room = "/Admin/room/list.do";
	String qna = "/Admin/qna/list.do";
	String faq = "/Admin/faq/list.do";
	String rv = "/Admin/rv/list.do";
	String notice = "/Admin/notice/list.do";
	String logout = "/Admin/logout.do";
	
%>

<% 
	ArrayList<room_typeTO> roomType = (ArrayList<room_typeTO>)request.getAttribute("roomType");
	
	StringBuilder html = new StringBuilder();
	
	int totalroomType = roomType.size();
	
	for(room_typeTO to : roomType) {
		String room_name = to.getRoom_name().toUpperCase();
		long room_price = to.getRoom_price();
		int room_capacity = to.getRoom_capacity();
		String bed_size = to.getBed_size();
		long room_size = to.getRoom_size();
		String room_view = to.getRoom_view();
		int bed = to.getBed();
		
		html.append("<td>" + room_name + "</td>");
		html.append("<td>" + room_capacity + "</td>");
		html.append("<td>" + room_size + "</td>");
		html.append("<td>" + bed_size + "</td>");	
		html.append("<td>" + bed + "</td>");	
		html.append("<td>" + room_view + "</td>");	
		html.append("<td>" + room_price + "</td>");	
		html.append("</tr>");	
	};

%>    

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>

<body>
<!-- 
// header --------------------------------------->
<jsp:include page="../common/header_admin.jsp" flush="false">
	<jsp:param value="<%= home %>" name="home"/>
	<jsp:param value="<%= member %>" name="member"/>
	<jsp:param value="<%= book %>" name="book"/>
	<jsp:param value="<%= room %>" name="room"/>
	<jsp:param value="<%= qna %>" name="qna"/>
	<jsp:param value="<%= rv %>" name="rv"/>
	<jsp:param value="<%= faq %>" name="faq"/>
	<jsp:param value="<%= notice %>" name="notice"/>
	<jsp:param value="<%= logout %>" name="logout"/>
</jsp:include>

<!-- hero-wrap -->
<jsp:include page="../common/hero.jsp" flush="false">
	<jsp:param value="<%= menuName %>" name="menuName"/>
	<jsp:param value="<%= title %>" name="title"/>
	<jsp:param value="<%= home %>" name="home"/>
</jsp:include>

<!-- content -->
<section class="ftco-section">
  <div class="container">
  	<div class="col heading-section text-center mb-5 pb-5">
      <h2>객실목록</h2>
    </div>
    <div class="row toolbar-board-group">
      <div class="col-md-6 d-flex align-items-center board-page-info">
        <span class="total-page">총 <b><%= totalroomType %>타입</b> </span> 
      </div>
    </div>

    <div class="row">
      <div class="col">
        <div class="table-responsive">
          <table class="table table-board-list">
            <caption class="sr-only">게시판글</caption>
            <colgroup>
              <col style="width:20%;">
              <col style="width:10%;"> 
              <col style="width:10%;">  
              <col style="width:10%;">  
              <col style="width:10%;">  
              <col style="width:10%;">  
              <col style="width:10%;">  
            </colgroup>
            <thead>
              <tr>
                <th>객실 이름</th>
                <th>수용 인원</th>
                <th>객실 크기</th>
                <th>침대 크기</th>
                <th>침대 수</th>
                <th>전망</th>
                <th>1박 가격</th>
              </tr>
            </thead>
            <tbody>
              <tr>

<%= html.toString() %>
             
            </tbody>
          </table>
        </div>
      </div>
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
        <a href="../../../YoHangFront/build/images/insta-1.jpg" class="insta-img image-popup" style="background-image: url(../../../YoHangFront/build/images/insta-1.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../../YoHangFront/build/images/insta-2.jpg" class="insta-img image-popup" style="background-image: url(../../../YoHangFront/build/images/insta-2.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../../YoHangFront/build/images/insta-3.jpg" class="insta-img image-popup" style="background-image: url(../../../YoHangFront/build/images/insta-3.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../../YoHangFront/build/images/insta-4.jpg" class="insta-img image-popup" style="background-image: url(../../../YoHangFront/build/images/insta-4.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../../YoHangFront/build/images/insta-5.jpg" class="insta-img image-popup" style="background-image: url(../../../YoHangFront/build/images/insta-5.jpg);">
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
<jsp:include page="../common/footer.jsp" flush="false"/>

<!--
// script --------------------------------------->
<script type="text/javascript" src="../../../YoHangFront/build/js/yohang-bundle.js"></script>
<script type="text/javascript" src="../../../YoHangFront/build/vendors/yohang-vendors-bundle.js"></script>

</body>
</html>