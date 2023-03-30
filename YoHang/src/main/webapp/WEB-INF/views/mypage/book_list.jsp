<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.example.model.BookInfoTO"%>
<%@page import="com.example.model.QnABoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.model.BookTO"%>

<%
	//jsp hero parameters
	String menuName = "마이페이지";
	String title = "마이페이지";
	
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

<!-- content -->
<section class="ftco-section">
  <div class="container">
  	<div class="col heading-section text-center mb-5 pb-5">
      <h2>내 예약</h2>
    </div>
    <div class="row toolbar-board-group">
      <div class="col-md-6 d-flex align-items-center board-page-info">
        <%--<span class="total-page">전체 <b><%= totalRecord %>건</b> </span>  --%>
        <%-- <span class="current-page">현재 페이지 <b><%= cpage %></b>/<b><%= totalPage %></b></span> --%>
      </div>
      
      <div class="col-md-6 board-search-box">
        <div class="form-row">
        <!--
          <div class="col-4">
            <select class="form-control">
              <option>제목</option>
              <option>내용</option>
            </select>
          </div>
           
          <div class="col-6">
            <input type="text" class="form-control">
          </div>
          <div class="col-2">
            <input type="submit" class="btn btn-primary btn-lg" value="검색">
          </div>
           -->
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col">
        <div class="table-responsive">
          <table class="table table-board-list">
            <caption class="sr-only">게시판글</caption>
            <colgroup>
              <col style="width:5%;">
              <col style="width:5%;">
              <col style="width:5%;"> 
              <col style="width:15%;">  
              <col style="width:15%;">  
              <col style="width:20%;">  
              <col style="width:10%;">  
              <col style="width:10%;">  
              <col style="width:10%;">  
            </colgroup>
            <thead>
              <tr>
                <th>예약번호</th>
                <!--<th class="text-center">예약자</th>  -->
                <th>객실타입</th>
                <th>객실번호</th>
                <th>체크인</th>
                <th>체크아웃</th>
                <th>예약일</th>
                <th>금액</th>
                <th>예약취소</th>
                <th>결제하기</th>
              </tr>
            </thead>
            <tbody id="booklist">
              <!-- <tr>  -->
		 

<%-- <%= html.toString() %> --%>
             
            </tbody>	 
          </table>
        </div>
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

<!-- jQuery
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 -->
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	bookList();
});

