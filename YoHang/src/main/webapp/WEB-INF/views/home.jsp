<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// include한 jsp에 필요한 parameters
	String menuName = "search";
	String title = "Home";
	
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
<jsp:include page="common/head.jsp" flush="false"/>
<body>
<!-- 
// header --------------------------------------->
<jsp:include page="common/header.jsp" flush="false">
	<jsp:param value="<%= home %>" name="home"/>
	<jsp:param value="<%= aboutus %>" name="aboutus"/>
	<jsp:param value="<%= findus %>" name="findus"/>
	<jsp:param value="<%= qna %>" name="qna"/>
	<jsp:param value="<%= faq %>" name="faq"/>
	<jsp:param value="<%= rv %>" name="rv"/>
	<jsp:param value="<%= notice %>" name="notice"/>
	<jsp:param value="<%= login %>" name="login"/>
	<jsp:param value="<%= logout %>" name="logout"/>
	<jsp:param value="<%= mypage %>" name="mypage"/>
</jsp:include>

<!--
// contents --------------------------------------->
<section class="home-slider owl-carousel">
   <div class="slider-item" style="background-image:url(../../YoHangFront/build/images/bg_1.jpg);">
     <div class="overlay"></div>
     <div class="container">
       <div class="row no-gutters slider-text align-items-center justify-content-center">
       <div class="col-md-12 ftco-animate text-center">
         <div class="text mb-5 pb-3">
           <h1 class="mb-3">Welcome To YoHang</h1>
           <h2>Hotels &amp; Resorts</h2>
         </div>
       </div>
     </div>
     </div>
   </div>

   <div class="slider-item" style="background-image:url(../../YoHangFront/build/images/bg_2.jpg);">
     <div class="overlay"></div>
     <div class="container">
       <div class="row no-gutters slider-text align-items-center justify-content-center">
       <div class="col-md-12 ftco-animate text-center">
         <div class="text mb-5 pb-3">
           <h1 class="mb-3">Enjoy A Luxury Experience</h1>
           <h2>Join With Us</h2>
         </div>
       </div>
     </div>
     </div>
   </div>
 </section>

 <section class="ftco-booking">
 
   <div class="container">
     <div class="row">
       <div class="col-lg-12">
         <form action="#" class="booking-form" name="wfrm">
           <div class="row">
           
             <div class="col-md-3 d-flex">
               <div class="form-group p-4 align-self-stretch d-flex align-items-end">
                 <div class="wrap">
                   <label for="#">Check-in Date</label>
                   <input type="text" id="checkin_date"  class="form-control checkin_date" placeholder="Check-in date" value="">                        
                 </div>
               </div>
             </div>
             
             <div class="col-md-3 d-flex">
               <div class="form-group p-4 align-self-stretch d-flex align-items-end">
                 <div class="wrap">
                   <label for="#">Check-out Date</label>
                   <input type="text" id="checkout_date"  class="form-control checkout_date" placeholder="Check-out date">
               </div>
               </div>
             </div>    
             <div class="col-md d-flex">
               <div class="form-group p-4 align-self-stretch d-flex align-items-end">
                 <div class="wrap">
                   <label for="#">Room</label>
                   <div class="form-field">
                     <div class="select-wrap">
                       <div class="icon"><span class="xi-angle-down"></span></div>
                       <select name="" id="roomname" class="form-control">
                         <option value="standard">Standard</option>
                         <option value="deluxe">Deluxe</option>
                         <option value="suite">Suite</option>
                       </select>
                     </div>
                   </div>
                 </div>
               </div>
             </div>
             <div class="col-md d-flex">
               <div class="form-group p-4 align-self-stretch d-flex align-items-end">
                 <div class="wrap">
                   <label for="#">Customer</label>
                   <div class="form-field">
                     <div class="select-wrap">
                       <div class="icon"><span class="xi-angle-down"></span></div>
                       <select name="" id="head_count" class="form-control">
                         <option value="1">1명</option>
                         <option value="2">2명</option>
                         <option value="3">3명</option>
                         <option value="4">4명</option>
                       </select>
                     </div>
                   </div>
                 </div>
               </div>
             </div>
             <div class="col-md d-flex">
               <div class="form-group d-flex align-self-stretch">
                 <input type="button" id="btn" value="Check Availability" class="btn btn-primary py-3 px-4 align-self-stretch">
               </div>
             </div>
           </div>
         </form>
       </div>
     </div>
   </div>
 </section>

  <!-- ftco-section bg-light -->
  <section class="ftco-section bg-light">
   <div class="container"> 		
     <div class="row" id="search" >
       <div class="col-sm col-md-6 col-lg-4 ftco-animate">
         <div class="room">
           <a href="/room/standard" class="img d-flex justify-content-center align-items-center" style="background-image: url(../../YoHangFront/build/images/room-1.jpg);">

             <div class="icon d-flex justify-content-center align-items-center">
               <span class="xi-search"></span>
             </div>
           </a>
           <div class="text p-3 text-center">
             <h3 class="mb-3"><a href="/room/standard">Standard Room</a></h3>
             <p><span class="price mr-2">￦380,000</span> <span class="per">per night</span></p>
             <hr>
             <p class="pt-1"><a href="/room/standard" class="btn-custom">View Room Details <span class="xi-long-arrow-right"></span></a></p>
           </div>
         </div>
       </div>
       <div class="col-sm col-md-6 col-lg-4 ftco-animate">
         <div class="room">
           <a href="/room/deluxe" class="img d-flex justify-content-center align-items-center" style="background-image: url(../../YoHangFront/build/images/room-4.jpg);">
             <div class="icon d-flex justify-content-center align-items-center">
               <span class="xi-search"></span>
             </div>
           </a>
           <div class="text p-3 text-center">
             <h3 class="mb-3"><a href="r/room/deluxe">Deluxe Room</a></h3>
             <p><span class="price mr-2">￦440,000</span> <span class="per">per night</span></p>
             <hr>
             <p class="pt-1"><a href="/room/deluxe" class="btn-custom">View Room Details <span class="xi-long-arrow-right"></span></a></p>
           </div>
         </div>
       </div>
       <div class="col-sm col-md-6 col-lg-4 ftco-animate">
         <div class="room">
           <a href="/room/suite" class="img d-flex justify-content-center align-items-center" style="background-image: url(../../YoHangFront/build/images/room-2.jpg);">
             <div class="icon d-flex justify-content-center align-items-center">
               <span class="xi-search"></span>
             </div>
           </a>
           <div class="text p-3 text-center">
             <h3 class="mb-3"><a href="/room/suite">suite Room</a></h3>
             <p><span class="price mr-2">￦540,000</span> <span class="per">per night</span></p>
             <hr>
             <p class="pt-1"><a href="/room/suite" class="btn-custom">View Room Details <span class="xi-long-arrow-right"></span></a></p>
           </div>
         </div>
       </div>
     </div>
   </div>
 </section>

 <!-- ftco-section ftc-no-pb ftc-no-pt -->
 <section class="ftco-section ftc-no-pb ftc-no-pt">
   <div class="container">
     <div class="row">
       <div class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../../YoHangFront/build/images/bg_2.jpg);">
         <a href="https://vimeo.com/45830194" class="icon popup-vimeo d-flex justify-content-center align-items-center">
           <span class="xi-play"></span>
         </a>
       </div>
       <div class="col-md-7 py-5 wrap-about pb-md-5 ftco-animate">
         <div class="heading-section heading-section-wo-line pt-md-5 pl-md-5 mb-5">
           <div class="ml-md-0">
             <span class="subheading">Welcome to YoHang Hotel</span>
             <h2 class="mb-4">Welcome To Our Hotel</h2>
           </div>
         </div>
         <div class="pb-md-5">
        	<p>요행 호텔은(YOHANG HOTEL)는 대한민국 최대 규모 호텔그룹입니다.
			이제 아시아를 넘어 세계로 뻗어가는 글로벌 호텔로서 전세계 어디에서나 한결같이 품격있는 서비스와 시설로 고객에게 깊은 감동을 주는 브랜드를 지향하고 있습니다.</p>
			<p>균형 있는 라이프스타일을 추구하며 품격의 가치를 아는 고객을 위해 세련되고 모던한 감각을 지닌 안락한 객실과 세심한 배려가 묻어나는 서비스를 준비합니다.
			또한 요행 호텔만의 감각적인 오트 퀴진과 다양한 경험을 제공하는 호텔시설은 감동을 더해드립니다.</p>
			<p>요행 호텔에서 품격 있는 휴식으로 삶의 균형을 완성해가시길 바랍니다.</p>
         </div>
       </div>
     </div>
   </div>
 </section>

 <!-- ftco-section -->
 <section class="ftco-section">
   <div class="container">
     <div class="row d-flex">
       <div class="col-md-3 d-flex align-self-stretch ftco-animate">
         <div class="media block-6 services py-4 d-block text-center">
           <div class="d-flex justify-content-center">
             <div class="icon d-flex align-items-center justify-content-center">
               <span class="xi-bank"></span>
             </div>
           </div>
           <div class="media-body p-2 mt-2">
             <h3 class="heading mb-3">25/7 Front Desk</h3>
             <p>고객님의 편의를 의한 연중무휴 프론트데스크</p>
           </div>
         </div>      
       </div>
       <div class="col-md-3 d-flex align-self-stretch ftco-animate">
         <div class="media block-6 services py-4 d-block text-center">
           <div class="d-flex justify-content-center">
             <div class="icon d-flex align-items-center justify-content-center">
               <span class="xi-restaurant"></span>
             </div>
           </div>
           <div class="media-body p-2 mt-2">
             <h3 class="heading mb-3">Restaurant Bar</h3>
             <p>2022 미술랭가이드 선정 레스토랑, 2022 블루리본 선정 레스토랑</p>
           </div>
         </div>    
       </div>
       <div class="col-md-3 d-flex align-sel Searchf-stretch ftco-animate">
         <div class="media block-6 services py-4 d-block text-center">
           <div class="d-flex justify-content-center">
             <div class="icon d-flex align-items-center justify-content-center">
               <span class="xi-car"></span>
             </div>
           </div>
           <div class="media-body p-2 mt-2">
             <h3 class="heading mb-3">Transfer Services</h3>
             <p>신청한 고객님에 한해 모시러가는 픽업서비스</p>
           </div>
         </div>      
       </div>
       <div class="col-md-3 d-flex align-self-stretch ftco-animate">
         <div class="media block-6 services py-4 d-block text-center">
           <div class="d-flex justify-content-center">
             <div class="icon d-flex align-items-center justify-content-center">
               <span class="xi-spa"></span>
             </div>
           </div>
           <div class="media-body p-2 mt-2">
             <h3 class="heading mb-3">Spa Suites</h3>
             <p>나에게 꼭맞는 스파 서비스와 24시 운동짐</p>
           </div>
         </div>      
       </div>
     </div>
   </div>
 </section>

