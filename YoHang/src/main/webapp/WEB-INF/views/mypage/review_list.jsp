<%@page import="com.example.model.RvBoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>


<%
	//jsp hero parameters
	String menuName = "마이페이지";
	String title = "마이페이지";
	
	// jsp header parameters
	String home = "/home.do";
	String aboutus = "/aboutus.do";
	String findus = "/findus.do";
	String qna = "/qna/list.do";
	String faq = "/faq/list.do";
	String notice = "/notice/list.do";
	String rv ="/rv/list.do";
	String login = "/login.do";
	String logout = "/logout.do";
	String mypage = "/mypage";
%>

<% 
	
	ArrayList<RvBoardTO> rvInfos = (ArrayList<RvBoardTO>)request.getAttribute("rvInfos");
	int totalRecord = rvInfos.size();
	
	StringBuilder html = new StringBuilder();
	
	for(RvBoardTO to : rvInfos) {
		String rv_seq = to.getRv_seq();
		String rv_id = to.getRv_id();
		String rv_subject = to.getRv_subject();
		String rv_date = to.getRv_date();
		
		html.append("<tr>");
		html.append("<td>" + rv_seq + "</td>");
		html.append("<td>" + rv_id + "</td>");	
		html.append("<td>" + rv_subject + "</td>");
		html.append("<td>" + rv_date + "</td>");
		html.append("<td><button type='button' onclick='location.href=\"./rvDeleteOk.do?rv_seq=" + rv_seq + "\"' class='btn btn-primary'>리뷰삭제</button></td>");
		html.append("</tr>");	
	}
	

	
%>    

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>

<body>
<!-- 
// header --------------------------------------->
<jsp:include page="../common/header.jsp" flush="false">
	<jsp:param value="<%= home %>" name="home"/>
	<jsp:param value="<%= aboutus %>" name="aboutus"/>
	<jsp:param value="<%= findus %>" name="findus"/>
	<jsp:param value="<%= qna %>" name="qna"/>
	<jsp:param value="<%= faq %>" name="faq"/>
	<jsp:param value="<%= notice %>" name="notice"/>
	<jsp:param value="<%= rv %>" name="rv"/>
	<jsp:param value="<%= login %>" name="login"/>
	<jsp:param value="<%= logout %>" name="logout"/>
	<jsp:param value="<%= mypage %>" name="mypage"/>
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
      <h2>내 리뷰</h2>
    </div>
    <div class="row toolbar-board-group">
      <div class="col-md-6 d-flex align-items-center board-page-info">
        <span class="total-page">전체 <b><%= totalRecord %>건</b> </span> 
        <%-- <span class="current-page">현재 페이지 <b><%= cpage %></b>/<b><%= totalPage %></b></span> --%>
      </div>
      <div class="col-md-6 board-search-box">
        <div class="form-row">
        <!--
          <div class="col-4">
            <select class="form-control">
              <option>제목</option>
              <option>내용</option>
            </select>
          </div>
           
          <div class="col-6">
            <input type="text" class="form-control">
          </div>
          <div class="col-2">
            <input type="submit" class="btn btn-primary btn-lg" value="검색">
          </div>
           -->
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col">
        <div class="table-responsive">
          <table class="table table-board-list">
            <caption class="sr-only">게시판글</caption>
            <colgroup>
              <col style="width:10%;">
              <col style="width:15%;"> 
              <col style="width:10%;">  
              <col style="width:15%;">  
              <col style="width:15%;">  
            </colgroup>
            <thead>
              <tr>
                <th>글 번호</th>
                <th class="text-center">글쓴이</th>
                <th>제목</th>
                <th>날짜</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr>

<%= html.toString() %>
             
            </tbody>
          </table>
        </div>

        <!-- navigation -->
        <nav class="w-100">
          <ul class="pagination justify-content-center">
          
				

			</ul>
        </nav>

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