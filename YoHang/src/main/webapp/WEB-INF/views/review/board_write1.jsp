<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>

<body>
<!--
// header --------------------------------------->

<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>
<body>
<!--
// header --------------------------------------->
<!-- header.jsp 참조 코드 있던 자리 -->

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
			<li class="nav-item"><a href="/home.do" class="nav-link" onclick="location.href='./logout.do'">Logout</a></li>
		</c:if>
        
      </ul>
    </div>
  </div>
</nav>

<!-- hero-wrap -->
<jsp:include page="../common/hero.jsp" flush="false"/>

<!-- content -->
<section class="ftco-section bg-light">
  <div class="container">
    <form action="./write_ok.do" class="bg-white p-5" name="wfrm">
      <div class="form-group">
      	<!-- 아이디는 로그인상태에서 받아서 placeholder 속성값으로 넣어줘야 함 / value 속성은 로그인상태 처리되면 필요없음 -->
      <input type="text" class="form-control" name="rv_id" title="Title" value="test1234" readonly>
      </div>   
      <div class="form-group">
        <input type="text" class="form-control" name="qna_subject" title="Title" placeholder="제목을 입력해주세요.">
      </div>
      <div class="form-group">
        <textarea type="text" class="form-control"  name="rv_content" title="content" placeholder="내용을 입력해주세요." rows="10"></textarea>
      </div>
		<tr>
			<th>이미지</th>
			<td colspan="3">
			<!-- 파일 업로드 input type=file -->
				<input type="file" name="upload" value="" class="board_view_input" /><br /><br />
			</td>
		</tr>             
		<tr>
			<th>방번호</th>
			<td><textarea name="rv_room_seq" class="board_editor_area"></textarea></td>
		</tr>
		<tr>
			<th>예약번호</th>
			<td><textarea name="rv_book_num" class="board_editor_area"></textarea></td>
		</tr>
		<tr>
			<th>별점</th>
			<td><textarea name="rv_stars" class="board_editor_area"></textarea></td>
		</tr>
		<tr>
			<th>좋아요</th>
			<td><textarea name="rv_like" class="board_editor_area"></textarea></td>
		</tr>	
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
			// alert('click');
			// 필수 입력항목 검사
			if(document.wfrm.info.checked == false) {
				alert('동의하셔야 합니다.');
				return false;
			}
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