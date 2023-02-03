<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.example.model.RvBoardTO"%>

<%@ page import="java.util.ArrayList" %>
<%
	RvBoardTO to = (RvBoardTO)request.getAttribute("to");

	String rv_seq = (String)request.getAttribute("rv_seq");
	
	String rv_subject = to.getRv_subject();
	String rv_id = to.getRv_id();
	String rv_date = to.getRv_date();
	String rv_content = to.getRv_content();
	String rv_img_name = to.getRv_img_name();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board_view.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="contents1"> 
	<div class="con_title"> 
		<p style="margin: 0px; text-align: right">
			<img style="vertical-align: middle" alt="" src="./images/home_icon.gif" /> &gt; 커뮤니티 &gt; <strong>여행지리뷰</strong>
		</p>
	</div>

	<div class="contents_sub">	
	<!--게시판-->
		<div class="board_view">
			<table>
			<tr>
				<th width="10%">제목</th>
				<td width="60%"><%= rv_subject %></td>
				<th width="10%">등록일</th>
				<td width="20%"><%= rv_date %></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><%= rv_id %></td>
			</tr>	
			<tr>
				<td colspan="4" height="200" valign="top" style="padding:20px; line-height:160%">
					<div id="bbs_file_wrap">
						<div>
							<img src="../upload/<%= rv_img_name %>" width="400" onerror="" /><br />
						</div>
					</div>
					<%= rv_content %>
				</td>
			</tr>			
			</table>
			


			<form action="" method="post" name="cfrm">
			</form>
		</div>
		<div class="btn_area">
			<div class="align_left">			
				<input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./list.do'" />
			</div>
			<div class="align_right">
				<input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./modify.do?rv_seq=<%= rv_seq %>'" />
				<input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./delete.do?rv_seq=<%= rv_seq %>'" />
				<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='./write.do'" />
			</div>
		</div>
		<!--//게시판-->
	</div>
<!-- 하단 디자인 -->
</div>

</body>
</html>
