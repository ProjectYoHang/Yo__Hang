<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<html lang="ko">
<jsp:include page="common/head.jsp" flush="false"/>
<body>
<!-- 
// header --------------------------------------->
<jsp:include page="common/header.jsp" flush="false"/>

<!-- hero-wrap -->
<jsp:include page="common/hero.jsp" flush="false"/>

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
<jsp:include page="common/footer.jsp" flush="false"/>

<!-- script --------------------------------------->
<script type="text/javascript" src="../../YoHangFront/build/js/yohang-bundle.js"></script>
<script type="text/javascript" src="../../YoHangFront/build/vendors/yohang-vendors-bundle.js"></script>

</body>
</html>