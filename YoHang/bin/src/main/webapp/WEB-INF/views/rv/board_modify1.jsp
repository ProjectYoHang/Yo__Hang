<%@page import="com.example.model.RvBoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%
	//jsp hero parameters
	String menuName = "Board";
	String title = "Review";
	
	// jsp header parameters
	String home = "/home.do";
	String aboutus = "/aboutus.do";
	String findus = "/findus.do";
	String qna = "/qna/list.do";
	String faq = "/faq/list.do";
	String notice = "/notice/list.do";
	String rv = "/rv/list.do";
	String login = "/login.do";
	String logout = "/logout.do";
	String mypage = "/mypage";
	
	RvBoardTO to = (RvBoardTO)request.getAttribute("to");
	//int cpage = Integer.parseInt((String)request.getAttribute("cpage"));
	String cpage = (String)request.getAttribute("cpage");
	String rv_seq = (String)request.getAttribute("rv_seq");
	
	String rv_subject = to.getRv_subject();
	String rv_id = to.getRv_id();
	String rv_content = to.getRv_content();
	
	String rv_img_name = to.getRv_img_name();
	long rv_img_size = to.getRv_img_size();
%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>

<body>
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
    <form action="./modify_ok.do" class="bg-white p-5" name="mfrm" method="post" enctype="multipart/form-data">
    <input type="hidden" name="rv_seq" value="<%= rv_seq %>">
    <input type="hidden" name="cpage" value="<%= cpage %>">
      <div class="form-group">
        <input type="text" class="form-control" name="rv_id" title="Title" value="<%= rv_id %>">
      </div>
      <div class="form-group">
        <input type="text" class="form-control" name="rv_subject"  value="<%= rv_subject %>">
      </div>
      <div class="form-group">
        <textarea type="text" class="form-control"  name="rv_content"  rows="10"><%= rv_content %></textarea>
      </div>
	<tr>
		<th>기존 이미지파일명 : <%= rv_img_name %></th>
		<th>기존 이미지파일 크기 : <%= rv_img_size %></th>
	</tr>
	<tr>
		<th>이미지 선택</th>
		<td colspan="3">
			<!-- 파일 업로드 input type=file -->
			<input type="file" name="upload" value="" class="board_view_input" /><br /><br />
		</td>
	</tr>	
<!-- 
      <div class="form-group">
        <input type="file" id="file" name="file" class="form-control">
      </div>
-->
      <div class="form-group text-center mt-5">
        <input type="button" id="mbtn" value="수정" class="btn btn-primary py-3 px-5">
        <a href="./view.do?cpage=<%= cpage %>&rv_seq=<%= rv_seq %>" class="btn btn-secondary py-3 px-5">보기</a>
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
					if(document.mfrm.rv_content.value.trim() == '') {
						alert('내용을 입력해야 합니다.');
						return false;
					}
					if(document.mfrm.rv_subject.value.trim() == '') {
						alert('제목을 입력해야 합니다.');
						return false;
					}
					if( document.mfrm.upload.value.trim() != '' ) {
						
						const extension = document.mfrm.upload.value.split( '.' ).pop();
						if( extension != 'png' && extension != 'jpg' && extension != 'gif' && extension != 'PNG' && extension != 'JPG' && extension != 'GIF' ) {
							alert( '이미지 파일을 입력하셔야 합니다.' );	
							return false;
						}
					}
					document.mfrm.submit();
				}
			}
		
	</script>


</body>
</html>