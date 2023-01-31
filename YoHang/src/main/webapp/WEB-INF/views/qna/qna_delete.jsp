<%@page import="com.example.model.QnABoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	QnABoardTO to = (QnABoardTO)request.getAttribute("to");

	String qna_seq = (String)request.getAttribute("qna_seq");

	String qna_subject = to.getQna_subject();
	String qna_id = to.getQna_id();

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type = "text/javascript">
	window.onload = function() {
		// dbtn이 클릭되면 알림창이 뜸
		document.getElementById('dbtn').onclick = function() {
			// alert('click');
			if(document.dfrm.qna_pw.value.trim() == '') {
				alert('비밀번호를 입력해야 합니다.');
				return;
			}
			
			// 원래는 input type을 submit으로 하면 그냥 전송되지만 type을 버튼으로 설정한 다음 onclick 요소를 추가했기 때문에 비밀번호 입력값 검사가 정상완료되면 ok페이지로 데이터가 전송될 수 있게 submit() 전송메서드를 따로 추가해줘야 함
			document.dfrm.submit();
		}
	}
</script>
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
	<h3>게시판</h3>
	<p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
	<!-- name을 설정한다는 의미는 자바스크립트에서 뭔가 검사할 것이 있구나 라고 생각해야 함 -->
	<form action="./delete_ok.do" method="post" name="dfrm">
	<!-- seq를 숨겨서 ok페이지로 보내기 위해서 input 추가 -->
	<input type="hidden" name="qna_seq" value="<%= qna_seq %>">
		<div class="contents_sub">	
			<!--게시판-->
			<div class="board_write">
				<table>
				<tr>
					<th class="top">글쓴이</th>
					<td class="top"><input type="text" name="qna_id" value="<%= qna_id %>" class="board_view_input_mail" maxlength="5" readonly/></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="qna_subject" value="<%= qna_subject %>" class="board_view_input" readonly/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="qna_pw" value="" class="board_view_input_mail"/></td>
				</tr>
				</table>
			</div>
			
			<div class="btn_area">
				<div class="align_left">
					<input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./list.do'" />
					<input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./view.do?qna_seq=<%= qna_seq %>'" />
				</div>
				<div class="align_right">
					<input type="button" id="dbtn" value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" />
				</div>
			</div>
			<!--//게시판-->
		</div>
	</form>
</div>
<!-- 하단 디자인 -->

</body>
</html>
