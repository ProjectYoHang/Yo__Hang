<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.example.model.QnAReplyTO"%>
<%@page import="com.example.model.QnABoardTO"%>
	
<%
	//jsp hero parameters
	String menuName = "Board";
	String title = "Q&A";
	
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
	String mypage = "/mypage/list.do";
	
	QnABoardTO to = (QnABoardTO)request.getAttribute("to");
	
	int cpage = Integer.parseInt((String)request.getAttribute("cpage"));

	String qna_seq = (String)request.getAttribute("qna_seq");	

	String qna_subject = to.getQna_subject();
	String qna_id = to.getQna_id();
	String qna_date = to.getQna_date();
	int qna_hit = to.getQna_hit();
	String qna_content = to.getQna_content().replaceAll("\n", "<br>");
	
	// 글 내용 하단의 관리자의 답댓글
	QnAReplyTO qnaReplys = (QnAReplyTO)request.getAttribute("qnaReplys");
	
	StringBuilder html = new StringBuilder();
		
	if(qnaReplys != null) {
		
		String qrpl_id = qnaReplys.getQrpl_id();
		qrpl_id = "관리자";
		String qrpl_content = qnaReplys.getQrpl_content();
		String qrpl_date = qnaReplys.getQrpl_date();
		
		html.append("<div>");
		html.append("<tr>");
		html.append("<td></td>" + "<br>");		
		html.append("<td><댓글></td>" + "<br>");
		html.append("<td>" + qrpl_id + " / " + qrpl_date + "</td>" + "<br>");
		html.append("<td>" + qrpl_content + "</td>" + "<br>");
		html.append("</tr>");
		html.append("</div>");
		
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

<!--
// contents --------------------------------------->

<!-- content -->
<section class="ftco-section">
  <div class="container">
    <h3 class="board-view-title"><%= qna_subject %></h3>
    <ul class="board-info-group">
      <li class="d-md-inline board-view-writer">
        <strong>작성자</strong>
        <span>&nbsp;<%= qna_id %></span>
      </li>
      <li class="board-view-writer">
        <strong>작성일</strong>
        <span>&nbsp;<%= qna_date %></span>
      </li>
      <li class="board-view-hit">
        <strong>조회수</strong>
        <span>&nbsp;<%= qna_hit %></span>
      </li>
    </ul>

    <div class="board-view-content">
      <%= qna_content %>
    </div>

<%= html.toString() %>

    <div class="text-center mt-4 pt-5 border-top">
      <a href="./modify.do?cpage=<%= cpage %>&qna_seq=<%= qna_seq %>" class="btn btn-primary btn-lg">수정</a>
      <a href="./delete.do?cpage=<%= cpage %>&qna_seq=<%= qna_seq %>" class="btn btn-outline-primary btn-lg">삭제</a>
      <a href="./list.do?cpage=<%= cpage %>" class="btn btn-primary btn-lg">목록</a>
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
        <a href="../../../YoHangFront/build/images/insta-1.jpg" class="insta-img image-popup" style="background-image: url(/../../../YoHangFront/build/images/insta-1.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../../YoHangFront/build/images/insta-2.jpg" class="insta-img image-popup" style="background-image: url(/../../../YoHangFront/build/images/insta-2.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../../YoHangFront/build/images/insta-3.jpg" class="insta-img image-popup" style="background-image: url(/../../../YoHangFront/build/images/insta-3.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../../YoHangFront/build/images/insta-4.jpg" class="insta-img image-popup" style="background-image: url(/../../../YoHangFront/build/images/insta-4.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../../YoHangFront/build/images/insta-5.jpg" class="insta-img image-popup" style="background-image: url(/../../../YoHangFront/build/images/insta-5.jpg);">
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

