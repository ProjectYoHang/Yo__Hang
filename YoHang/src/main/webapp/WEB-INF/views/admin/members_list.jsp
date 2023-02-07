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


<!-- content -->
<section class="ftco-section bg-light">
  <div class="container">
    <div class="row" id="board" >
      
    </div>
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

$(document).ready(function(){
	memberList();
});


const memberDelete = function( m_id ) {
	$.ajax({
		url  : "memberDelete.do",
		type : "post",
		data :  {
			m_id : m_id.trim()
		},
		success : function( resData ) {
			
			console.log( ' 회원삭제 성공' );
			memberList();
				
		},
		error: function( err ) {
			alert( '에러 ' + err.status);
		}
	});
}

const memberList = function() {
	$.ajax({
		url : "loadList.do",
		type : "post",
		success : function ( resData ) {
			let html = '<table border="1" >';
			$.each( resData, function ( index, item ) {
				console.log( item.m_id );
				
				html +=  '<tr>';
				html += 	'<td>' + item.m_id + '</td>';
				html += 	'<td>' + item.m_name + '</td>';
				html += 	'<td>' + item.m_email + '</td>';
				html += 	'<td>' + item.m_join_date + '</td>';
				html += 	'<td><button onclick="memberDelete(\''+ item.m_id +'\');" >삭제</button> </td>';
				html += 	'<td><button m_id="' + item.m_id + '" action="delete" class="action">메일 전송</button> </td>';
				html += '</tr>';
			});
			html += '</table>';
			$('#board').html(html);
		},
		error: function( err ) {
			alert( '에러 ' + err.status);
			
		}
	});	
}

</script>

</body>
</html>