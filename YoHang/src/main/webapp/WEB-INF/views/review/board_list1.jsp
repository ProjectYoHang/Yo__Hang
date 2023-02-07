<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.example.model.RvBoardTO"%>

<%@ page import="java.util.ArrayList" %>

<%	
	ArrayList<RvBoardTO> rvLists = (ArrayList<RvBoardTO>)request.getAttribute("rvLists");

	int totalRecord = (Integer)request.getAttribute("totalRecord");

	int cpage = (Integer)request.getAttribute("cpage");

	int lastPage = (Integer)request.getAttribute("lastPage");

	int startPageNum = (Integer)request.getAttribute("startPageNum");
	int lastPageNum = (Integer)request.getAttribute("lastPageNum");

	int recordPerPage = (Integer)request.getAttribute("recordPerPage");

	int totalPage = ((totalRecord - 1) / recordPerPage) + 1;
	StringBuilder sbHtml = new StringBuilder();
		
	for(int i = 0; i < rvLists.size(); i++) {
		
		RvBoardTO rvList = rvLists.get(i);
		
		String rv_seq = rvList.getRv_seq();
		String rv_subject = rvList.getRv_subject();
		String rv_content = rvList.getRv_content();
		String rv_id = rvList.getRv_id();
		String rv_date = rvList.getRv_date();
		String rv_img_name = rvList.getRv_img_name();
		int wgap = rvList.getWgap();
		
		if(i % 3 ==0) {
			sbHtml.append( "<tr>" );
		}
		sbHtml.append( "	<td class='last2'>" );
		sbHtml.append( "		<div class='board'>" );
		sbHtml.append( "			<table class='boardT'>" );
		sbHtml.append( "			<tr>" );
		sbHtml.append( "				<td class='boardThumbWrap'>" );
		sbHtml.append( "					<div class='boardThumb'>" );
		if( rv_seq.equals( "" ) ) {
			sbHtml.append( "						<img src='../../images/noimage.jpg' border='0' width='200' />" );
		} else {
			sbHtml.append( "						<a href='./view.do?rv_seq=" + rv_seq + "'><img src='../upload/" + rv_img_name + "' border='0' width='200' /></a>" );
		}
		sbHtml.append( "					</div>" );
		sbHtml.append( "				</td>" );
		sbHtml.append( "			</tr>" );
		sbHtml.append( "			<tr>" );
		sbHtml.append( "				<td>" );
		sbHtml.append( "					<div class='boardItem'>" );
		if( rv_seq.equals( "" ) ) {
			sbHtml.append( "						<strong></strong>" );
			sbHtml.append( "						<span class='coment_number'></span>" );
		} else {
			sbHtml.append( "						<strong>" + rv_subject +"</strong>" );
			if( wgap <= 1 ) {
				sbHtml.append( "						<img src='../../images/icon_new.gif' alt='NEW'>") ;
			}
		}
		sbHtml.append( "					</div>" );
		sbHtml.append( "				</td>" );
		sbHtml.append( "			</tr>" );
		sbHtml.append( "			<tr>" );
		sbHtml.append( "				<td><div class='boardItem'><span class='bold_blue'>" + rv_id + "</span></div></td>" );
		sbHtml.append( "			</tr>" );
		sbHtml.append( "			<tr>" );
		sbHtml.append( "				<td>" );
		if( rv_seq.equals( "" ) ) {
			sbHtml.append( "					<div class='boardItem'></div>" );
		} else {
			sbHtml.append( "					<div class='boardItem'>" + rv_date + "</div>" );
		}
		sbHtml.append( "				</td>" );
		sbHtml.append( "			</tr>") ;
		sbHtml.append( "		</table>" );
		sbHtml.append( "	</div>" );
		sbHtml.append( "</td>" );
		
		if( i%3 == 2 ) {
			sbHtml.append( "</tr>" );
		}
		
		

	}
	
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board_list.css">
<style type="text/css">
<!--
	.board_pagetab { text-align: center; }
	.board_pagetab a { text-decoration: none; font: 12px verdana; color: #000; padding: 0 3px 0 3px; }
	.board_pagetab a:hover { text-decoration: underline; background-color:#f2f2f2; }
	.on a { font-weight: bold; }
-->
</style>
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
		<div class="board_top">
			<div class="bold">
				<p>총 <span class="txt_orange"><%= totalRecord %></span>건</p>
			</div>
		</div>	
		
		<!--게시판-->
		<table class="board_list">
		<%=sbHtml %>
		</table>
		
		
		 <!-- navigation -->
        <nav class="w-100">
          <ul class="pagination justify-content-center">
		
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

			</ul>
        </nav>		
        

		
		<div class="align_right">		
			<button type="button" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='./write.do'">쓰기</button>
		</div>
		<!-- 페이지 -->
		<div class="paginate_regular">
			<div class="board_pagetab" align="middle">

			</div>
		</div>
		<!-- //페이지 -->
	</div>
</div>
<!--//하단 디자인 -->

</body>
</html>