<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.example.model.QnABoardTO"%>
<%@page import="com.example.model.QnAReplyTO"%>
<%@page import="java.util.ArrayList"%>

<%
	//jsp hero parameters
	String menuName = "게시판관리";
	String title = "Q&A";
	
	// jsp header parameters
	String home = "/Admin/home.do";
	String member = "/Admin/member/list.do";
	String book = "/Admin/book/list.do";
	String room = "/Admin/room/list.do";
	String qna = "/Admin/qna/list.do";
	String faq = "/Admin/faq/list.do";
	String notice = "/Admin/notice/list.do";
	String logout = "/Admin/logout.do";

	// 사용자의 qna 데이터
	QnABoardTO qnaData = (QnABoardTO)request.getAttribute("qna");

	int cpage = Integer.parseInt((String)request.getAttribute("cpage"));

	String qna_seq = (String)request.getAttribute("qna_seq");

	String qna_id = qnaData.getQna_id();
	String qna_subject = qnaData.getQna_subject();
	String qna_content = qnaData.getQna_content();
	String qna_date = qnaData.getQna_date();
	
	// 혹 이미 답변이 있다면 보여줄 답댓글 데이터
	QnAReplyTO qnaReplys = (QnAReplyTO)request.getAttribute("qnaReplys");

	// 로그인상태가 아니므로 관리자 아이디값을 임시로 지정함
	String qrpl_id = "admin1234";
	
	StringBuilder html = new StringBuilder();
	
	if(qnaReplys != null) {
		
		String qrpl_content = qnaReplys.getQrpl_content();
		
		html.append("<form action='./modify_ok.do' name='mfrm' method='post'>");
		html.append("<input type='hidden' name='qna_seq' value='" + qna_seq + "' />");
		html.append("<input type='hidden' name='cpage' value='" + cpage + "' />");
		html.append("<div class='form-group'>");
		html.append("<br>");
		html.append("<textarea type='text' class='form-control'  name='qrpl_content' title='content' rows='10'>" + qrpl_content + "</textarea>");
		html.append("<br>");
		html.append("<input type='button' id='mbtn' value='수정' class='btn btn-secondary' />&nbsp;");
		html.append("<input type='button' class='btn btn-secondary' value='삭제' onclick='location.href=\"./delete_ok.do?cpage=" + cpage + "&qna_seq=" + qna_seq + "\"' />");
		html.append("</div>");
		html.append("</form>");
		
	} else {
		
		html.append("<form action='./write_ok.do' name='wfrm' method='post'>");
		html.append("<input type='hidden' name='qna_seq' value='" + qna_seq + "' />");
		html.append("<input type='hidden' name='cpage' value='" + cpage + "' />");
		html.append("<input type='hidden' name='qrpl_id' value='" + qrpl_id + "' />");
		html.append("<div class='form-group'>");
		html.append("<br>");
		html.append("<textarea type='text' class='form-control'  name='qrpl_content' title='content' placeholder='답댓글 내용을 입력해주세요.' rows='10'></textarea>");
		//html.append("<input type='text' name='qrpl_content' />");
		html.append("<br>");
		html.append("<input type='button' id='wbtn' value='답댓글 쓰기' class='btn btn-secondary' />");
		html.append("</div>");
		html.append("</form>");
		
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
      <li class="board-view-date">
        <strong>등록일</strong>
        <span>&nbsp;<%= qna_date %></span>
      </li>
    </ul>

    <div class="board-view-content">
      <%= qna_content %>
    </div>

<%= html.toString() %>

    <div class="text-center mt-4 pt-5 border-top">
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

<script type="text/javascript">
	window.onload = function() {
		if(document.getElementById('wbtn')) {
			document.getElementById('wbtn').onclick = function() { 
				if(document.wfrm.qrpl_content.value.trim() == '') { 
					alert('댓글 내용을 입력하셔야 합니다.');
					return false;
				}
				document.wfrm.submit();
			};
		} else if(document.getElementById('mbtn')) {
			document.getElementById('mbtn').onclick = function() { 
				if(document.mfrm.qrpl_content.value.trim() == '') { 
					alert('댓글 내용을 입력하셔야 합니다.');
					return false;
				}
				document.mfrm.submit();
			};
		}
	};
	
</script>

</body>
</html>



