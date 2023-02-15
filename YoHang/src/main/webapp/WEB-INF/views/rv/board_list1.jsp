<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.example.model.RvBoardTO"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList" %>

<%	
	// jsp hero parameters
	String menuName = "Board";
	String title = "Review";

	// jsp header parameters
	String home = "/home.do";
	String aboutus = "/aboutus.do";
	String findus = "/findus.do";
	String qna = "/qna/list.do";
	String faq = "/faq/list.do";
	String notice = "/notice/list.do";
	String rv = "/rv/list.do";
	String login = "/login.do";
	String logout = "/logout.do";
	String mypage = "/mypage";



	ArrayList<RvBoardTO> rvLists = (ArrayList<RvBoardTO>)request.getAttribute("rvLists");

	int totalRecord = (Integer)request.getAttribute("totalRecord");

	int cpage = (Integer)request.getAttribute("cpage");

	int lastPage = (Integer)request.getAttribute("lastPage");

	int startPageNum = (Integer)request.getAttribute("startPageNum");
	int lastPageNum = (Integer)request.getAttribute("lastPageNum");

	int recordPerPage = (Integer)request.getAttribute("recordPerPage");

	int totalPage = ((totalRecord - 1) / recordPerPage) + 1;
	StringBuilder sbHtml = new StringBuilder();
		
	for(int i = 0; i < rvLists.size(); i++) {
		
		RvBoardTO rvList = rvLists.get(i);
		
		String rv_seq = rvList.getRv_seq();
		String rv_subject = rvList.getRv_subject();
		String rv_content = rvList.getRv_content();
		String rv_id = rvList.getRv_id();
		String rv_date = rvList.getRv_date();
		String rv_img_name = rvList.getRv_img_name();
		int wgap = rvList.getWgap();
		
		if(i % 3 ==0) {
			sbHtml.append( "<tr>" );
		}
		sbHtml.append( "	<td class='last2'>" );
		sbHtml.append( "		<div class='board'>" );
		sbHtml.append( "			<table class='boardT'>" );
		sbHtml.append( "			<tr>" );
		sbHtml.append( "				<td class='boardThumbWrap'>" );
		sbHtml.append( "					<div class='boardThumb'>" );
		if( rv_seq.equals( "" ) ) {
			sbHtml.append( "						<img src='../../images/noimage.jpg' border='0' width='200' />" );
		} else {
			sbHtml.append( "						<a href='./view.do?cpage=" + cpage + "&rv_seq=" + rv_seq + "'><img src='../upload/reviews/" + rv_img_name + "' border='0' width='200' /></a>" );
		}
		sbHtml.append( "					</div>" );
		sbHtml.append( "				</td>" );
		sbHtml.append( "			</tr>" );
		sbHtml.append( "			<tr>" );
		sbHtml.append( "				<td>" );
		sbHtml.append( "					<div class='boardItem'>" );
		if( rv_seq.equals( "" ) ) {
			sbHtml.append( "						<strong></strong>" );
			sbHtml.append( "						<span class='coment_number'></span>" );
		} else {
			sbHtml.append( "						<strong>" + rv_subject +"</strong>" );

		}
		sbHtml.append( "					</div>" );
		sbHtml.append( "				</td>" );
		sbHtml.append( "			</tr>" );
		sbHtml.append( "			<tr>" );
		sbHtml.append( "				<td><div class='boardItem'><span class='bold_blue'>" + rv_id + "</span></div></td>" );
		sbHtml.append( "			</tr>" );
		sbHtml.append( "			<tr>" );
		sbHtml.append( "				<td>" );
		if( rv_seq.equals( "" ) ) {
			sbHtml.append( "					<div class='boardItem'></div>" );
		} else {
			sbHtml.append( "					<div class='boardItem'>" + rv_date + "</div>" );
		}
		sbHtml.append( "				</td>" );
		sbHtml.append( "			</tr>") ;
		sbHtml.append( "		</table>" );
		sbHtml.append( "	</div>" );
		sbHtml.append( "</td>" );
		
		if( i%3 == 2 ) {
			sbHtml.append( "</tr>" );
		}
		
		

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
    <div class="row toolbar-board-group">
      <div class="col-md-6 d-flex align-items-center board-page-info">
        <span class="total-page">전체 <b><%= totalRecord %>건</b> </span> 
        <span class="current-page">현재 페이지 <b><%= cpage %></b>/<b><%= totalPage %></b></span>
      </div>
      <div class="col-md-6 board-search-box">
        <div class="form-row">
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
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col">
        <div class="table-responsive">
          <table class="table table-board-list">
            <caption class="sr-only">게시판글</caption>
            <tbody>
              <tr>

<%= sbHtml.toString() %>
             
            </tbody>
          </table>
        </div>

        <!-- navigation -->
        <nav class="w-100">
          <ul class="pagination justify-content-center">
          
          <!-- 
            <li class="page-item disabled first"><a class="page-link"><i class="xi-angle-left-min" aria-hidden="true"></i></a></li>
            <li class="page-item disabled prev"><a class="page-link"><i class="xi-angle-left-min" aria-hidden="true"></i></a></li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item disabled next"><a class="page-link"><i class="xi-angle-right-min" aria-hidden="true"></i></a></li>
            <li class="page-item disabled last"><a class="page-link"><i class="xi-angle-right-min" aria-hidden="true"></i></a></li>
           -->
		
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
	if(cpage == totalPage) {
		out.println("<li class='page-item disabled last'><a class='page-link'><i class='xi-angle-right-min' aria-hidden='true'></i></a></li>");
	} else if(cpage != totalPage&&lastPageNum == totalPage){
		out.println("<li class='page-item last'><a class='page-link' href='./list.do?cpage=" + totalPage + "'><i class='xi-angle-right-min' aria-hidden='true'></i></a></li>");
	}else {
		out.println("<li class='page-item last'><a class='page-link' href='./list.do?cpage=" + (recordPerPage + 1) + "'><i class='xi-angle-right-min' aria-hidden='true'></i></a></li>");
	}
		
		
%>				

			</ul>
        </nav>

		<!-- 글쓰기 버튼 -->        
        <div class="text-center mt-5">
            <c:if test="${loginMember == null }">
            	<a class="btn btn-secondary btn-lg" href="<%= login %>">글쓰기</a>
            </c:if>
            <c:if test="${loginMember != null }">
            	<a class="btn btn-secondary btn-lg" href="./write.do">글쓰기</a>
            </c:if>        
			<!-- <a href="./write.do" class="btn btn-secondary btn-lg">글쓰기</a>  -->
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