const bookList = function() {
	$.ajax({
		url : "loadBookList.do",
		type : "post",
		success : function(resData) {
			
			let bookInfos = resData.bookInfos;
			
			let html = '';
			
			$.each(bookInfos, function(index, item) {
				
				let checkin = item.checkin.substring(0, 10);
				let checkout = item.checkout.substring(0, 10);
				
				// 숙박하는 일 수 : 날짜 연산!
				let cin = new Date(checkin);
				let cout = new Date(checkout);
				
				let diffDate = cout.getTime() - cin.getTime();
				
				let checkedDates = Math.abs(diffDate / (1000 * 60 * 60 * 24));
				
				//let cin = checkin.replaceAll('-', '');
				//let cout = checkout.replaceAll('-', '');
				
				//let checkedDates = cout - cin;
				
				let room_type = '';
				
				let room;
				let rooms = [];
				let count;
				
				if(item.rooms_seq.indexOf(',') != -1) {
					rooms = item.rooms_seq.split(',');
					room = parseInt(rooms[0]);
					count = rooms.length;
				} else {
					room = parseInt(item.rooms_seq);
					count = 1;
				}
				
				if(room >= 1 && room <=10) {
					room_type = 'standard';
				} else if(room >= 11 && room <= 20) {
					room_type = 'deluxe';
				} else if(room >= 21 && room <= 30) {
					room_type = 'suite';
				}
				
				// standard = 10 / deluxe = 20 / suite = 30원으로 임의설정
				// 숙박금액 = 객실타입별 금액 * 선택한 객실 갯수 * 숙박 일 수
				let amount = 0;
				
				if(room_type == 'standard') {
					amount = 10 * count * checkedDates;
				} else if(room_type == 'deluxe') {
					amount = 20 * count * checkedDates;
				} else if(room_type == 'suite') {
					amount = 30 * count * checkedDates;
				}
				
				html += '<tr>';
				html += '<td id="bookSeq">' + item.seq + '</td>';
				html += '<td id="room_type">' + room_type + '</td>';
				html += '<td id="rooms_seq">' + item.rooms_seq + '</td>';
				html += '<td>' + checkin + '</td>';
				html += '<td>' + checkout + '</td>';
				html += '<td>' + item.date + '</td>';
				html += '<td id="amount">' + amount + '</td>';
				
				
				if(item.status == 1) {
					html += '<td><button type="button" onclick="location.href=\'./bookDeleteOk.do?seq=' + item.seq + '&rooms_seq=' + item.rooms_seq + '&checkin=' + checkin + '&checkout=' + checkout + '\'" class="btn btn-secondary">예약취소</button></td>';
				} else {
					html += "<td></td>";
				}
				
				if(item.status == 1) {
					html += '<td><button type="button" class="btn btn-primary" id="pay' + item.seq + '" onclick="requestPay(' + item.seq + ')">결제하기</button></td>';
				} else if(item.status == 2) {
					html += '<td><button type="button" class="btn btn-warning" id="refund' + item.seq + '" onclick="refundReq(' + item.seq + ')">환불신청</button></td>';
				} else if(item.status == 3) {
					html += '<td><font size="3">환불신청 중</font></td>';
				} else if(item.status == 4) {
					html += '<td><font size="3">환불완료</font></td>';
				}
			
				html += '</tr>';
			})
			
			$('#booklist').html(html);
			
		}, 
		error : function(err) {
			alert('에러 : ' + err.status);
		}
	})
}

function refundReq(seq) {
	
	let bookSeq = $('#refund' + seq).parent().siblings('#bookSeq').text();
	
	 $.ajax({
     	url : "/mypage/refundReq.do",
     	method : "post",
     	data : {
     		seq : bookSeq
     	},
     	success : function(data) {
     		alert('환불신청 성공');
     		
     		bookList();
     	},
     	error : function(err) {
     		console.log('에러 : ' + err.status);
     	}
     })
}


const IMP = window.IMP; // 생략 가능
IMP.init("imp38007386"); // 예: imp00000000a

function requestPay(seq) {
	
	let amount = $('#pay' + seq).parent().prev().prev().text();
	//let amount = $('#amount').text();
	let room_type = $('#pay' + seq).parent().siblings('#room_type').text();
	let rooms_seq = $('#pay' + seq).parent().siblings('#rooms_seq').text();
	
	let bookSeq = $('#pay' + seq).parent().siblings('#bookSeq').text();
	
    IMP.request_pay({
        pg : 'html5_inicis.INIpayTest',
        pay_method : 'card',
        merchant_uid: room_type + rooms_seq + new Date().getTime(),
        name : room_type + " " + rooms_seq,
        amount : amount,
        buyer_email : '${loginMember.m_email}',
        buyer_name : '${loginMember.m_name}',
        buyer_tel : '${loginMember.m_phone}',
    }, function (rsp) { // callback
        if (rsp.success) {
            console.log(rsp);
            
            alert('결제성공');
            
            // 결제가 정상적으로 완료되면 bookInfo 테이블의 status 컬럼값을 2로 변경
            $.ajax({
            	url : "/mypage/updateStatus.do",
            	method : "post",
            	data : {
            		seq : bookSeq
            	}
            })
            
            // 결제성공하면 list가 다시 출력되게 해야 함
            bookList();
            
        } else {
            console.log(rsp);
        }
    });
}

</script>

</body>
</html>