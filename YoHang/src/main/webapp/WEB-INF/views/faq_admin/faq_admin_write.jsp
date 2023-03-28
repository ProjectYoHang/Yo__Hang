<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>

<body>
<!-- 
// header --------------------------------------->

<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
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
	<form action="./write_ok.do" method="post" name="faqfrm">
      <div class="form-group">
        <input type="text" class="form-control" name="faq_subject"  placeholder="제목">     
      </div>
      <div class="form-group">
        <textarea class="form-control" name="faq_content" rows="10" placeholder="내용"></textarea>      
      </div>
																						
      <div class="form-group text-center mt-5">
        <input type="button" id="faqbtn" value="글쓰기" class="btn btn-primary py-3 px-5">
        <a href="./list.do" class="btn btn-secondary py-3 px-5">목록</a>
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
		document.getElementById('faqbtn').onclick = function() { 
			if(document.faqfrm.faq_subject.value.trim() == '') { 
				alert('제목을 입력하셔야 합니다.');
				return false;
			}
			if(document.faqfrm.faq_content.value.trim() == '') { 
				alert('내용을 입력하셔야 합니다.');
				return false;
			}
			
			// 위의 검사가 다 끝나면 submit해서 다음 페이지로 넘어가라는 의미
			document.faqfrm.submit();
		};
	}
	
</script>

</body>
</html>