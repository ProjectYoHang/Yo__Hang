<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<html>
<head include-jsp="./common/head.jsp">
<meta charset="UTF-8">

<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<!-- <header id="header" class="site-header" include-html="/static/html/common/header.html"></header> -->
<header id="header" class="site-header" include-jsp="./common/header.jsp"></header>

<!--
// contents --------------------------------------->

<!-- hero-wrap -->
<div class="hero-wrap" style="background-image: url('/static/images/bg_1.jpg');">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
      <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
        <div class="text">
          <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home</a></span> <span>Login</span></p>
          <h1 class="mb-4 bread">Login</h1>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- content -->
<section class="ftco-section bg-light">
  <div class="container">
    <div class="row d-flex justify-content-center ftco-animate">      
      <div class="col-lg-6">
        <form action="./login_ok.do" class="bg-white" method="post" style="padding: 50px;">
          <div class="form-group">
            <input type="text" class="form-control" name="id" placeholder="ID">
          </div>
          <div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password">
          </div>
          <br />
          <div class="form-group">
            <input type="submit" value="Login" class="btn btn-primary w-100 py-3 px-5">
          </div>
          
          <div class="form-group mb-0 text-center" onclick="kakaoLogin();" >
		    	<a href="javascript:void(0)" class="btn w-100 py-3 px-5" style="border: 1px solid #8d703b; background: transparent; color: #8d703b;" >
		          <span>카카오 로그인</span>
		      	</a>
          </div>
          
        </form>
        
        <!--  <div class="form-group">
            <input type="submit" value="Kakao Login" class="btn w-100 py-3 px-5" onclick="kakaoLogin()" style="border: 1px solid #8d703b; background: transparent; color: #8d703b;">
          </div> -->
          
          
           <div class="form-group mb-0 text-center" onclick="kakaoLogout();" >
		    	<a href="javascript:void(0)">
		          <span>카카오 로그아웃</span>
		      	</a>
          </div>
          
          <div class="form-group mb-0 text-center">
            <a href="" onclick="findInfo()">아이디 / 비밀번호 찾기</a>
          </div>
          
          <div class="form-group mb-0 text-center">
            <a href="./signup.do">회원가입</a>
          </div>
      </div>
    </div>
  </div>
</section>


<!--
// footer --------------------------------------->
<footer id="footer" class="site-footer" include-html="/static/html/common/footer.html"></footer>

<!--
// script --------------------------------------->
<script type="text/javascript" src="/static/js/yohang-bundle.js"></script>
<script type="text/javascript" src="/static/vendors/yohang-vendors-bundle.js"></script>
<!-- 
<form action='./login_ok.do' method='post'>
ID<input type='text' name='id' /> <br />
password <input type='password' name='password' />
<input type="submit" value="로그인" />
 
<br /><hr />
<ul>
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <span>카카오 로그인</span>
      </a>
	</li>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>

<br /><hr />

<input type="button" value="회원가입" onclick="location.href='./signup.do'" />
-->
<script>	
Kakao.init('107544815e4e8a304fea6cafb9766ba8'); 
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인

function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  debugger;
        	  console.log(response);
        	  if(response.id) {
        		  // 소셜 로그인 검증 진행
        		  // 검증되면 로그인 진행 -> 세션에 로그인 정보 등록
        		  // 우리 홈페이지에 카카오아이디 없으면 -> 회원가입진행
        		  let kakao_id = response.id;
        		  console.log( kakao_id );
        		  location.href='./kakao_login.do?kakao_id=' + kakao_id ;
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>