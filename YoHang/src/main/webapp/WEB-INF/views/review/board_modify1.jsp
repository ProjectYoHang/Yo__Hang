<%@page import="com.example.model.RvBoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	


<%
	RvBoardTO to = (RvBoardTO)request.getAttribute("to");
	String cpage = (String)request.getAttribute("cpage");
	String rv_seq = (String)request.getAttribute("rv_seq");
	
	String rv_subject = to.getRv_subject();
	String rv_id = to.getRv_id();
	String rv_content = to.getRv_content();
	
	String rv_img_name = to.getRv_img_name();
	long rv_img_size = to.getRv_img_size();
%>

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>
<body>
<!-- 
// header --------------------------------------->
<jsp:include page="../common/header.jsp" flush="false"/>

<!-- hero-wrap -->
<jsp:include page="../common/hero.jsp" flush="false"/>

<!-- content -->
<section class="ftco-section bg-light">
<div class="con_title">
	<h3>게시판</h3>
	<p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
	<form action="./modify_ok.do" method="post" name="mfrm" enctype="multipart/form-data">
	<input type="hidden" name="rv_seq" value="<%= rv_seq %>">
		<div class="contents_sub">	
			<!--게시판-->
			<div class="board_write">
				<table>
				<tr>
					<th class="top">글쓴이</th>
					<td class="top"><input type="text" name="rv_id" value="<%= rv_id %>" class="board_view_input_mail" maxlength="5" readonly/></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="rv_subject" value="<%= rv_subject %>" class="board_view_input" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="rv_content" class="board_editor_area"><%= rv_content %></textarea></td>
				</tr>

				<tr>
					<th>기존 이미지파일명 : <%= rv_img_name %></th>
					<th>기존 이미지파일 크기 : <%= rv_img_size %></th>
				</tr>
				
				<tr>
					<th>이미지 선택</th>
					<td colspan="3">
					<!-- 파일 업로드 input type=file -->
						<input type="file" name="upload" value="" class="board_view_input" /><br /><br />
					</td>
				</tr>
				</table>
			</div>
			
			<div class="btn_area">
				<div class="align_left">
					<input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./list.do'" />
					<!-- 보기 눌렀을 때 view로 이동해야 하는데 seq를 줘야 보여주므로 ?seq 추가 / delete1에서도 추가해줘야 함 -->
					<input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./view.do?rv_seq=<%= rv_seq %>'" />
				</div>
				<div class="align_right">
					<input type="button" id="mbtn" value="수정" class="btn_write btn_txt01" style="cursor: pointer;" />
				</div>
			</div>
			<!--//게시판-->
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
		window.onload = function() {
				document.getElementById('mbtn').onclick = function() {
					if(document.mfrm.rv_content.value.trim() == '') {
						alert('내용을 입력해야 합니다.');
						return false;
					}
					if(document.mfrm.rv_subject.value.trim() == '') {
						alert('제목을 입력해야 합니다.');
						return false;
					}
					if( document.mfrm.upload.value.trim() != '' ) {
						
						const extension = document.mfrm.upload.value.split( '.' ).pop();
						if( extension != 'png' && extension != 'jpg' && extension != 'gif' && extension != 'PNG' && extension != 'JPG' && extension != 'GIF' ) {
							alert( '이미지 파일을 입력하셔야 합니다.' );	
							return false;
						}
					}
					document.mfrm.submit();
				}
			}
		
	</script>
</body>
</html>
