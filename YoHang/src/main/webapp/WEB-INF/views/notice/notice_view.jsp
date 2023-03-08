<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.example.model.NoticeBoardTO"%>

<%@ page import="java.util.ArrayList" %>
<%
	//jsp hero parameters
	String menuName = "Board";
	String title = "Notice";

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
	
    //int cpage = Integer.parseInt((String)request.getAttribute("cpage"));
    
	String cpage = (String)request.getAttribute("cpage");
	String nt_seq = (String)request.getAttribute("nt_seq");
	
	NoticeBoardTO to = (NoticeBoardTO)request.getAttribute("to");
	String nt_subject = to.getNt_subject();
	String nt_id = to.getNt_id();
	String nt_date = to.getNt_date();
	String nt_content = to.getNt_content();
	String nt_file_name = to.getNt_file_name();
	int nt_hit = to.getNt_hit();
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

<!--
// contents --------------------------------------->

<!-- content -->
<section class="ftco-section">
  <div class="container">
    <h3 class="board-view-title"><%= nt_subject %> </h3>
    <ul class="board-info-group">
      <li class="d-md-inline board-view-writer">
        <strong>작성자</strong>
        <span>&nbsp;<%= nt_id %></span>
      </li>
      <li class="board-view-writer">
        <strong>작성일</strong>
        <span>&nbsp;<%= nt_date %></span>
      </li>
      <li class="board-view-hit">
        <strong>조회수</strong>
        <span>&nbsp;<%= nt_hit %></span>
      </li>
    </ul>

    <div class="board-view-content">
   		<%= nt_content %>
    </div>
    
    <div class="row pt-4 board-view-file">
      <div class="col-md-2">
        <h4 class="h5 mb-0">첨부파일</h4>
      </div>
      <div class="col-md-10">
        <ul class="p-md-0 mb-0">
          <li><a href="#" download><i class="xi-file-text-o"></i> <%= nt_file_name %></a></li>
        </ul>
      </div>
    </div>


    <div class="text-center mt-4 pt-5 border-top">
      <%-- <a href="./modify.do?cpage=<%= cpage %>&nt_seq=<%= nt_seq %>" class="btn btn-primary btn-lg">수정</a>
      <a href="./delete.do?cpage=<%= cpage %>&nt_seq=<%= nt_seq %>" class="btn btn-outline-primary btn-lg">삭제</a> --%>
      <a href="./list.do?cpage=<%= cpage %>" class="btn btn-primary btn-lg">목록</a>
    </div>
		</div>
		<!--//게시판-->
	</div>
<!-- 하단 디자인 -->
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

