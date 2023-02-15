<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.example.model.BookInfoTO"%>
<%@page import="com.example.model.QnABoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.model.BookTO"%>
<%@page import="com.example.model.RvBoardTO"%>

<%
	// include한 jsp에 필요한 parameters
	String menuName = "mypage";
	String title = "마이페이지";
	
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
	ArrayList<BookInfoTO> bookInfosMin = (ArrayList<BookInfoTO>)request.getAttribute("bookInfosMin");	
	
	int totalRecord = bookInfosMin.size();
	
	StringBuilder html = new StringBuilder();
	
	for(BookInfoTO to : bookInfosMin) {
		String seq = to.getSeq();
		String id = to.getId();
		String rooms_seq = to.getRooms_seq();
		String checkin = to.getCheckin().substring(0, 10);
		String checkout = to.getCheckout().substring(0, 10);
		String date = to.getDate().substring(0, 10);
		
		html.append("<tr>");
		html.append("<td>" + seq + "</td>");
		html.append("<td>" + rooms_seq + "</td>");
		html.append("<td>" + checkin + "</td>");
		html.append("<td>" + checkout + "</td>");
		html.append("<td>" + date + "</td>");
		html.append("</tr>");	
	}

	ArrayList<RvBoardTO> rvInfo = (ArrayList<RvBoardTO>)request.getAttribute("rvInfo");
	
	//int totalRecord = rvInfo.size();
	
	StringBuilder rvhtml = new StringBuilder();
	
	for(RvBoardTO rto : rvInfo) {
		String rv_seq = rto.getRv_seq();
		String rv_subject = rto.getRv_subject();
		String rv_date = rto.getRv_date();

		
		rvhtml.append("<tr>");
		rvhtml.append("<td>" + rv_seq + "</td>");
		rvhtml.append("<td>" + rv_subject + "</td>");
		rvhtml.append("<td>" + rv_date + "</td>");
		rvhtml.append("</tr>");	
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
    <div class="row">
      <div class="col-md-2">
        <div class="row">
			<button type="button" class="btn btn-primary btn-lg my-3 btn-block" onclick="location.href='mypage/list.do'">내 정보</button>
			<button type="button" class="btn btn-primary btn-lg my-3 btn-block" onclick="location.href='mypage/booklist.do'">내 예약</button>
			<button type="button" class="btn btn-primary btn-lg my-3 btn-block" onclick="location.href='mypage/review.do'">내 리뷰</button>
         </div>
      </div>
      <div class="col-md-1"></div>
      <div class="col-md-9 sidebar ftco-animate">
        <div class="sidebar-box">
	        <div class="border border-grey rounded">
	      		<div class="h5 mx-4 my-4">
	      			<b>내 정보</b>
	      			<button type="button" class="btn btn-dark" style="float:right;" onclick="location.href='mypage/list.do'"><b>+</b></button>
	      		</div>
	      		<div class="mx-4 my-4">
	      			<div class="table-reponsive">
		      			<table class="table table-board-list">
		      				<caption class="sr-only"></caption>
		      				<colgroup>
		      					<col style="width:10%;">
				              	<col style="width:15%;"> 
				              	<col style="width:25%;">  
				              	<col style="width:25%;">  
		      				</colgroup>
		      				<thead class="thead-light">
				              	<tr>
					                <th>이름</th>
					                <th class="text-center">아이디</th>
					                <th>이메일</th>
					                <th>전화번호</th>
				              	</tr>
				            </thead>
				            <tbody>
	              				<tr>
				            		<td>${loginMember.m_name }</td>
				            		<td>${loginMember.m_id}</td>
				            		<td>${loginMember.m_email }</td>
				            		<td>${loginMember.m_phone }</td>
								</tr>			            
			            	</tbody>
		      			</table>
	      			</div>
	      		</div>
	      	</div>
	      	<br>
	      	<div class="border border-grey rounded">
	      		<div class="h5 mx-4 my-4">
	      			<b>내 예약</b>
	      			<button type="button" class="btn btn-dark" style="float:right;" onclick="location.href='mypage/booklist.do'"><b>+</b></button>
	      		</div>
	      		<div class="mx-4 my-4">
	      			<div class="table-reponsive">
		      			<table class="table table-board-list">
		      				<caption class="sr-only">내 예약목록</caption>
		      				<colgroup>
		      					<col style="width:10%;">
				              <col style="width:15%;"> 
				              <col style="width:25%;">  
				              <col style="width:25%;">  
				              <col style="width:25%;">  
		      				</colgroup>
		      				<thead class="thead-light">
				              <tr>
				                <th>예약번호</th>
				                <th class="text-center">객실번호</th>
				                <th>체크인</th>
				                <th>체크아웃</th>
				                <th>예약일</th>
				              </tr>
				            </thead>
				            <tbody>
				            
<%= html.toString() %>      
<!--
	              				<tr>        			 
				            		<td>1</td>
				            		<td>1</td>
				            		<td>2020-02-01</td>
				            		<td>2020-02-02</td>
				            		<td>2020-01-26</td>
								</tr>	
								 -->		            
				            </tbody>
		      			</table>
	      			</div>
	      		</div>
	      		
	      		
	      		
	      	</div>
	      	<br>
	      <div class="border border-grey rounded">
	      		<div class="h5 mx-4 my-4">
	      			<b>내 리뷰</b>
	      			<button type="button" class="btn btn-dark" style="float:right;" onclick="location.href='mypage/review.do'"><b>+</b></button>
	      		</div>
	      		<div class="mx-4 my-4">
	      			<div class="table-reponsive">
		      			<table class="table table-board-list">
		      				<caption class="sr-only"></caption>
		      				<colgroup>
		      					<col style="width:25%;"> 
				              	<col style="width:25%;">  
				              	<col style="width:25%;">  
		      				</colgroup>
		      				<thead class="thead-light">
				              	<tr>
					                <th>글 번호</th>		                
					                <th>글 제목</th>
					                <th>날짜</th>
				              	</tr>
				            </thead>
				            <tbody>
<%= rvhtml.toString() %>				            
<!-- 	              				<tr>
				            		<td></td>
				            		<td></td>
				            		<td></td>
								</tr>
								-->			            
			            	</tbody>				            
		      			</table>
	      			</div>
	      		</div>
	      	</div>
	      	
	      	
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