<!-- ftco-section ftco-counter img -->
<section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(../../YoHangFront/build/images/bg_1.jpg);">
   <div class="container">
     <div class="row justify-content-center">
       <div class="col-md-10">
         <div class="row">
           <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
             <div class="block-18 text-center">
               <div class="text">
                 <strong class="number" data-number="50000">0</strong>
                 <span>Happy Guests</span>
               </div>
             </div>
           </div>
           <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
             <div class="block-18 text-center">
               <div class="text">
                 <strong class="number" data-number="3000">0</strong>
                 <span>Rooms</span>
               </div>
             </div>
           </div>
           <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
             <div class="block-18 text-center">
               <div class="text">
                 <strong class="number" data-number="1000">0</strong>
                 <span>Staffs</span>
               </div>
             </div>
           </div>
           <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="100">0</strong>
                <span>Destination</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

 <!-- ftco-section testimony-section bg-light -->
 <section class="ftco-section testimony-section bg-light">
   <div class="container">
     <div class="row justify-content-center">
       <div class="col-md-8 ftco-animate">
         <div class="row ftco-animate">
           <div class="col-md-12">
             <div class="carousel-testimony owl-carousel ftco-owl">
               <div class="item">
                 <div class="testimony-wrap py-4 pb-5">
                   <div class="user-img mb-4" style="background-image: url(../../YoHangFront/build/images/person_1.jpg)">
                     <span class="quote d-flex align-items-center justify-content-center">
                       <i class="xi-heart"></i>
                     </span>
                   </div>
                   <div class="text text-center">
                     <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                     <p class="name">Nathan Smith</p>
                     <span class="position">Guests</span>
                   </div>
                 </div>
               </div>
               <div class="item">
                 <div class="testimony-wrap py-4 pb-5">
                   <div class="user-img mb-4" style="background-image: url(../../YoHangFront/build/images/person_2.jpg)">
                     <span class="quote d-flex align-items-center justify-content-center">
                       <i class="xi-heart"></i>
                     </span>
                   </div>
                   <div class="text text-center">
                     <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                     <p class="name">Nathan Smith</p>
                     <span class="position">Guests</span>
                   </div>
                 </div>
               </div>
               <div class="item">
                 <div class="testimony-wrap py-4 pb-5">
                   <div class="user-img mb-4" style="background-image: url(../../YoHangFront/build/images/person_3.jpg)">
                     <span class="quote d-flex align-items-center justify-content-center">
                       <i class="xi-heart"></i>
                     </span>
                   </div>
                   <div class="text text-center">
                     <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                     <p class="name">Nathan Smith</p>
                     <span class="position">Guests</span>
                   </div>
                 </div>
               </div>
               <div class="item">
                 <div class="testimony-wrap py-4 pb-5">
                   <div class="user-img mb-4" style="background-image: url(../../YoHangFront/build/images/person_1.jpg)">
                     <span class="quote d-flex align-items-center justify-content-center">
                       <i class="xi-heart"></i>
                     </span>
                   </div>
                   <div class="text text-center">
                     <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                     <p class="name">Nathan Smith</p>
                     <span class="position">Guests</span>
                   </div>
                 </div>
               </div>
               <div class="item">
                 <div class="testimony-wrap py-4 pb-5">
                   <div class="user-img mb-4" style="background-image: url(../../YoHangFront/build/images/person_1.jpg)">
                     <span class="quote d-flex align-items-center justify-content-center">
                       <i class="xi-heart"></i>
                     </span>
                   </div>
                   <div class="text text-center">
                     <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                     <p class="name">Nathan Smith</p>
                     <span class="position">Guests</span>
                   </div>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>
     </div>
   </div>
 </section>

 <!-- ftco-section -->
 <section class="ftco-section">
   <div class="container">
     <div class="row justify-content-center mb-5 pb-3">
       <div class="col-md-7 heading-section text-center ftco-animate">
         <h2>Recent Blog</h2>
       </div>
     </div>
     <div class="row d-flex">
       <div class="col-md-3 d-flex ftco-animate">
         <div class="blog-entry align-self-stretch">
           <a href="blog-single.html" class="block-20" style="background-image: url('../../YoHangFront/build/images/image_1.jpg');">
           </a>
           <div class="text mt-3 d-block">
             <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
             <div class="meta mb-3">
               <div><a href="#">Dec 6, 2018</a></div>
               <div><a href="#">Admin</a></div>
               <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
             </div>
           </div>
         </div>
       </div>
       <div class="col-md-3 d-flex ftco-animate">
         <div class="blog-entry align-self-stretch">
           <a href="blog-single.html" class="block-20" style="background-image: url('../../YoHangFront/build/images/image_2.jpg');">
           </a>
           <div class="text mt-3">
             <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
             <div class="meta mb-3">
               <div><a href="#">Dec 6, 2018</a></div>
               <div><a href="#">Admin</a></div>
               <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
             </div>
           </div>
         </div>
       </div>
       <div class="col-md-3 d-flex ftco-animate">
         <div class="blog-entry align-self-stretch">
           <a href="blog-single.html" class="block-20" style="background-image: url('../../YoHangFront/build/images/image_3.jpg');">
           </a>
           <div class="text mt-3">
             <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
             <div class="meta mb-3">
               <div><a href="#">Dec 6, 2018</a></div>
               <div><a href="#">Admin</a></div>
               <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
             </div>
           </div>
         </div>
       </div>
       <div class="col-md-3 d-flex ftco-animate">
         <div class="blog-entry align-self-stretch">
           <a href="blog-single.html" class="block-20" style="background-image: url('../../YoHangFront/build/images/image_4.jpg');">
           </a>
           <div class="text mt-3">
             <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
             <div class="meta mb-3">
               <div><a href="#">Dec 6, 2018</a></div>
               <div><a href="#">Admin</a></div>
               <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
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
        <a href="../../YoHangFront/build/images/insta-1.jpg" class="insta-img image-popup" style="background-image: url(../../YoHangFront/build/images/insta-1.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../YoHangFront/build/images/insta-2.jpg" class="insta-img image-popup" style="background-image: url(../../YoHangFront/build/images/insta-2.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../YoHangFront/build/images/insta-3.jpg" class="insta-img image-popup" style="background-image: url(../../YoHangFront/build/images/insta-3.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../YoHangFront/build/images/insta-4.jpg" class="insta-img image-popup" style="background-image: url(../../YoHangFront/build/images/insta-4.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../YoHangFront/build/images/insta-5.jpg" class="insta-img image-popup" style="background-image: url(../../YoHangFront/build/images/insta-5.jpg);">
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
<jsp:include page="common/footer.jsp" flush="false"/>
<!--
// script --------------------------------------->
<script type="text/javascript" src="../../YoHangFront/build/js/yohang-bundle.js"></script>
<script type="text/javascript" src="../../YoHangFront/build/vendors/yohang-vendors-bundle.js"></script>

