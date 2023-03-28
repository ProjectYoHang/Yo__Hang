<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.example.model.FaqBoardTO"%>

<%@ page import="java.util.ArrayList" %>
<%
	//jsp hero parameters
	String menuName = "게시판 관리";
	String title = "FAQ";

	// jsp header parameters
	String home = "/Admin/home.do";
	String member = "/Admin/member/list.do";
	String book = "/Admin/book/list.do";
	String room = "/Admin/room/list.do";
	String qna = "/Admin/qna/list.do";
	String faq = "/Admin/faq/list.do";
	String notice = "/Admin/notice/list.do";
	String logout = "/Admin/logout.do";
	
    //int cpage = Integer.parseInt((String)request.getAttribute("cpage"));
    
	String cpage = (String)request.getAttribute("cpage");
	String faq_seq = (String)request.getAttribute("faq_seq");
	
	FaqBoardTO to = (FaqBoardTO)request.getAttribute("to");
	String faq_subject = to.getFaq_subject();
	String faq_content = to.getFaq_content();
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

<!--
// contents --------------------------------------->

<!-- content -->
<section class="ftco-section">
  <div class="container">
    <h3 class="board-view-title"><%= faq_subject %> </h3>
    <%-- <ul class="board-info-group">
      <li class="d-md-inline board-view-writer">
        <strong>작성자</strong>
        <span>&nbsp;<%= nt_id %></span>
      </li>      <li class="board-view-writer">
        <strong>작성일</strong>
        <span>&nbsp;<%= nt_date %></span>
      </li>

      <li class="board-view-hit">
        <strong>조회수</strong>
        <span>&nbsp;<%= nt_hit %></span>
      </li>
    </ul> --%>

    <div class="board-view-content">
   		<%= faq_content %>
    </div>


    <div class="text-center mt-4 pt-5">
      <a href="./modify.do?cpage=<%= cpage %>&faq_seq=<%= faq_seq %>" class="btn btn-secondary btn-lg">수정</a>
      <a href="./delete.do?cpage=<%= cpage %>&faq_seq=<%= faq_seq %>" class="btn btn-outline-secondary btn-lg">삭제</a>
      <a href="./list.do?cpage=<%= cpage %>" class="btn btn-secondary btn-lg">목록</a>
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

