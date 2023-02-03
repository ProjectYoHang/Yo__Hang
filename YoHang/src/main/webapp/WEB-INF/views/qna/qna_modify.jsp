<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="com.example.model.QnABoardTO"%>

<%
	QnABoardTO to = (QnABoardTO)request.getAttribute("to");	
	
	String cpage = (String)request.getAttribute("cpage");

	String qna_seq = (String)request.getAttribute("qna_seq");

	String qna_subject = to.getQna_subject();
	String qna_id = to.getQna_id();
	String qna_content = to.getQna_content();

%>

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>

<body>
<!--
// header --------------------------------------->
<jsp:include page="../common/header.jsp" flush="false"/>

<!--
// contents --------------------------------------->

<!-- hero-wrap -->
<jsp:include page="../common/hero.jsp" flush="false"/>

<!-- content -->
<section class="ftco-section bg-light">
  <div class="container">
    <form action="./modify_ok.do" class="bg-white p-5" name="mfrm">
    <input type="hidden" name="qna_seq" value="<%= qna_seq %>">
    <input type="hidden" name="cpage" value="<%= cpage %>">
      <div class="form-group">
        <input type="text" class="form-control" name="qna_subject" title="Title" value="<%= qna_subject %>">
      </div>
      <div class="form-group">
        <input type="password" class="form-control" name="qna_pw" title="Password" placeholder="글 비밀번호를 입력해주세요.">
      </div>
      <div class="form-group">
        <input type="text" class="form-control" name="qna_id" title="Title" value="<%= qna_id %>" readonly>
      </div>
      <div class="form-group">
        <textarea type="text" class="form-control"  name="qna_content" title="content" rows="10"><%= qna_content %></textarea>
      </div>
<!-- 
      <div class="form-group">
        <input type="file" id="file" name="file" class="form-control">
      </div>
-->
      <div class="form-group text-center mt-5">
        <input type="button" id="mbtn" value="수정" class="btn btn-primary py-3 px-5">
        <a href="./view.do?cpage=<%= cpage %>&qna_seq=<%= qna_seq %>" class="btn btn-secondary py-3 px-5">보기</a>
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
			document.getElementById('mbtn').onclick = function() {
				if(document.mfrm.qna_pw.value.trim() == '') {
					alert('비밀번호를 입력해야 합니다.');
					return false;
				}
				if(document.mfrm.qna_subject.value.trim() == '') {
					alert('제목을 입력해야 합니다.');
					return false;
				}
				if(document.mfrm.qna_content.value.trim() == '') {
					alert('내용을 입력해야 합니다.');
					return false;
				}
				document.mfrm.submit();
			}
		}
	
</script>


</body>
</html>


