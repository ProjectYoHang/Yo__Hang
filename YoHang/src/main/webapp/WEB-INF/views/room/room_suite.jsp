<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.example.model.RoomTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.stream.IntStream"%>
<%@page import="java.util.Arrays"%>

<%
	// include한 jsp에 필요한 parameters
	String menuName = "객실";
	String title = "SUITE";
	
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

<%
	ArrayList<RoomTO> bookedRoomNums = (ArrayList)request.getAttribute("bookedRoomNums");

	String checkin_date = request.getParameter("checkin_date");
	String checkout_date = request.getParameter("checkout_date");
	String head_count = (String)request.getParameter("head_count");
	
	int[] bookedRoomNum = new int[30];
	
	for(int i = 0; i< bookedRoomNums.size(); i++) {
		bookedRoomNum[i] = Integer.parseInt(bookedRoomNums.get(i).getRoom_seq());
	}
	
%>

<%! public static int i = 0; %>	

<% 	
	StringBuilder html = new StringBuilder();

	for(i = 21; i<=30; i++) {
		
		if(i==21 || i%5==1) {
			html.append("<div>");
		}
		
		html.append("<div class='form-check form-check-inline'>");
		
		if(IntStream.of(bookedRoomNum).anyMatch(x -> x == i)) {
			html.append("<input style='width:17px;height:17px;' class='form-check-input' type='checkbox' name='room_seq' id='id"+ i + "' value=" + i + " disabled>");
			html.append("<label style='width:20px' class='form-check-label' for='inlineCheckbox1'><font size='3'>" + i + "</font></label>");
		} else {
			html.append("<input style='width:17px;height:17px;' class='form-check-input' type='checkbox' name='room_seq' id='id"+ i + "' value=" + i + ">");
			html.append("<label style='width:20px' class='form-check-label' for='inlineCheckbox1'><font size='3'>" + i + "</font></label>");
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
            <h2 class="mb-4">Suite room</h2>
            <div class="single-slider owl-carousel">
              <div class="item">
                <div class="room-img" style="background-image: url(../../../YoHangFront/build/images/room-2.jpg);"></div>
              </div>
              <div class="item">
                <div class="room-img" style="background-image: url(../../../YoHangFront/build/images/room-6.jpg);"></div>
              </div>
            </div>
          </div>
          <div class="col-md-12 room-single mt-4 mb-5 ftco-animate">
			<p>스위트룸은 남부 프랑스의 휴양 리조트를 연상시키는 객실로 여유있는 침실을 제공해 편안한 휴식을 만끽할 수 있습니다. 객실은 21호실부터 30호실까지 제공하고 있습니다.</p>
            <p>스위트룸은 4층에 위치하고 있으며 푸른 바다의 전망을 즐길 수 있습니다. 침실과 욕실이 분리되어있으며 벽지, 카페트 등에 전체적으로 화이트, 제이드 그린, 블루 톤을 사용했으며, 클래식한 화장대로 스위트의 우아한 느낌을 더욱 살렸습니다.</p>            		
            <div class="d-md-flex mt-5 mb-5">
              <ul class="list">
                <li><span>1박 가격 :</span> 540000원</li>
                <li><span>최대 수용인원 :</span> 4명</li>
              </ul>
              <ul class="list ml-md-5">
              	<li><span>위치 :</span> 4층</li>
              	<li><span>객실 크기 :</span> 50 m²</li>
              </ul>
              <ul class="list ml-md-5">
                <li><span>침대 수 :</span> 2</li>
                <li><span>침대 크기 :</span> twin</li>
              </ul>
              <ul class="list ml-md-5">
                <li><span>전망 :</span> sea view</li>
                <li><span>룸 구성 :</span> 침실 1, 욕실 2</li>
              </ul>
            </div>
          </div>
         </div>
       </div>
      <div class="col-lg-4 sidebar ftco-animate">
        <div class="sidebar-box">
        	<br><br>
        	<div style="border:1px solid white" class="">
	       		<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="#8d703b" class="bi bi-check-lg" viewBox="0 -3 16 16">
				<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
				</svg>  <font size="5px" color="black">객실번호 선택</font><br>
				
				<div class="ml-4 my-3">
					<form action="./book_ok.do" method="post" name="rooms">
					
						<input type="hidden" name="m_id" value="${loginMember.m_id}"  />
						<input type="hidden" name="checkin_date" value="<%= checkin_date %>" />
						<input type="hidden" name="checkout_date" value="<%= checkout_date %>" />
						<input type="hidden" name="book_rooms" value="1" />
						<input type="hidden" name="book_head_count" value="<%= head_count %>" />
						<input type="hidden" name="book_cs_type" value="<%= head_count %>/0" />
					
						<%= html.toString() %>			
						 <br><br>
		            	<input class="btn btn-primary" style="float:center;" type="button" value="예약하기" id="bookbtn" />
					</form>
				</div>
        	</div>
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
	let username = '${loginMember.m_id}';
	
	ws = new WebSocket("ws://" + location.host + "/room/suite");
	
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
		
		if($(this).is(':checked')) {
			let checked = '{"username": "' + username + '" ,"checked" : ' + $(this).val() + ' }';
			ws.send(checked);
		} else {
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
			
			if(<%= checkin_date %> == null) {
				alert('홈에서 체크인 날짜를 선택해주세요.');
				location.href='/home.do';
				return false;
			} else if(<%= checkout_date %> == null) {
				alert('홈에서 체크아웃 날짜를 선택해주세요.');
				location.href='/home.do';
				return false;
			}
			
			document.rooms.submit();
		}
	})
	
})


</script>


</body>
</html>