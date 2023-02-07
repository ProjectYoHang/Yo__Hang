<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.example.model.MembersTO"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>

<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>내 정보</title>
	<script>
	Kakao.init('107544815e4e8a304fea6cafb9766ba8');
	
	window.onload = function() {
		document.getElementById( 'mimBtn' ).onclick = function() {
			let frm = document.modifyFrm;
			if( frm.pw_rule_ok.value != 'Y' ) {
				alert( '허용되지 않는 비밀번호입니다.' );
				return false;
			}
			if( frm.phone_rule_ok.value != 'Y') {
				alert( '전화번호 형식이 맞지않습니다.')
				return false;	
			}
		}
	}
	
	</script>
</head>
<body>
<!-- 
// header --------------------------------------->
<jsp:include page="../common/header.jsp" flush="false"/>

<!-- hero-wrap -->
<jsp:include page="../common/hero.jsp" flush="false"/>

<!-- content -->
<section class="ftco-section bg-light">
  <div class="container">
    <div class="row d-flex justify-content-center ftco-animate">      
      <div class="col-lg-6">
			<form action="./member_info_modify_ok.do" class="bg-white" method="post" name="modifyFrm" style="padding: 50px; " >
				<div class="form-group">
					<input type="hidden" name="id" value="${loginMember.m_id}" />
					비밀번호 <input type="password" class="form-control" name="pw" id ="pw" value="" /> 
					<input type="hidden" name="pw_rule_ok" id="pw_rule_ok" value=""  />
					<span id ="password_rule_feedback"></span>
				</div>
				<div class="form-group">
					이름<input type="text" name="name" class="form-control" id="name" value="${loginMember.m_name }" readonly /> 
				</div>
				<div class="form-group">
					메일<input type="text" name="email" class="form-control" id="email" value="${loginMember.m_email }" /> 
				</div>
				<div class="form-group">
					번호<input type="text" name="phone" class="form-control" id="phone" value="${loginMember.m_phone }" /> 
					<span id ="phone_check_feedback"></span>
				</div>
				<div class="form-group">
					생년월일<input type="text" name="birth" class="form-control" id="birth" value="${loginMember.m_birth }" readonly />
				</div>
				<div class="form-group">
					<input type="submit" id="mimBtn" value="정보 변경" class="btn btn-primary" />
				</div>
				<form action="./member_signout_ok.do" method="post">
					<input type="hidden" name="id" value="${loginMember.m_id}" />
					<input type="submit" name="msoBtn" value="회원 탈퇴" class="btn btn-primary" />
				</form>
				 
			</form>
	<!--  					
		  카카오 연동시 회원 테이블에 정보 추가   / 연동 해제시 테이블에서 정보 삭제 해야 	
		<c:if test="${loginMember.m_kakao_id == null}">
			<div class="form-group mb-0 text-center" onclick="kakaoLogin();" >
		    	<a href="javascript:void(0)" class="btn w-30 py-3 px-5" style="border: 1px solid #8d703b; background: transparent; color: #8d703b;" >
		          <span>카카오 연동</span>
		      	</a>
          </div>
		</c:if>
		<c:if test="${loginMember.m_kakao_id != null}">
			<div class="dropdown">
			    <div class="form-group mb-0 text-center" onclick="kakaoLogout();" >
			    	<a  href="javascript:void(0)">
			        <span>카카오 연동해제</span>
			    	</a>
	        	</div>
            </div>
		</c:if>
	-->
			
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
<jsp:include page="../common/footer.jsp" flush="false"/>

<!--
// script --------------------------------------->
<script type="text/javascript" src="../../YoHangFront/build/js/yohang-bundle.js"></script>
<script type="text/javascript" src="../../YoHangFront/build/vendors/yohang-vendors-bundle.js"></script>

<script type="text/javascript">
		$('#pw').focusout(function(){
		    let password = $("#pw").val();
		    // 최소 8자, 하나의 이상의 대소문자 및 하나의 숫자, 하나의 특수문자	
		    let password_rule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		    
		    if( !password_rule.test(password) || password.length < 8) {
		  	  $("#password_rule_feedback").html( '영대소문자,숫자로 구성된 8글자 이상으로 조합하세요.' );
		  	  $("#password_rule_feedback").css('color', 'red');
		  	  $( "#pw_rule_ok" ).val('N')
		    } else {
		  	  $("#password_rule_feedback").html( ' ' );
		  	  $( "#pw_rule_ok" ).val('Y')
		    }
		});
	   
	    $('#phone').focusout(function() {
			//	앞자리가 01이며 (0,1,6,7,8,9) 이며 중간에 3~4자리, 세번째는 4자리인 전화번호
			let phone_rule = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			let phone_input = $('#phone').val();
			
			if( !phone_rule.test( phone_input ) ) {
				$("#phone_check_feedback").html('전화번호 형식이 맞지않습니다.')
				$("#phone_check_feedback").css('color', 'red');
				$( "#phone_rule_ok" ).val('N')
			} else {
				$("#phone_check_feedback").html('')
				$( "#phone_rule_ok" ).val('Y')
			}
		});
	    
	  //카카오로그인

	    function kakaoLogin() {
	        Kakao.Auth.login({
	          success: function (response) {
	            Kakao.API.request({
	              url: '/v2/user/me',
	              success: function (response) {
	            	  console.log(response);
	            	  if(response.id) {
	            		  let kakao_id = response.id;
	            		  //location.href='./kakao_login.do?kakao_id=' + kakao_id;
	            		  location.href='./kakao_connect.do?kakao_id=' + kakao_id;
	            	  } 
	            	  else {
	            		 // 카카오로그인 실패
	            	  }
	              },
	              fail: function (error) {
	            	  //실패
	                console.log(error)
	              },
	            })
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      }
	    
	  //카카오로그아웃  
	    function kakaoLogout() {
	        if (Kakao.Auth.getAccessToken()) {
	          Kakao.API.request({
	            url: '/v1/user/unlink',
	            success: function (response) {
	            	console.log(response)
	            },	
	            fail: function (error) {
	              console.log(error)
	            },
	          })
	          Kakao.Auth.setAccessToken(undefined)
	        }
	      }  
</script>
</body>
</html>