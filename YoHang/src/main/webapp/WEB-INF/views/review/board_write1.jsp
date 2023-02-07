﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('wbtn').onclick = function() {
			// alert('click');
			// 필수 입력항목 검사
			if(document.wfrm.info.checked == false) {
				alert('동의하셔야 합니다.');
				return false;
			}
			if(document.wfrm.rv_id.value.trim() == '') {
				alert('글쓴이를 입력하셔야 합니다.');
				return false;
			}
			if(document.wfrm.rv_subject.value.trim() == '') {
				alert('제목을 입력하셔야 합니다.');
				return false;
			}

			if( document.wfrm.upload.value.trim() != '' ) {
				
				const extension = document.wfrm.upload.value.split( '.' ).pop();
				if( extension != 'png' && extension != 'jpg' && extension != 'gif' && extension != 'PNG' && extension != 'JPG' && extension != 'GIF' ) {
					alert( '이미지 파일을 입력하셔야 합니다.' );	
					return false;
				}
			}
			
			// 위의 검사가 다 끝나면 submit해서 다음 페이지로 넘어가라는 의미
			document.wfrm.submit();
		};   
	}
	
</script>
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
	<h3>게시판</h3>
	<p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_menu"></div>
<div class="con_txt">
	<form action="./write_ok.do" method="post" name="wfrm" enctype="multipart/form-data">

		<div class="contents_sub">	
			<!--게시판-->
			<div class="board_write">
				<table>
				<tr>
					<th class="top">글쓴이</th>
					<td class="top"><input type="text" name="rv_id" value="" class="board_view_input_mail" maxlength="10" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="rv_subject" value="" class="board_view_input" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="rv_content" class="board_editor_area"></textarea></td>
				</tr>
				<tr>
					<th>방번호</th>
					<td><textarea name="rv_room_seq" class="board_editor_area"></textarea></td>
				</tr>
				<tr>
					<th>예약번호</th>
					<td><textarea name="rv_book_num" class="board_editor_area"></textarea></td>
				</tr>
				<tr>
					<th>별점</th>
					<td><textarea name="rv_stars" class="board_editor_area"></textarea></td>
				</tr>
				<tr>
					<th>좋아요</th>
					<td><textarea name="rv_like" class="board_editor_area"></textarea></td>
				</tr>	
				
				<tr>
					<th>이미지</th>
					<td colspan="3">
					<!-- 파일 업로드 input type=file -->
						<input type="file" name="upload" value="" class="board_view_input" /><br /><br />
					</td>
				</tr>
																			
				</table>
				
				<table>
				<tr>
					<td style="text-align:left;border:1px solid #e0e0e0;background-color:f9f9f9;padding:5px">
						<div style="padding-top:7px;padding-bottom:5px;font-weight:bold;padding-left:7px;font-family: Gulim,Tahoma,verdana;">※ 개인정보 수집 및 이용에 관한 안내</div>
						<div style="padding-left:10px;">
							<div style="width:97%;height:95px;font-size:11px;letter-spacing: -0.1em;border:1px solid #c5c5c5;background-color:#fff;padding-left:14px;padding-top:7px;">
								1. 수집 개인정보 항목 : 회사명, 담당자명, 메일 주소, 전화번호, 홈페이지 주소, 팩스번호, 주소 <br />
								2. 개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통 경로 확보 <br />
								3. 개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를 위하여 보관하며, 이후 해당정보를 지체 없이 파기합니다. <br />
								4. 그 밖의 사항은 개인정보취급방침을 준수합니다.
							</div>
						</div>
						<div style="padding-top:7px;padding-left:5px;padding-bottom:7px;font-family: Gulim,Tahoma,verdana;">
							<input type="checkbox" name="info" value="1" class="input_radio"> 개인정보 수집 및 이용에 대해 동의합니다.
						</div>
					</td>
				</tr>
				</table>
			</div>
			
			<div class="btn_area">
				<div class="align_left">
					<input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./list.do'" />
				</div>
				<div class="align_right">
					<input type="button" id="wbtn" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" />
				</div>
			</div>
			<!--//게시판-->
		</div>
	</form>
</div>
<!-- 하단 디자인 -->

</body>
</html>