<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="com.example.model.NoticeBoardTO"%>

<%
	//jsp hero parameters
	String menuName = "Board";
	String title = "Notice";
	
	// jsp header parameters
	String home = "/Admin/home.do";
	String member = "/Admin/member/list.do";
	String book = "/Admin/book/list.do";
	String room = "/Admin/room/list.do";
	String qna = "/Admin/qna/list.do";
	String faq = "/Admin/faq/list.do";
	String notice = "/Admin/notice/list.do";
	String logout = "/Admin/logout.do";
	
	NoticeBoardTO to = (NoticeBoardTO)request.getAttribute("to");	
	
	String cpage = (String)request.getAttribute("cpage");

	String nt_seq = (String)request.getAttribute("nt_seq");

	String nt_subject = to.getNt_subject();
	String nt_id = to.getNt_id();
	String nt_content = to.getNt_content();
%>

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>

<body>
<!-- 
// header --------------------------------------->

<jsp:include page="../common/header_admin.jsp" flush="false">
	<jsp:param value="<%= member %>" name="home"/>
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
<section class="ftco-section bg-light">
  <div class="container">
    <form action="./modify_ok.do" class="bg-white p-5" name="nmfrm">
    <input type="hidden" name="nt_seq" value="<%= nt_seq %>">
    <input type="hidden" name="cpage" value="<%= cpage %>">
      <div class="form-group">
        <input type="text" class="form-control" name="nt_subject" title="Title" value="<%= nt_subject %>">
      </div>
      <div class="form-group">
        <input type="text" class="form-control" name="nt_id" title="Title" value="<%= nt_id %>" readonly>
      </div>
      <div class="form-group">
        <textarea type="text" class="form-control"  name="nt_content" title="content" rows="10"><%= nt_content %></textarea>
      </div>
<!-- 
      <div class="form-group">
        <input type="file" id="file" name="file" class="form-control">
      </div>
-->
      <div class="form-group text-center mt-5">
        <input type="button" id="nmbtn" value="수정" class="btn btn-primary py-3 px-5">
        <a href="./view.do?cpage=<%= cpage %>&nt_seq=<%= nt_seq %>" class="btn btn-secondary py-3 px-5">보기</a>
        <a href="./list.do?cpage=<%= cpage %>" class="btn btn-secondary py-3 px-5">목록</a>
      </div>
    </form>
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

<script type="text/javascript">
	window.onload = function() {
			document.getElementById('nmbtn').onclick = function() {
				if(document.nmfrm.nt_subject.value.trim() == '') {
					alert('제목을 입력해야 합니다.');
					return false;
				}
				if(document.nmfrm.nt_content.value.trim() == '') {
					alert('내용을 입력해야 합니다.');
					return false;
				}
				document.nmfrm.submit();
			}
		}
	
</script>


</body>
</html>


