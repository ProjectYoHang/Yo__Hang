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

<section class="ftco-section bg-light">
  <div class="container">
	<form action="./write_ok.do" method="post" name="wfrm" enctype="multipart/form-data">

      <div class="form-group">
        <input type="text" class="form-control" name="rv_id"  value="${loginMember.m_id}" readonly>     
      </div>
      <div class="form-group">
        <input type="text" class="form-control" name="rv_subject"  placeholder="제목">     
      </div>
      <div class="form-group">
        <textarea class="form-control" name="rv_content" rows="10" placeholder="내용"></textarea>      
      </div>
      <div class="form-group">
        <input type="hidden" class="form-control" name="rv_room_seq" value="2"  placeholder="방번호">     
      </div>
      <div class="form-group">
        <input type="hidden" class="form-control" name="rv_book_num" value="2"  placeholder="예약번호">     
      </div>
      <div class="form-group">
        <input type="hidden" class="form-control" name="rv_stars" value="2" placeholder="별점">     
      </div>
      <div class="form-group">
        <input type="hidden" class="form-control" name="rv_like" value="2" placeholder="좋아요">     
      </div> 	
				
		<th>이미지</th>
			<td colspan="3">
			<!-- 파일 업로드 input type=file -->
			<input type="file" name="upload" value="" class="board_view_input" /><br /><br />
		</td>
																						
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
			// alert('click');
			// 필수 입력항목 검사
			if(document.wfrm.rv_id.value.trim() == '') {
				alert('글쓴이를 입력하셔야 합니다.');
				return false;
			}
			if(document.wfrm.rv_subject.value.trim() == '') {
				alert('제목을 입력하셔야 합니다.');
				return false;
			}

			if( document.wfrm.upload.value.trim() != '' ) {
				
				const extension = document.wfrm.upload.value.split( '.' ).pop();
				if( extension != 'png' && extension != 'jpg' && extension != 'gif' && extension != 'PNG' && extension != 'JPG' && extension != 'GIF' ) {
					alert( '이미지 파일을 입력하셔야 합니다.' );	
					return false;
				}
			}
			
			// 위의 검사가 다 끝나면 submit해서 다음 페이지로 넘어가라는 의미
			document.wfrm.submit();
		};   
	}
	
</script>
</body>
</html>