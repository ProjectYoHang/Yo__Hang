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

<!-- 메일창 ( 모달 ) -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg" >
	  	<div class="modal-content">
	  		<form action="/sendMail.do" method="post">
	  			<div class="mb-3" style="padding: 10px;" >
				  <label for="email" class="form-label">메일주소</label>
				  <input type="email" class="form-control" name="email" id="mail" placeholder="name@example.com">
				</div>
				<div class="mb-3" style="padding: 10px;" >
				  <label for="title" class="form-label">제목</label>
				  <input  class="form-control"  name="title" placeholder="제목을 입력하세요">
				</div>
				<div class="mb-3" style="padding: 10px;">
				  <label for="content" class="form-label">내용</label>
				  <textarea class="form-control"  name="content" id="content" rows="3"></textarea>
				</div>
				<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			        <button type="submit" class="btn btn-primary">전송</button>
	      		</div>
	  		</form>
	     </div>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

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

const memberList = function( pageNum ) {
	$.ajax({
		url : "loadList.do",
		type : "post",
		data : {
			'cpage' : pageNum 
		},
		success : function ( resData ) {
			
			let memberList = resData.memberList;
			let cpage = resData.cpage;
			let recordPerPage = resData.recordPerPage;
			let startPageNum = resData.startPageNum;
			let lastPage = resData.lastPage;
			let lastPageNum = resData.lastPageNum;
			let totalRecord = resData.totalRecord;
			let totalPage = resData.totalPage;
			let blockPerPage = resData.blockPerPage;
			
			//let offset = $('#board').offset()
			//$('html').animate({scrollTop : offset.top}, 400);
			$('html').scrollTop(0);
			//$('html').animate({scrollTop : 0}, 200)
			let html = '<table class="table table-board-list" >';
			html += '<thead>';
			html += '<tr>';
			html += '<th>아이디</th>';
			html += '<th class="text-center">이름</th>';
			html += '<th>메일</th>';
			html += '<th>가입일</th>';
			html += '<th>메일 발송</th>';
			html += '<th>삭제</th>';
			html += '</tr>';
			html += '</thead>';
			
			$.each( memberList, function ( index, item ) {
				html += '<tr>';
				html += 	'<td>' + item.m_id + '</td>';
				html += 	'<td>' + item.m_name + '</td>';
				html += 	'<td>' + item.m_email + '</td>';
				html += 	'<td>' + item.m_join_date + '</td>';
				html += 	'<td><button type="button" onclick="mailBtn('+index+')" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">메일 보내기</button></td>';
				html += 	'<td><button  onclick="memberDelete(\''+ item.m_id +'\');" class="btn" >회원 삭제</button> </td>';
				html +=    '<td><input type="hidden" id="btn'+index+'" value="'+item.m_email+'" >';
				html += '</tr>';
			});
			html += '</table>';
			
			html += '<nav class="w-100">';
			html += '<ul class="pagination justify-content-center">';
			
			// if (총 페이지 수 > 0) {
			if( lastPageNum >= totalPage ) {
				lastPageNum = totalPage;				
			}
            
			/// 이전 5페이지 넘기
        	if(startPageNum == 1) {
        		html += '<li class="page-item disabled first"><a class="page-link"><i class="xi-angle-left-min" aria-hidden="true"></i></a></li>';
        	} else {
        		html += '<li class="page-item first"><a class="page-link" onclick="memberList(' + (startPageNum - blockPerPage ) + ')"><i class="xi-angle-left-min" aria-hidden="true"></i></a></li>';
        	}
        	/// 이전페이지로 
        	if(cpage == 1) {
        		html +='<li class="page-item disabled prev"><a class="page-link"><i class="xi-angle-left-min" aria-hidden="true"></i></a></li>';
        	} else {
        		html += '<li class="page-item prev"><a class="page-link" onclick="memberList(' + (cpage - 1) +')  "><i class="xi-angle-left-min" aria-hidden="true"></i></a></li>'
        	}
            
            for(let i=startPageNum ; i <= lastPageNum; i++) {
                if (i == cpage) {
                    html += '<li class="page-item active"><a class="page-link">' + i + '</a></li>';
                }
                else {
                   html += '<li class="page-item"><a class="page-link" onclick="memberList(' + i + ')" >' + i + '</a></li>';
                }
            }
            
            // 다음 페이지 
        	if(cpage == totalPage) {
        		html += '<li class="page-item disabled next"><a class="page-link"><i class="xi-angle-right-min" aria-hidden="true"></i></a></li>'
        	} else {
        		html +='<li class="page-item next"><a class="page-link" onclick="memberList(' + ( cpage + 1 ) + ')"><i class="xi-angle-right-min" aria-hidden="true"></i></a></li>'
        	}
        	// 다음 5페이지 넘기기
        	if( cpage == totalPage) {
        		html += '<li class="page-item disabled last"><a class="page-link"><i class="xi-angle-right-min" aria-hidden="true"></i></a></li>'
        	}else {
        		html += '<li class="page-item last"><a class="page-link" onclick="memberList('+ (blockPerPage + 1) +')"><i class="xi-angle-right-min" aria-hidden="true"></i></a></li>'
        	}
 				html += '	</nav>';
				html += '</ul>';
			$('#board').html(html);
			
		},
		error: function( err ) {
			alert( '에러 ' + err.status);
			
		}
	});	
}	
	const mailBtn = function(idx){
		let mail = $('#btn' + idx).val();
		$('#mail').val(mail);
	} 
</script>
</body>
</html>