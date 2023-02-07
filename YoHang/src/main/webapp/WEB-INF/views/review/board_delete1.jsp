<%@page import="com.example.model.RvBoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	RvBoardTO to = (RvBoardTO)request.getAttribute("to");		
	//String cpage = (String)request.getAttribute("cpage");
	int cpage = Integer.parseInt((String)request.getAttribute("cpage"));
	String rv_seq = (String)request.getAttribute("rv_seq");
	String rv_subject = to.getRv_subject();
	String rv_id = to.getRv_id();
%>

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>
<body>
<!-- 
// header --------------------------------------->
<jsp:include page="../common/header.jsp" flush="false"/>

<!-- hero-wrap -->
<jsp:include page="../common/hero.jsp" flush="false"/>

<!--
// contents --------------------------------------->

<!-- content -->
<section class="ftco-section bg-light">
  <div class="container">
    <form action="./delete_ok.do" class="bg-white p-5" name="dfrm">
    <input type="hidden" name="rv_seq" value="<%= rv_seq %>" />
      <div class="form-group">
        <input type="text" class="form-control" name="rv_id" title="Title" value="<%= rv_id %>" readonly>
      </div>
      <div class="form-group">
        <input type="text" class="form-control" name="qna_subject" title="Title" value="<%= rv_subject %>" readonly>
      </div>

<!-- 
      <div class="form-group">
        <input type="file" id="file" name="file" class="form-control">
      </div>
-->
      <div class="form-group text-center mt-5">
        <input type="button" id="dbtn" value="삭제" class="btn btn-primary py-3 px-5">
        <a href="./view.do?cpage=<%= cpage %>&rv_seq=<%= rv_seq %>" class="btn btn-secondary py-3 px-5">보기</a>
        <a href="./list.do?cpage=<%= cpage %>" class="btn btn-primary btn-lg">목록</a>
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

<script type = "text/javascript">
window.onload = function() {
	// dbtn이 클릭되면 알림창이 뜸
	document.getElementById('dbtn').onclick = function() {
		// alert('click');		
		
		document.dfrm.submit();
	}
}
</script>

</body>
</html>

