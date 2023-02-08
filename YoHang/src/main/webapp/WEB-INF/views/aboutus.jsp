<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// include한 jsp에 필요한 parameters
	String menuName = "About us";
	String title = "회사소개";
	
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
	<jsp:param value="<%= notice %>" name="notice"/>
	<jsp:param value="<%= login %>" name="login"/>
	<jsp:param value="<%= logout %>" name="logout"/>
	<jsp:param value="<%= mypage %>" name="mypage"/>
</jsp:include>

<!-- hero-wrap -->
<jsp:include page="common/hero.jsp" flush="false">
	<jsp:param value="<%= menuName %>" name="menuName"/>
	<jsp:param value="<%= title %>" name="title"/>
	<jsp:param value="<%= home %>" name="home"/>
</jsp:include>

<!-- content -->
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
        	<p>요행 호텔은(Yohang HOTEL)는 대한민국 최대 규모 호텔그룹입니다.
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

</body>
</html>