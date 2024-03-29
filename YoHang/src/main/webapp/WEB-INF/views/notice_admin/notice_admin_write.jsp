﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//jsp hero parameters
	String menuName = "게시판 관리";
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
	<form action="./write_ok.do" method="post" name="nfrm" enctype="multipart/form-data">
      <div class="form-group">
        <input type="text" class="form-control" name="nt_id" value="${loginAdmin.admin_id}" readonly>     
      </div>
      <div class="form-group">
        <input type="text" class="form-control" name="nt_subject"  placeholder="제목">     
      </div>
      <div class="form-group">
        <textarea class="form-control" name="nt_content" rows="10" placeholder="내용"></textarea>      
      </div>
	
	  <div class="form-group">
		<input type="file" name="upload" id="nt_file" value="" class="board_view_input" oninput="checkFileSizeOne(event)">
	  </div>
																						
      <div class="form-group text-center mt-5">
        <input type="button" id="nbtn" value="글쓰기" class="btn btn-primary py-3 px-5">
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
		document.getElementById('nbtn').onclick = function() { 
			if(document.nfrm.nt_subject.value.trim() == '') { 
				alert('제목을 입력하셔야 합니다.');
				return false;
			}
			if(document.nfrm.nt_content.value.trim() == '') { 
				alert('내용을 입력하셔야 합니다.');
				return false;
			}
			
			if(document.nfrm.upload.value.trim() == '' ) {
				alert( '파일이름을 입력하셔야 합니다.' );
				return false;
			}
			/* else {
				// .으로 분리해서 ext의 첫번쨰 
				const ext = document.nfrm.upload.value.trim().split('.');
				alert(ext[1]); // 파일 확장자 확인 가능
			} */
			
			// 위의 검사가 다 끝나면 submit해서 다음 페이지로 넘어가라는 의미
			document.nfrm.submit();
		};
	}
	
	function checkFileSizeOne(e) {
		var checkSize = 1024 * 1024 * 10;
		
	    if (document.getElementById('nt_file').value != "") {
	        var checkSize = 1024 * 1024 * 10;
	        
	        if (!checkFileSize($('#nt_file'), checkSize)) {
	        	document.getElementById('nt_file').value = "";
	            return;	            
	        }
	    }else {
	    	alert(222);
	    }
	};
	
	// 파일 용량 체크
	function checkFileSize(obj, size) {
   		var check = false;
	    var sizeinbytes = obj[0].files[0].size;
	    var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
	    var i = 0;
	    var checkSize = size;
	    
	    while (checkSize > 900) {
	        checkSize /= 1024;
	        i++;	        
	    }
	    
	    checkSize = (Math.round(checkSize * 100) / 100) + ' ' + fSExt[i];
	    var fSize = sizeinbytes;
	    
	    if (fSize > size) {
	        alert("첨부파일은 " + checkSize + " 이하로 첨부 바랍니다.");
	        check = false;     
	    } else {
	        check = true;      
	    }    
	    return check;	    
	}
</script>

</body>
</html>