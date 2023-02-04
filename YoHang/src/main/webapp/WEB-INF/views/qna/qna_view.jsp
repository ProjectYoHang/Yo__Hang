<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.example.model.QnAReplyTO"%>
<%@page import="com.example.model.QnABoardTO"%>
	
<%
	QnABoardTO to = (QnABoardTO)request.getAttribute("to");
	
	int cpage = Integer.parseInt((String)request.getAttribute("cpage"));

	String qna_seq = (String)request.getAttribute("qna_seq");	

	String qna_subject = to.getQna_subject();
	String qna_id = to.getQna_id();
	String qna_date = to.getQna_date();
	int qna_hit = to.getQna_hit();
	String qna_content = to.getQna_content().replaceAll("\n", "<br>");
	
	/*
	ArrayList<QnAReplyTO> qnaReplys = (ArrayList)request.getAttribute("qnaReplys");
	
	StringBuilder html = new StringBuilder();
	for(QnAReplyTO rplTo : qnaReplys) {
		
		String qrpl_id = rplTo.getQrpl_id();
		String qrpl_content = rplTo.getQrpl_content();
		String qrpl_date = rplTo.getQrpl_date();
		
		html.append("<div>");
		html.append("<tr>");
		html.append("<td><댓글></td>" + "<br>");
		html.append("<td>" + qrpl_id + "</td>" + "<br>");
		html.append("<td>" + qrpl_content + "</td>" + "<br>");
		html.append("<td>" + qrpl_date + "</td>");
		html.append("</tr>");
		html.append("</div>");
	}
	*/

%>

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>

<body>
<!--
// header --------------------------------------->

<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  <div class="container">
    <a class="navbar-brand" href="/home.do">YoHang</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="oi oi-menu"></span> Menu
    </button>

    <div class="collapse navbar-collapse" id="ftco-nav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active"><a href="/home.do" class="nav-link">Home</a></li>
        <li class="nav-item"><a href="aboutus.do" class="nav-link">About us</a></li>
        <li class="nav-item"><a href=">findus.do" class="nav-link">How to find us</a></li>
        <li class="nav-item"><a href="/qna/list.do" class="nav-link">Board</a></li>
        <!-- <li class="nav-item"><a href="login.html" class="nav-link" onclick="href">Login</a></li>	-->
        <c:if test="${loginMember == null}">
			<li class="nav-item"><a href="login.do" class="nav-link" onclick="href">Login</a></li>
		</c:if>
		<c:if test="${loginMember != null}">
			<li class="nav-item"><a href="home.do" class="nav-link" onclick="location.href='./logout.do'">Logout</a></li>
		</c:if>
        
      </ul>
    </div>
  </div>
</nav>

<!--
// contents --------------------------------------->

<!-- hero-wrap -->
<jsp:include page="../common/hero.jsp" flush="false"/>


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

<!-- 
    <div class="row pt-4 board-view-file">
      <div class="col-md-2">
        <h4 class="h5">첨부파일</h4>
      </div>
      <div class="col-md-10">
        <ul class="p-md-0 mb-0">
          <li><a href="#" download><i class="xi-file-text-o"></i> 주방위생 및 개인위생.ppt (5.64MB)</a></li>
          <li><a href="#" download><i class="xi-file-text-o"></i> 메뉴.ppt (2.97MB)</a</li>
          <li><a href="#" download><i class="xi-file-text-o"></i> 위해요소중점관리기준(HACCP).ppt (917.5KB)</a></li>
        </ul>
      </div>
    </div>
 -->

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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js">
$(document).ready(function() {
	showReplys();
});

function showReplys() {
	
	let url = "${pageContext.request.contextPath}/qna/view.do";
	let paramData = {"qnaReplys": "${qnaReplys}"}
	
	$.ajax({
		type: 'get',
		url: url,
		data: paramData,
		dataType : 'json',
		success: function(result) {
			let htmls = "";
			if(result.length >= 1) {
				$(result).each(function() {
					html.append("<div>");
					html.append("<tr>");
					html.append("<td><댓글></td>" + "<br>");
					html.append("<td>" + this.qrpl_id + "</td>" + "<br>");
					html.append("<td>" + this.qrpl_content + "</td>" + "<br>");
					html.append("<td>" + this.qrpl_date + "</td>");
					html.append("</tr>");
					html.append("</div>");
				})
			}
		},
		error: function(err) {
			console.log('[에러] : ' + err.message);
		}
	})
};

</script>

</body>
</html>

