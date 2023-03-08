<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.example.model.FaqBoardTO"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
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
%>

<%	
	ArrayList<FaqBoardTO> faqLists = (ArrayList<FaqBoardTO>)request.getAttribute("faqLists");
	
	int totalRecord = (Integer)request.getAttribute("totalRecord");
	int cpage = (Integer)request.getAttribute("cpage");
	int lastPage = (Integer)request.getAttribute("lastPage");
	int startPageNum = (Integer)request.getAttribute("startPageNum");
	int lastPageNum = (Integer)request.getAttribute("lastPageNum");
	int recordPerPage = (Integer)request.getAttribute("recordPerPage");
	int totalPage = ((totalRecord - 1) / recordPerPage) + 1;
	
	StringBuilder sbHtml = new StringBuilder();
	int index = 0;
	
	for(FaqBoardTO to : faqLists) {
		String faq_seq = to.getFaq_seq();
		String faq_subject = to.getFaq_subject();
		String faq_content = to.getFaq_content();
		index++;
		
		sbHtml.append("<div class='card'>");
		sbHtml.append("<div class='card-header'><h2 class='mb-0'>");
		sbHtml.append("<button class='btn btn-link btn-block text-left' type='button' data-toggle='collapse' data-target='#collapse-" + index + "' aria-expanded='false'>" + faq_subject + "</button>");
		sbHtml.append("</h2></div>");
		sbHtml.append("<div id='collapse-" + index + "' class='collapse' data-parent='#accordionFaq'>");
		sbHtml.append("<div class='card-body'>" + faq_content + "<a class='btn btn-primary' href='./view.do?cpage=" + cpage + "&faq_seq=" + faq_seq + "'>" + "수정</a></div>");
		sbHtml.append("</div>");
		sbHtml.append("</div>");
	}
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
	<jsp:param value="<%= member %>" name="home"/>
</jsp:include>

<!--
// contents --------------------------------------->

<!-- content -->
<section class="ftco-section">
  <div class="container">
	<div class="accordion-faq" id="accordionFaq">
	  
	  <%= sbHtml.toString() %>
	  
	  <!-- navigation -->
        <nav class="w-100">
          <ul class="pagination justify-content-center">
          
<%
	startPageNum = cpage - (cpage - 1) % recordPerPage;
	lastPageNum = cpage - (cpage - 1) % recordPerPage + recordPerPage - 1;
	if(lastPageNum >= totalPage) {
		lastPageNum = totalPage;
	}

	// 왼쪽 겹꺽쇄
	if(startPageNum == 1) {
		out.println("<li class='page-item disabled first'><a class='page-link'><i class='xi-angle-left-min' aria-hidden='true'></i></a></li>");
	} else {
		out.println("<li class='page-item first'><a class='page-link' href='./list.do?cpage=" + (startPageNum - recordPerPage ) + "'><i class='xi-angle-left-min' aria-hidden='true'></i></a></li>");
	}
	
	// 하단의 왼쪽 꺽쇄 클릭하면 이전 페이지로 이동하는 코드 / 1페이지에서는 이동x
	if(cpage == 1) {
		out.println("<li class='page-item disabled prev'><a class='page-link'><i class='xi-angle-left-min' aria-hidden='true'></i></a></li>");
	} else {
		out.println("<li class='page-item prev'><a class='page-link' href='./list.do?cpage=" + (cpage -1) + "'><i class='xi-angle-left-min' aria-hidden='true'></i></a></li>");
	}

	//
	for(int i = startPageNum ; i <= lastPageNum; i++) {
		
		// 현재페이지 번호만 각괄호로 표현
		if( i == cpage) {
			out.println("<li class='page-item active'><a class='page-link'>" + i + "</a></li>");
		} else {
			out.println("<li class='page-item'><a class='page-link' href='./list.do?cpage=" + i + "'>" + i + "</a></li>");
		}
	}
	
	// 하단의 오른쪽 꺽쇄 클릭하면 다음 페이지로 이동 / 마지막 페이지에서는 이동x
	if(cpage == totalPage) {
		out.println("<li class='page-item disabled next'><a class='page-link'><i class='xi-angle-right-min' aria-hidden='true'></i></a></li>");
	} else {
		out.println("<li class='page-item next'><a class='page-link' href='./list.do?cpage=" + (cpage + 1) + "'><i class='xi-angle-right-min' aria-hidden='true'></i></a></li>");
	}
	
	// 오른쪽 겹꺽쇄 클릭하면 다음 페이지 번호묶음으로 이동
	if(startPageNum == totalPage) {
		out.println("<li class='page-item disabled last'><a class='page-link'><i class='xi-angle-right-min' aria-hidden='true'></i></a></li>");
	} else {
		out.println("<li class='page-item last'><a class='page-link' href='./list.do?cpage=" + (recordPerPage + 1) + "'><i class='xi-angle-right-min' aria-hidden='true'></i></a></li>");
	}

%>				

			</ul>
        </nav>
        
        <!-- 글쓰기 버튼 -->        
        <div class="text-center mt-5">
			<a href="./write.do" class="btn btn-secondary btn-lg">글쓰기</a>
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