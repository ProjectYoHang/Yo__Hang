<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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

<script>	
Kakao.init('107544815e4e8a304fea6cafb9766ba8'); //발급받은 키 중 javascript키를 사용해준다.
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
        		  // ToDo
        		  
        		  // 소셜 로그인 검증 진행
        		  // 검증되면 로그인 진행 -> 세션에 로그인 정보 등록
        		  // 우리 홈페이지에 카카오아이디 없으면 -> 회원가입진행
        		  //location.href = '/kakao/test?id=' + response.id + '&birth=' + response.birth;
        		  console.log(response.id);
        		  // 가져온 정보 Json으로 꺼내오기
        		  
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
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>