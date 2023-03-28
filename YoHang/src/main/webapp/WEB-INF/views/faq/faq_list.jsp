<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.example.model.FaqBoardTO"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList" %>

<%
	// jsp hero parameters
	String menuName = "Board";
	String title = "FAQ";
	
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
		
		/* sbHtml.append("<tr>");	
		sbHtml.append("<td>" + nt_seq + "</td>"); 
		sbHtml.append("<td class='board-list-title'><a href='./view.do?cpage=" + cpage + "&nt_seq=" + nt_seq + "'>" + nt_subject + "</a></td>");	
		sbHtml.append("</tr>");	 */
		
		sbHtml.append("<div class='card'>");
		sbHtml.append("<div class='card-header'><h2 class='mb-0'>");
		sbHtml.append("<button class='btn btn-link btn-block text-left' type='button' data-toggle='collapse' data-target='#collapse-" + index + "' aria-expanded='false'>" + faq_subject + "</button>");
		sbHtml.append("</h2></div>");
		sbHtml.append("<div id='collapse-" + index + "' class='collapse' data-parent='#accordionFaq'>");
		sbHtml.append("<div class='card-body'>" + faq_content + "</div>");
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
	<div class="accordion-faq" id="accordionFaq">
	 <!--  <div class="card">
	    <div class="card-header" id="headingOne">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	          [예약] 객실예약 안내 부탁드립니다.
	        </button>
	      </h2>
	    </div>
	    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionFaq">
	      <div class="card-body">
	        객실예약은 대표 전화와 홈페이지, 모바일, 앱, 이메일을 통하여 가능합니다.<br>

			대표전화 032 743 9000<br>
			E-mail : reservation@yohang.co.kr<br>
			http://www.yohang.#
	      </div>
	    </div>
	  </div> -->
	  
	  <!-- <div class="card">
	    <div class="card-header" id="headingOne-1">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseOne-1" aria-expanded="false" aria-controls="collapseOne-1">
	          [예약] 지인에게 객실 1박을 선물하고 싶습니다. 결제는 어떻게 이루어지나요?
	        </button>
	      </h2>
	    </div>
	    <div id="collapseOne-1" class="collapse" aria-labelledby="headingOne-1" data-parent="#accordionFaq">
	      <div class="card-body">
	        <b>[예약 방법]</b><br>
			# 홈페이지 회원<br>
			- 사전결제(신용카드)로 예약 진행을 하셨을 경우 실제 투숙객과 에약자 성함이 다를 수 있으므로 032 743 9000 유선전화 또는 카카오톡 연락 부탁드립니다.<br>
			(실제 투숙하시는 고객님 이름으로 예약이 필요합니다)<br><br>
			
			# 홈페이지 비회원<br>
			- 비회원 예약 시 실제 투숙객과 에약자 성함이 다를 수 있으므로 032 743 9000 유선전화 또는 카카오톡 연락 부탁드립니다.<br>
			(실제 투숙하시는 고객님 이름으로 예약이 필요합니다)<br><br>
			
			<b>[결제 방법]</b><br>
			- 신용카드와 무통장입금이 가능합니다.<br>
			- 신용카드 결제는 선결제 또는 현장 결제가 가능합니다. (단, 제3자 결제 요청서 작성 필요)<br>
			- 무통장입금 결제는 객실 예약시 기재하는 카드정보(개런티용) 확인이 필요합니다.<br><br>
			
			<b>*제3자 결제 요청서란?</b>
			- 실제 투숙객 본인이 아닌 제3자의 신용카드를 통해 결제되는 사용 동의서 입니다.
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header" id="headingTwo">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	          [객실] 객실 내 amenity 구입이 가능한가요?
	        </button>
	      </h2>
	    </div>
	    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionFaq">
	      <div class="card-body">
	        객실 내 모든 아이템은 디자이너 자체 제작 상품으로 구성되어 있으며, 일부 상품에 따라 구매 가능합니다.
	      </div>
	    </div>
	  </div>
	  <div class="card">
	    <div class="card-header" id="headingTwo-1">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo-1" aria-expanded="false" aria-controls="collapseTwo-1">
	          [예약] 지인에게 객실 1박을 선물하고 싶습니다. 결제는 어떻게 이루어지나요?
	        </button>
	      </h2>
	    </div>
	    <div id="collapseTwo-1" class="collapse" aria-labelledby="headingTwo-1" data-parent="#accordionFaq">
	      <div class="card-body">
	        [예약 방법]
			# 홈페이지 회원
			- 사전결제(신용카드)로 예약 진행을 하셨을 경우 실제 투숙객과 에약자 성함이 다를 수 있으므로 032 743 9000 유선전화 또는 카카오톡 연락 부탁드립니다.
			(실제 투숙하시는 고객님 이름으로 예약이 필요합니다)
			
			# 홈페이지 비회원
			- 비회원 예약 시 실제 투숙객과 에약자 성함이 다를 수 있으므로 032 743 9000 유선전화 또는 카카오톡 연락 부탁드립니다.
			(실제 투숙하시는 고객님 이름으로 예약이 필요합니다)
			
			[결제 방법]
			- 신용카드와 무통장입금이 가능합니다.
			- 신용카드 결제는 선결제 또는 현장 결제가 가능합니다. (단, 제3자 결제 요청서 작성 필요)
			- 무통장입금 결제는 객실 예약시 기재하는 카드정보(개런티용) 확인이 필요합니다.
			
			*제3자 결제 요청서란?
			- 실제 투숙객 본인이 아닌 제3자의 신용카드를 통해 결제되는 사용 동의서 입니다.
	      </div>
	    </div>
	  </div>
	  
	  
	  <div class="card">
	    <div class="card-header" id="headingThree">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
	          [연회] 연회장은 몇층에 위치하고 있나요?
	        </button>
	      </h2>
	    </div>
	    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionFaq">
	      <div class="card-body">
	        연회장은 G층에 위치하고 있으며, 네스트 메인 로비 및 오디토리움 별관 (연회장 전용 입구) 을 통하여 들어오실 수 있습니다.
	      </div>
	    </div>
	  </div>
	  <div class="card">
	    <div class="card-header" id="headingFour">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
	          [연회] 연회 행사 시 안내 사이니지 설치가 가능한가요?
	        </button>
	      </h2>
	    </div>
	    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionFaq">
	      <div class="card-body">
	        연회행사 시 게스트 분들이 쉽게 행사장을 찾아오실 수 있도록 로비 입구층, 연회장 동선에 행사 사이니지를 각각 설치하여 안내해드리고 있습니다.
	      </div>
	    </div>
	  </div> -->
	  
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