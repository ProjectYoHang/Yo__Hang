<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>
<body>
<!-- 
// header --------------------------------------->
<jsp:include page="../common/header.jsp" flush="false"/>

<!-- hero-wrap -->
<jsp:include page="../common/hero.jsp" flush="false"/>

<section class="ftco-section bg-light">
  <div class="container">
    <form action="./write_ok.do"  name="wfrm" enctype="multipart/form-data">
      <div class="form-group">
        <input type="text" class="form-control" name="rv_id" title="글쓴이" placeholder="글쓴이">     
      </div>
      <div class="form-group">
        <input type="text" class="form-control" name="rv_subject" placeholder="제목">
      </div>      
      <div class="form-group">
        <textarea type="text" class="form-control"  name="rv_content" placeholder="내용" rows="10"></textarea>
      </div>
      <div class="form-group">
        <input type="text" class="form-control" name="rv_room_seq" placeholder="방번호">
      </div>
      <div class="form-group">
        <input type="text" class="form-control" name="rv_room_num"placeholder="예약번호">
      </div>
      <div class="form-group">
        <input type="text" class="form-control" name="rv_stars" placeholder="별점">
      </div>    
      <div class="form-group">
        <input type="text" class="form-control" name="rv_like" placeholder="좋아요">
      </div>                            
	<tr>
		<th>이미지 선택</th>
		<td colspan="3">
			<!-- 파일 업로드 input type=file -->
			<input type="file" name="upload" value="" class="board_view_input" /><br /><br />
		</td>
	</tr>	
		
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
        <a href="/static/images/insta-1.jpg" class="insta-img image-popup" style="background-image: url(/static/images/insta-1.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="/static/images/insta-2.jpg" class="insta-img image-popup" style="background-image: url(/static/images/insta-2.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="/static/images/insta-3.jpg" class="insta-img image-popup" style="background-image: url(/static/images/insta-3.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="/static/images/insta-4.jpg" class="insta-img image-popup" style="background-image: url(/static/images/insta-4.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="/static/images/insta-5.jpg" class="insta-img image-popup" style="background-image: url(/static/images/insta-5.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
    </div>
  </div>
</section>


<!-- 하단 디자인 -->
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