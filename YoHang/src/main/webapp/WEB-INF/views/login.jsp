<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

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

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-3" id="exampleModalLabel">아이디 / 비밀번호 찾기 </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modalBoard" >
        <form>
		<fieldset>
				<label for="f_name"  >Name</label>
				<input type="text" id="f_name" class="text ui-widget-content ui-corner-all">
				<button type="button" class="btn btn-info" data-bs-dismiss="modal" onclick="findId()" >아이디 찾기</button>
		</fieldset>
		<hr>
		<fieldset>
				<label for="f_id"  >Id</label>
				<input type="text" id="f_id"  class="text ui-widget-content ui-corner-all">
				<button type="button" class="btn btn-info" data-bs-dismiss="modal" onclick="findPw()" >비밀번호 찾기</button>
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

	const findId =  function() {
		let name = $('#f_name').val();
		let idList = '<table>';
		
		if( name == null || name == "" ) {
			alert( '이름을 입력하세요' );
		}else {
			$.ajax({
				url  : '/find_id.do',
				type : 'post',
				data : {
					name : name
				},
				success : function ( resData ) {
					console.log( 'findId 통신 성공 ');
					if( resData.length <= 0  ) {
						alert( '등록되지 않은 이름입니다.' );	
					} else {
						$.each(resData, function(index, item) {
							console.log( item.m_id );
							idList += '<tr>';
							idList += '<td>' +  item.m_id + '</td>';
							idList += '</tr>';
						})
						idList += '</table>';
						alert( idList );
						//$('#modalBoard').html(nameList);	
					}
				},
				error : function ( err ) {
					alert( err.status );
				}
			});	
		}
		
	}
	
	const findPw =  function( ) {
		let id = $('#f_id').val();
		
		if( id == null || id == "" ) {
			alert( '아이디를  입력하세요' );
		}else {
			$.ajax({
				url  : '/find_pw.do',
				type : 'post',
				data : {
					id : id
				},
				success : function ( resData ) {
					console.log( 'findPw 통신 성공 ');
					if( !resData ) {
						alert( '등록되지 않은 아이디 입니다.');
					}else {
						console.log( resData.m_email );
						if( confirm( "아래의 메일로 임시 비밀번호를 보낼까요?\n" + resData.m_email ) ){
							alert( '확인' );
							
							$.ajax({
								url : '/sendPw.do',
								type: 'post',
								data: {
									mail : resData.m_email,
									tempPassword : resData.m_pw
								},
								success : function( result ) {
									alert( '메일 발송 성공' );
								},
								error : function ( err ) {
									alert( err.status );
								}
							})
						} else {
							alert( '취소' );
						}
					}
					
				},
				error : function ( err ) {
					alert( err.status );
				}
			});	
		}
	}	
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

</script>
<jsp:include page="common/footer.jsp" flush="false"/>

<!-- script --------------------------------------->
<script type="text/javascript" src="../../YoHangFront/build/js/yohang-bundle.js"></script>
<script type="text/javascript" src="../../YoHangFront/build/vendors/yohang-vendors-bundle.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>