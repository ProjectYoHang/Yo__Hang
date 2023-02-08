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
      
      <div id='chatt'>
	<h1>WebSocket booking</h1>
	
		<input type='text' id='mid' value='홍길동'>
		<input type='button' value='로그인' id='btnLogin'>
		<br>
		
		
		
		<div id='rooms'>
			
				<div>
		  			<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="one" value="1">
					  <label class="form-check-label" for="inlineCheckbox1">1</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="two" value="2">
					  <label class="form-check-label" for="inlineCheckbox2">2</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="three" value="3" disabled>
					  <label class="form-check-label" for="inlineCheckbox3">3 (disabled</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="four" value="4">
					  <label class="form-check-label" for="inlineCheckbox1">4</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="five" value="5">
					  <label class="form-check-label" for="inlineCheckbox2">5</label>
					</div>
				</div>
				<div>
		  			<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="six" value="6">
					  <label class="form-check-label" for="inlineCheckbox1">6</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="seven" value="7">
					  <label class="form-check-label" for="inlineCheckbox2">7</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="eight" value="8" disabled>
					  <label class="form-check-label" for="inlineCheckbox3">8 (disabled</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="nine" value="9">
					  <label class="form-check-label" for="inlineCheckbox1">9</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="ten" value="10">
					  <label class="form-check-label" for="inlineCheckbox2">10</label>
					</div>
				</div>
			
		</div>
		
		<!-- 
		<input type="button" id="one" value="1" />
		<input type="button" id="two" value="2" />
		<input type="button" id="three" value="3" />
		<input type="button" name="four" value="4" />
		<input type="button" name="5" value="5" /><br>
		<input type="button" name="6" value="6" />
		<input type="button" name="7" value="7" />
		<input type="button" name="8" value="8" />
		<input type="button" name="9" value="9" />
		<input type="button" name="10" value="10" /><br><br>
		 -->
		 
	</div>
	
	<input type='button' value='예약하기' id='bookbtn'>
	<br/>
	<div id='talk'></div>
	
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

//$(document).ready(function() {
	
	//console.log('hello');
	
	let data = {};//전송 데이터(JSON)
	
	
	function getId(id){
		return document.getElementById(id);
	}

	let ws ;
	let mid = getId('mid');
	let btnLogin = getId('btnLogin');
	let talk = getId('talk');
	let one = getId('one');
	let rooms = getId('rooms');
	
	//let mid = $('mid');

	btnLogin.onclick = function(){
		ws = new WebSocket("ws://" + location.host + "/book2");
		
		ws.onmessage = function(one){
			let data = JSON.parse(one.data);
			let css;
			
			
			
			let item = `<div>
			                <span><b>${data.mid}</b></span> [ ${data.date} ]<br/>
	                      <span>${data.one}</span>
							</div>`;
			
			
			talk.innerHTML += item;
			talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
		}
	}

	let checked = $('#one').is(':checked');
	
	if(checked) {
		send();
	}

	bookbtn.onclick = function(){
		send();
	}

	function send(){
		if(one.value.trim() != ''){
			data.mid = getId('mid').value;
			data.one = one.value;
			data.date = new Date().toLocaleString();
			let temp = JSON.stringify(data);
			ws.send(temp);
		}
		one.value ='';
	}

	
//})




</script>


</body>
</html>