<script>

	// 위의 셀렉트박스에서 선택된 값을 ajax로 받아서 해당하는 객실타입만 검색폼 하단에 출력되게 만들기
	let checkin_date = "";
	let checkout_date = "";
		
	$('#btn').on('click', function() {
		
		if(document.wfrm.checkin_date.value.trim() == '') {
			alert('체크인날짜를 선택하셔야 합니다.');
			return false;
		}
		if(document.wfrm.checkout_date.value.trim() == '') {
			alert('체크아웃날짜를 선택하셔야 합니다.');
			return false;
		}
		
		let roomname = $('#roomname option:selected').val();
		let head_count = $('#head_count option:selected').val();
		//let checkin_date = $('#checkin_date option:selected').val();
		
		
		
		
		
		$.ajax({
			url : "/search.do",
			type : "post",	
			data : {
				roomname : roomname,
				head_count : head_count
			},
			success : function( serData ) {
				let html = '';
				console.log( serData.room_price );	
			// $.each( serData, function( index, item ) {
			 
			//  console.log( item );
			  html +=   '<div class="col-sm col-md-6 col-lg-4 ftco-animate fadeInUp ftco-animated">';
			  html +=       '<div class="room" >';
			  html +=         '<a href="room/' + serData.room_name + '?checkin_date='+ checkin_date + '&checkout_date='+ checkout_date +'&head_count=' + head_count + '" class="img d-flex justify-content-center align-items-center" style="background-image: url(../../YoHangFront/build/images/' + serData.room_image + ');">';
			  html +=           '<div class="icon d-flex justify-content-center align-items-center">';
			  html +=             '<span class="xi-search"></span>';
			  html +=           '</div>';
			  html +=         '</a>';
			  html +=        '<div class="text p-3 text-center">';
			  html +=           '<h3 class="mb-3"><a href="rooms-view.html">' + serData.room_name + '</a></h3>';
			  html +=           '<p><span class="price mr-2">'+ serData.room_price +'</span> <span class="per">per night</span></p>';
			  html +=          '<hr>';
			  html +=          '<p class="pt-1"><a href="rooms-view.html" class="btn-custom">View Room Details <span class="xi-long-arrow-right"></span></a></p>';
			  html +=         '</div>';
			  html +=       '</div>';

			  html +=     '</div>';
				 
 
			
			//	 html += '<tr>';
			//	 html +=	'<td>' + item.room_name + '</td>';
			//	 html +=	'<td>' + item.room_capacity + '</td>';
			//	 html += '            <img src="' + item.room_image + '"' + 'class="img-thumbnail img-fluid" alt=""></a>';
			//	 html += '            <p class="beverage_name text-center">' + item.room_name + '</p>';	
			//	 html += '</tr>';
			// });
			// html +='</table>';
			
			 $('#search').html(html);
				console.log( '성공' );
				
			},
			error: function( err ) {
				alert( '에러1 ' + err.status );
			}
		})
		
		
	});
	
	$('#checkin_date').change(function () {
		console.log( $('#checkin_date').val() );
		checkin_date = $('#checkin_date').val();
		
	})
	
	$('#checkout_date').change(function () {
		console.log( $('#checkout_date').val() );
		checkout_date = $('#checkout_date').val();
	})
	
	
</script>

</body>
</html>