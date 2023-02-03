<%@page import="com.example.model.QnABoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<QnABoardTO> qnaLists = (ArrayList<QnABoardTO>)request.getAttribute("qnaLists");
	
	int totalRecord = (Integer)request.getAttribute("totalRecord");

	int cpage = (Integer)request.getAttribute("cpage");
	int lastPage = (Integer)request.getAttribute("lastPage");
	
	int startPageNum = (Integer)request.getAttribute("startPageNum");
	int lastPageNum = (Integer)request.getAttribute("lastPageNum");
	
	int recordPerPage = (Integer)request.getAttribute("recordPerPage");
	
	int totalPage = ((totalRecord - 1) / recordPerPage) + 1;
	
	//
	StringBuilder sbHtml = new StringBuilder();

	for(QnABoardTO to : qnaLists) {
		String qna_seq = to.getQna_seq();
		String qna_subject = to.getQna_subject();
		String qna_id = to.getQna_id();
		String qna_date = to.getQna_date();
		int qna_hit = to.getQna_hit();
		int wgap = to.getWgap();
		int qna_reply = to.getQna_reply();
		
		sbHtml.append("<tr>");
		sbHtml.append("<td>&nbsp;</td>");
		sbHtml.append("<td>" + qna_seq + "</td>");
		sbHtml.append("<td class='left'>");
		sbHtml.append("<a href='./view.do?cpage=" + cpage + "&qna_seq=" + qna_seq + "'>" + qna_subject + "</a>&nbsp;");
		if(wgap == 0) {
			sbHtml.append("<img src='./images/icon_new.gif' alt='NEW'>");
		}
		if(qna_reply == 1) {
			sbHtml.append("&nbsp답변완료</td>");
		}
		sbHtml.append("<td>" + qna_id + "</td>");
		sbHtml.append("<td>" + qna_date + "</td>");
		sbHtml.append("<td>" + qna_hit + "</td>");
		sbHtml.append("<td>&nbsp;</td>");
		sbHtml.append("</tr>");
		
	};
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
	<h3>게시판</h3>
	<p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
	<div class="contents_sub">
		<div class="board_top">
			<div class="bold">총 <span class="txt_orange"><%= totalRecord %></span>건</div>
		</div>

		<!--게시판-->
		<div class="board">
			<table>
			<tr>
				<th width="3%">&nbsp;</th>
				<th width="5%">번호</th>
				<th>제목</th>
				<th width="10%">글쓴이</th>
				<th width="17%">등록일</th>
				<th width="5%">조회</th>
				<th width="3%">&nbsp;</th>
			</tr>
<%= sbHtml.toString() %>
			</table>
		</div>	

		<div class="btn_area">
			<div class="align_right">
				<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='./write.do'" />
			</div>
		</div>
		<!--//게시판-->
		
		
		
		
		
		
		<!--페이지넘버-->
		<div class="paginate_regular">
			<div align="absmiddle">
	
	
<%
	startPageNum = cpage - (cpage - 1) % recordPerPage;
	lastPageNum = cpage - (cpage - 1) % recordPerPage + recordPerPage - 1;
	if(lastPageNum >= totalPage) {
		lastPageNum = totalPage;
	}

	// 왼쪽 겹꺽쇄
	if(startPageNum == 1) {
		out.println("<span><a>&lt;&lt;</a></span>");
	} else {
		out.println("<span><a href='./list.do?cpage=" + (startPageNum - recordPerPage ) + "'>&lt;&lt;</a></span>");
	}
	
	out.println("&nbsp;");

				
	// 하단의 왼쪽 꺽쇄 클릭하면 이전 페이지로 이동하는 코드 / 1페이지에서는 이동x
	if(cpage == 1) {
		out.println("<span><a>&lt;</a></span>");
	} else {
		out.println("<span><a href='./list.do?cpage=" + (cpage - 1) + "'>&lt;</a></span>");
	}
	
	out.println("&nbsp;&nbsp;");

	//
	for(int i = startPageNum ; i <= lastPageNum; i++) {
		
		// 현재페이지 번호만 각괄호로 표현
		if( i == cpage) {
			out.println("<span><a>[ " + i + " ]</a></span>");
		} else {
			out.println("<span><a href='./list.do?cpage=" + i + "'>" + i + "</a></span>");
		}
	}
	
	out.println("&nbsp;&nbsp;");
	
	// 하단의 오른쪽 꺽쇄 클릭하면 다음 페이지로 이동 / 마지막 페이지에서는 이동x
	if(cpage == totalPage) {
		out.println("<span><a>&gt;</a></span>");
	} else {
		out.println("<span><a href='./list.do?cpage=" + (cpage + 1) + "'>&gt;</a></span>");
	}
	
	out.println("&nbsp;");
	
	// 오른쪽 겹꺽쇄 클릭하면 다음 페이지 번호묶음으로 이동
	if(startPageNum == totalPage) {
		out.println("<span><a>&gt;&gt;</a></span>");
	} else {
		out.println("<span><a href='./list.do?cpage=" + (recordPerPage + 1 ) + "'>&gt;&gt;</a></span>");
	}

%>				
					
					 
				</div>
			</div>
			<!--//페이지넘버-->

		
		
	
		
	</div>
</div>
<!--//하단 디자인 -->

</body>
</html>
