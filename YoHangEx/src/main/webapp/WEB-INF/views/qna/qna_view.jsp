<%@page import="java.util.ArrayList"%>
<%@page import="com.example.model.QnAReplyTO"%>
<%@page import="com.example.model.QnABoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	QnABoardTO to = (QnABoardTO)request.getAttribute("to");
	
	String qna_seq = (String)request.getAttribute("qna_seq");	

	String qna_subject = to.getQna_subject();
	String qna_id = to.getQna_id();
	String qna_date = to.getQna_date();
	int qna_hit = to.getQna_hit();
	String qna_content = to.getQna_content();
	/*
	ArrayList<QnAReplyTO> qnaReplys = (ArrayList)request.getAttribute("qnaReplys");
	
	StringBuilder html = new StringBuilder();
	for(QnAReplyTO rplTo : qnaReplys) {
		
		String qrpl_id = rplTo.getQrpl_id();
		String qrpl_content = rplTo.getQrpl_content();
		String qrpl_date = rplTo.getQrpl_date();
		
		html.append("<div>");
		html.append("<tr>");
		html.append("<td><댓글></td>" + "<br>");
		html.append("<td>" + qrpl_id + "</td>" + "<br>");
		html.append("<td>" + qrpl_content + "</td>" + "<br>");
		html.append("<td>" + qrpl_date + "</td>");
		html.append("</tr>");
		html.append("</div>");
	}
	*/

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js">
$(document).ready(function() {
	showReplys();
});

function showReplys() {
	
	let url = "${pageContext.request.contextPath}/qna/view.do";
	let paramData = {"qnaReplys": "${qnaReplys}"}
	
	$.ajax({
		type: 'get',
		url: url,
		data: paramData,
		dataType : 'json',
		success: function(result) {
			let htmls = "";
			if(result.length >= 1) {
				$(result).each(function() {
					html.append("<div>");
					html.append("<tr>");
					html.append("<td><댓글></td>" + "<br>");
					html.append("<td>" + this.qrpl_id + "</td>" + "<br>");
					html.append("<td>" + this.qrpl_content + "</td>" + "<br>");
					html.append("<td>" + this.qrpl_date + "</td>");
					html.append("</tr>");
					html.append("</div>");
				})
			}
		},
		error: function(err) {
			console.log('[에러] : ' + err.message);
		}
	})
};

</script>
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
	<h3>게시판</h3>
	<p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
	<div class="contents_sub">
		<!--게시판-->
		<div class="board_view">
			<table>
			<tr>
				<th width="10%">제목</th>
				<td width="60%"><%= qna_subject %></td>
				<th width="10%">등록일</th>
				<td width="20%"><%= qna_date %></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><%= qna_id %></td>
				<th>조회</th>
				<td><%= qna_hit %></td>
			</tr>
			<tr>
				<td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%"><%= qna_content %></td>
			</tr>
			</table>
		</div>
		
		
	<!-- Comments Form -->
		<div class="card my-4">
			<h5 class="card-header">Leave a Comment:</h5>
			<div class="card-body">
				<form name="comment-form" action="./reply_write.do?qna_seq=<%= qna_seq %>&qrpl_id=admin1234" method="post" autocomplete="off">
					<div class="form-group">
						<input type="hidden" name="qna_seq" value=<%= qna_seq %> />
						<input type="hidden" name="qrpl_id" value="admin1234" />
						<textarea name="qrpl_content" class="form-control" rows="3"></textarea>
					</div>
					<button type="submit" class="btn btn-primary">댓글쓰기</button>
				</form>
			</div>
		</div>
		

		<div class="btn_area">
			<div class="align_left">
				<input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./list.do'" />
			</div>
			<div class="align_right">
				<input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./modify.do?qna_seq=<%= qna_seq %>'" />
				<input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./delete.do?qna_seq=<%= qna_seq %>'" />
				<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='./write.do'" />
			</div>
		</div>	
		<!--//게시판-->
	</div>
</div>
<!-- 하단 디자인 -->

</body>
</html>
