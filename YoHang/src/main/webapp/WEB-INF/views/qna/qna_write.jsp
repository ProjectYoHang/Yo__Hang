<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	String mypage = "/mypage";
%>

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>

<body>
<!--
// header --------------------------------------->

<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
<section class="ftco-section bg-light">
  <div class="container">
    <form action="./write_ok.do" class="bg-white p-5" name="wfrm">
      <div class="form-group">
        <input type="text" class="form-control" name="qna_subject" title="Title" placeholder="제목을 입력해주세요.">
      </div>
      <div class="form-group">
        <input type="password" class="form-control" name="qna_pw" title="Password" placeholder="글 비밀번호를 입력해주세요.">
      </div>
      <div class="form-group">
      	<!-- 아이디는 로그인상태에서 받아서 placeholder 속성값으로 넣어줘야 함 / value 속성은 로그인상태 처리되면 필요없음 -->
        <!-- <input type="text" class="form-control" name="qna_id" title="Title" value="test1234" readonly> -->
        <input type="text" class="form-control" name="qna_id" title="Title" value="${loginMember.m_id}" readonly>
      </div>
      <div class="form-group">
        <textarea type="text" class="form-control"  name="qna_content" title="content" placeholder="내용을 입력해주세요." rows="10"></textarea>
      </div>
<!-- 
      <div class="form-group">
        <input type="file" id="file" name="file" class="form-control">
      </div>
-->
      <div class="form-group text-center mt-5">
        <input type="button" id="wbtn" value="글쓰기" class="btn btn-primary py-3 px-5">
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
		document.getElementById('wbtn').onclick = function() { 
			if(document.wfrm.qna_subject.value.trim() == '') { 
				alert('제목을 입력하셔야 합니다.');
				return false;
			}
			if(document.wfrm.qna_pw.value.trim() == '') { 
				alert('비밀번호를 입력하셔야 합니다.');
				return false;
			}
			if(document.wfrm.qna_content.value.trim() == '') { 
				alert('내용을 입력하셔야 합니다.');
				return false;
			}
			document.wfrm.submit();
		};
	}
	
</script>

</body>
</html>
