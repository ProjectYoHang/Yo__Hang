<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.example.model.QnABoardTO"%>
<%@page import="java.util.ArrayList"%>

<%
	// jsp hero parameters
	String menuName = "Board";
	String title = "Q&A";
	
	// jsp header parameters
	String home = "/home.do";
	String aboutus = "/aboutus.do";
	String findus = "/findus.do";
	String qna = "/qna/list.do";
	String faq = "/faq/list.do";
	String notice = "/notice/list.do";
	String login = "/login.do";
	String logout = "/logout.do";
	String mypage = "/mypage/list.do";
		
	ArrayList<QnABoardTO> qnaLists = (ArrayList<QnABoardTO>)request.getAttribute("qnaLists");
	
	int totalRecord = (Integer)request.getAttribute("totalRecord");

	int cpage = (Integer)request.getAttribute("cpage");
	
	int lastPage = (Integer)request.getAttribute("lastPage");
	
	int startPageNum = (Integer)request.getAttribute("startPageNum");
	int lastPageNum = (Integer)request.getAttribute("lastPageNum");
	
	int recordPerPage = (Integer)request.getAttribute("recordPerPage");
	
	int totalPage = ((totalRecord - 1) / recordPerPage) + 1;
	
	StringBuilder sbHtml = new StringBuilder();

	for(QnABoardTO to : qnaLists) {
		String qna_seq = to.getQna_seq();
		String qna_subject = to.getQna_subject();
		String qna_id = to.getQna_id();
		String qna_date = to.getQna_date();
		int qna_hit = to.getQna_hit();
		int wgap = to.getWgap();
		int qna_reply = to.getQna_reply();
		
		sbHtml.append("<td>" + qna_seq + "</td>"); 
		sbHtml.append("<td class='board-list-title'><a href='./view.do?cpage=" + cpage + "&qna_seq=" + qna_seq + "'>" + qna_subject + "</a></td>");	
		sbHtml.append("<td>" + qna_date + "</td>");	
		sbHtml.append("<td>" + qna_id + "</td>");	
		sbHtml.append("<td>" + qna_hit + "</td>");	
		
		if(qna_reply == 1) {
			sbHtml.append("<td><font color='blue'>답변완료</font></td>");
		} else {
			sbHtml.append("<td><font color='red'>답변대기</font></td>");
		}
		
		sbHtml.append("</tr>");	
	};
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
            <colgroup>
              <col style="width:5%;">
              <col style="width:45%;"> 
              <col style="width:15%;">  
              <col style="width:15%;">  
              <col style="width:10%;">  
              <col style="width:10%;">  
            </colgroup>
            <thead>
              <tr>
                <th>번호</th>
                <th class="text-center">제목</th>
                <th>작성일</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>답변여부</th>
              </tr>
            </thead>
            <tbody>
              <tr>

<%= sbHtml.toString() %>
             
            </tbody>
          </table>
        </div>

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