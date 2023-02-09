<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// include한 jsp에 필요한 parameters
	String menuName = "search";
	String title = "검색";
	
	String home = "/home.do";
	String aboutus = "/aboutus.do";
	String findus = "/findus.do";
	String qna = "/qna/list.do";
	String faq = "/faq/list.do";
	String notice = "/notice/list.do";
	String login = "/login.do";
	String logout = "/logout.do";
	String mypage = "/mypage/list.do";
	
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
<section class="ftco-section bg-light">
  <div class="container">
    <div class="row">
      
      <div id="book">
	<h1>WebSocket booking</h1>
	
		<div id="rooms">
			
				<div>
		  			<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="id1" value="1">
					  <label class="form-check-label" for="inlineCheckbox1">1</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="id2" value="2">
					  <label class="form-check-label" for="inlineCheckbox2">2</label>
					</div>
					<!-- 
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="id3" value="3" disabled>
					  <label class="form-check-label" for="inlineCheckbox3">3 (disabled</label>
					</div>
					 -->
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="id4" value="4">
					  <label class="form-check-label" for="inlineCheckbox1">4</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="id5" value="5">
					  <label class="form-check-label" for="inlineCheckbox2">5</label>
					</div>
				</div>
				<div>
		  			<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="id6" value="6">
					  <label class="form-check-label" for="inlineCheckbox1">6</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="id7" value="7">
					  <label class="form-check-label" for="inlineCheckbox2">7</label>
					</div>
					<!-- 
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="id8" value="8" disabled>
					  <label class="form-check-label" for="inlineCheckbox3">8 (disabled</label>
					</div>
					 -->
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="id9" value="9">
					  <label class="form-check-label" for="inlineCheckbox1">9</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="id10" value="10">
					  <label class="form-check-label" for="inlineCheckbox2">10</label>
					</div>
				</div>
				<div>
					<button id="btnreset">선택초기화</button>
				</div>
			
			
		</div>
	</div>
	
	<input type="button" value="예약하기" id="bookbtn">
	<br/>
	<div id="talk"></div>
	
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
<!-- <script src='./book.js'></script> -->
<script type="text/javascript" src="../../../YoHangFront/build/js/yohang-bundle.js"></script>
<script type="text/javascript" src="../../../YoHangFront/build/vendors/yohang-vendors-bundle.js"></script>


<script type="text/javascript">

$(document).ready(function() {
	
	//let data = {};//전송 데이터(JSON)
	
	// 세션에 저장되어있는 로그인한 사용자 아이디
	let username = '${loginMember.m_id}';
	
	ws = new WebSocket("ws://" + location.host + "/book2");
	
	ws.onmessage = function(msg){
		let data = JSON.parse(msg.data);
		//console.log(data);
		
		let username = '${loginMember.m_id}';
	
		let roomNum = "";
		if(data.hasOwnProperty('checked') == true) {
			roomNum = data.checked;
			
			$('#id'+roomNum).prop('disabled', true);
		} else if(data.hasOwnProperty('unchecked') == true) {
			roomNum = data.unchecked;
			//console.log(roomNum);
			
			$('#id'+roomNum).prop('disabled', false);
		}
		
		// 선택 초기화 버튼 : 필요한가.....
		function bookreset() {
			
			$('#btnreset').on('click', function(data) {
				
				let roomNum = data.checked;
				
				if($('#id'+roomNum).prop('checked', true) && $('#id'+roomNum).prop('disabled', true)) {
					$('#id'+roomNum).prop('disabled', false);
					$('#id'+roomNum).prop('checked', false);
				}
				
			})
		}
		
		// 내 브라우저에서는 checked 상태로 / 타 브라우저에서는 disabled 상태로 속성
		bookreset();
	}
	
	$('.form-check-input').change(function() {
		
		let username = '${loginMember.m_id}';
		
		// 데이터를 체크상태와 아닌 상태의 데이터를 구분하기 위해 데이터를 json형태로 만들어서 서버에 보냄
		if($(this).is(':checked')) {
			let checked = '{"username": "' + username + '" ,"checked" : ' + $(this).val() + ' }';
			ws.send(checked);
		} else {
			// unchecked에도 checked가 포함되어있으므로 unchecked라고 보내면 websocketbook.java에서 브라우저로부터 전송받은 데이터를 구분할 수 없음
			let unchecked = '{"username": "' + username + '" ,"un" : ' + $(this).val() + ' }';
			ws.send(unchecked);
		}
	})
	
	
})


</script>


</body>
</html>