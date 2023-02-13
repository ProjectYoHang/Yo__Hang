<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>

<%@page import="com.example.model.RoomTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.stream.IntStream"%>
<%@page import="java.util.Arrays"%>

<%
	// include한 jsp에 필요한 parameters
	String menuName = "객실";
	String title = "STANDARD";
	
	String home = "/home.do";
	String aboutus = "/aboutus.do";
	String findus = "/findus.do";
	String qna = "/qna/list.do";
	String faq = "/faq/list.do";
	String notice = "/notice/list.do";
	String login = "/login.do";
	String logout = "/logout.do";
	String mypage = "/mypage";
%>

<%
	// STANDARD 객실 타입에 대한 페이지
	ArrayList<RoomTO> bookedRoomNums = (ArrayList)request.getAttribute("bookedRoomNums");

	// home의 검색바에서 전송되어야할 데이터들
	String checkin_date = (String)request.getAttribute("checkin_date");
	String checkout_date = (String)request.getAttribute("checkout_date");

	

	int[] bookedRoomNum = new int[30];
	
	for(int i = 0; i< bookedRoomNums.size(); i++) {
		bookedRoomNum[i] = Integer.parseInt(bookedRoomNums.get(i).getRoom_seq());
	}
	
	//System.out.println(IntStream.of(bookedRoomNum).anyMatch(x -> x==1));
%>

<%! public static int i = 0; %>	

<% 	
	StringBuilder html = new StringBuilder();

	for(i = 1; i<=10; i++) {
		
		if(i==1 || i%5==1) {
			html.append("<div>");
		}
		
		html.append("<div class='form-check form-check-inline'>");
		
		// IntStream.of(배열명).anyMatch(x -> x == 값) : 배열 안에 특정 값이 있는지 여부를 반환
		// 반드시 값에 해당하는 부분이 final / static 으로 선언되어있어야 하므로 위에 선언해놓음
		if(IntStream.of(bookedRoomNum).anyMatch(x -> x == i)) {
			html.append("<input class='form-check-input' type='checkbox' name='room_seq' id='id"+ i + "' value=" + i + " disabled>");
			html.append("<label class='form-check-label' for='inlineCheckbox1'>" + i + "</label>");
		} else {
			html.append("<input class='form-check-input' type='checkbox' name='room_seq' id='id"+ i + "' value=" + i + ">");
			html.append("<label class='form-check-label' for='inlineCheckbox1'>" + i + "</label>");
		}
		html.append("</div>");
	}


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
    <div class="row">
    <!-- 우측 요소들 주석처리하니까 왼쪽에 치우쳐져있길래 그냥 col 전체 설정함 -->
      <div class="col-lg-8">
      <!-- <div class="col"> -->
        <div class="row">
          <div class="col-md-12 ftco-animate">
            <h2 class="mb-4">Standard room</h2>
            <div class="single-slider owl-carousel">
              <div class="item">
                <div class="room-img" style="background-image: url(../../../YoHangFront/build/images/room-1.jpg);"></div>
              </div>
              <div class="item">
                <div class="room-img" style="background-image: url(../../../YoHangFront/build/images/room-2.jpg);"></div>
              </div>
              <div class="item">
                <div class="room-img" style="background-image: url(../../../YoHangFront/build/images/room-3.jpg);"></div>
              </div>
            </div>
          </div>
          <div class="col-md-12 room-single mt-4 mb-5 ftco-animate">
            <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
            <div class="d-md-flex mt-5 mb-5">
              <ul class="list">
                <li><span>Max:</span> 2 Persons</li>
                <li><span>Size:</span> 45 m2</li>
              </ul>
              <ul class="list ml-md-5">
                <li><span>View:</span> Sea View</li>
                <li><span>Bed:</span> 1</li>
              </ul>
            </div>
            <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
          </div>
         </div>
       </div>
      <div class="col-lg-4 sidebar ftco-animate">
        <div class="sidebar-box bg-light">
        	<객실번호 선택>
			<form action="./book_ok.do" method="post" name="rooms">
			
				<input type="hidden" name="m_id" value="${loginMember.m_id}"  />
				<input type="hidden" name="checkin_date" value="<%= checkin_date %>" />
				<input type="hidden" name="checkout_date" value="<%= checkout_date %>" />
				<input type="hidden" name="book_rooms" value="1" />
				<input type="hidden" name="book_head_count" value="2" />
				<input type="hidden" name="book_cs_type" value="1/1" />
			
<%= html.toString() %>			
				
				 <br><br>
            	<input style="float:center;" type="button" value="예약하기" id="bookbtn" /> 
           
			</form>
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

<script type="text/javascript">
$(document).ready(function() {
	//let data = {};//전송 데이터(JSON)
	
	// 세션에 저장되어있는 로그인한 사용자 아이디
	let username = '${loginMember.m_id}';
	
	ws = new WebSocket("ws://" + location.host + "/room/standard");
	
	ws.onmessage = function(msg){
		let data = JSON.parse(msg.data);
		
		let username = '${loginMember.m_id}';
	
		let roomNum = "";
		if(data.hasOwnProperty('checked') == true) {
			roomNum = data.checked;
			
			$('#id'+roomNum).prop('disabled', true);
		} else if(data.hasOwnProperty('unchecked') == true) {
			roomNum = data.unchecked;
			
			$('#id'+roomNum).prop('disabled', false);
		}
		
	}
	
	$('.form-check-input').change(function() {
		
		let username = '${loginMember.m_id}';
		
		// 데이터를 체크상태와 아닌 상태의 데이터를 구분하기 위해 데이터를 json형태로 만들어서 서버에 보냄
		if($(this).is(':checked')) {
			let checked = '{"username": "' + username + '" ,"checked" : ' + $(this).val() + ' }';
			ws.send(checked);
		} else {
			// unchecked에도 checked가 포함되어있으므로 unchecked라고 보내면 websocketbook.java에서 브라우저로부터 전송받은 데이터를 구분할 수 없음
			let unchecked = '{"username": "' + username + '" ,"unchecked" : ' + $(this).val() + ' }';
			ws.send(unchecked);
		}
	})
	
	$('#bookbtn').on('click', function() {
		
		let checked = $('.form-check-input:checked').length;
		
		if(${loginMember == null}) {
			alert('로그인하셔야 합니다.');
			window.location.href = '<%= login %>';
			
		} else if(${loginMember != null}) {
			if(checked == 0) {
				alert('객실을 선택해주세요.');
				return false;
			}
			
			document.rooms.submit();
		}		
	})
})


</script>


</body>
</html>