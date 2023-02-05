<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<html lang="ko">

<jsp:include page="common/head.jsp" flush="false"/>

<body>

<!-- header --------------------------------------->
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
            <input type="text" class="form-control" id="id" name="id" placeholder="ID">
          </div>
          <div class="form-group">
            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
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
          
          <br />
          
           <!-- Button trigger modal -->
          <div class="form-group mb-0 text-center">
			<button type="button" class="btn btn-primary w-30 py-3 px-5" data-bs-toggle="modal" data-bs-target="#exampleModal">
				  아이디 / 비밀번호 찾기 
			</button>
          </div>
        
          <br />
        
          <div class="form-group mb-0 text-center">
            <a class="btn btn-primary w-30 py-3 px-5" href="./signup.do">회원가입</a>
          </div>
       </form>
       
      </div>
    </div>
  </div>
</section>
   <!--  추후 내정보 페이지로 이동해야함  -->
        <div class="form-group mb-0 text-center" onclick="kakaoLogout();" >
		    <a  href="javascript:void(0)">
		        <span>카카오 로그아웃</span>
		    </a>
        </div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-3" id="exampleModalLabel">아이디 / 비밀번호 찾기 </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
		<fieldset>
			<label for="f_name">Name</label>
			<input type="text" id="f_name" class="text ui-widget-content ui-corner-all">
			<label for="f_mail">Mail</label>
			<input type="text" id="f_mail" class="text ui-widget-content ui-corner-all">
			<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
		</fieldset>
		</form>
		
		<form>
		<fieldset>
			<label for="f_name">Name</label>
			<input type="text" id="f_name" class="text ui-widget-content ui-corner-all">
			<label for="f_mail">Mail</label>
			<input type="text" id="f_mail" class="text ui-widget-content ui-corner-all">
			<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
		</fieldset>
	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


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
        	  console.log(response);
        	  if(response.id) {
        		  // 소셜 로그인 검증 진행
        		  // 검증되면 로그인 진행 -> 세션에 로그인 정보 등록
        		  // 홈페이지에 해당 카카오아이디 등록된 회원이 없으면 -> 회원가입진행
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
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>