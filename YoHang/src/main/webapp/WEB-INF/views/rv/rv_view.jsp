<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.example.model.RvBoardTO"%>

<%@ page import="java.util.ArrayList" %>
<%
	//jsp hero parameters
	String menuName = "Board";
	String title = "Review";

	// jsp header parameters
	String home = "/home.do";
	String aboutus = "/aboutus.do";
	String findus = "/findus.do";
	String qna = "/qna/list.do";
	String faq = "/faq/list.do";
	String notice = "/notice/list.do";
	String rv = "/rv/list.do";
	String login = "/login.do";
	String logout = "/logout.do";
	String mypage = "/mypage";
	RvBoardTO to = (RvBoardTO)request.getAttribute("to");
	
    //int cpage = Integer.parseInt((String)request.getAttribute("cpage"));
    
	String cpage = (String)request.getAttribute("cpage");
	String rv_seq = (String)request.getAttribute("rv_seq");
	
	String rv_subject = to.getRv_subject();
	String rv_id = to.getRv_id();
	String rv_date = to.getRv_date();
	String rv_content = to.getRv_content();
	//String rv_img_name = to.getRv_img_name();
	String rv_img_name = to.getRv_img_name()== null ? "../../upload/reviews/noimage.jpeg" : "../../upload/reviews/" + to.getRv_img_name();
%>

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/head.jsp" flush="false"/>

<body>
<!--
// header --------------------------------------->
<jsp:include page="../common/header.jsp" flush="false">
	<jsp:param value="<%= home %>" name="home"/>
	<jsp:param value="<%= aboutus %>" name="aboutus"/>
	<jsp:param value="<%= findus %>" name="findus"/>
	<jsp:param value="<%= qna %>" name="qna"/>
	<jsp:param value="<%= faq %>" name="faq"/>
	<jsp:param value="<%= notice %>" name="notice"/>
	<jsp:param value="<%= rv %>" name="rv"/>
	<jsp:param value="<%= login %>" name="login"/>
	<jsp:param value="<%= logout %>" name="logout"/>
	<jsp:param value="<%= mypage %>" name="mypage"/>
</jsp:include>

<!-- hero-wrap -->
<jsp:include page="../common/hero.jsp" flush="false">
	<jsp:param value="<%= menuName %>" name="menuName"/>
	<jsp:param value="<%= title %>" name="title"/>
	<jsp:param value="<%= home %>" name="home"/>
</jsp:include>

<!--
// contents --------------------------------------->

<!-- content -->
<section class="ftco-section">
  <div class="container">
    <h3 class="board-view-title"><%= rv_subject %> </h3>
    <ul class="board-info-group">
      <li class="d-md-inline board-view-writer">
        <strong>작성자</strong>
        <span><%= rv_id %></span>
      </li>
      <li class="board-view-writer">
        <strong>작성일</strong>
        <span><%= rv_date %></span>
      </li>
    </ul>

    <div  style="display:flex; align-item:center; justify-content: space-between;">
   		<div id="bbs_file_wrap"  style="width:40%;">
<<<<<<< HEAD:YoHang/src/main/webapp/WEB-INF/views/rv/board_view1.jsp
			<div>
				<img src="../../upload/reviews/<%= rv_img_name %>" width="100%" onerror="" /><br />
			</div>
=======
				<div>
					<c:if test="${rv_img_name != NULL }">
            			<img src="../../upload/reviews/<%= rv_img_name %>" width="100%" onerror="" /><br />
            		</c:if>
            		<c:if test="${rv_img_name == NULL }">
            			<img src="" width="100%" onerror="" /><br />
            		</c:if>	
				</div>
	<!--
				<c:if test="${rv_img_name != null }">
            		<img src="../../upload/reviews/<%= rv_img_name %>" width="100%" onerror="" /><br />
            	</c:if>
            	<c:if test="${rv_img_name == null }">
            	</c:if>	
	
	<img src="../upload/reviews/<%= rv_img_name %>" width="150%"  onerror="" /><br />
	-->
		
		</div> 
    <div  style="width:25%;" display: flex; align-items: center;>
>>>>>>> master:YoHang/src/main/webapp/WEB-INF/views/rv/rv_view.jsp
		</div> 
    <div  style="width:50%;" display: flex; align-items: center;>
      <%= rv_content %>
    </div>
    </div>


    <div class="text-center mt-4 pt-5 border-top">
      <a href="./modify.do?cpage=<%= cpage %>&rv_seq=<%= rv_seq %>" class="btn btn-primary btn-lg">수정</a>
      <a href="./delete.do?cpage=<%= cpage %>&rv_seq=<%= rv_seq %>" class="btn btn-outline-primary btn-lg">삭제</a>
      <a href="./list.do?cpage="1" class="btn btn-primary btn-lg">목록</a>
    </div>
		</div>
		<!--//게시판-->
	</div>
<!-- 하단 디자인 -->
</div>
</section>
<!--
// instagram --------------------------------------->
<section class="instagram pt-5">
  <div class="container-fluid">
    <div class="row no-gutters justify-content-center pb-5">
      <div class="col-md-7 text-center heading-section ftco-animate">
        <h2><span>Instagram</span></h2>
      </div>
    </div>
    <div class="row no-gutters">
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../../YoHangFront/build/images/insta-1.jpg" class="insta-img image-popup" style="background-image: url(../../../YoHangFront/build/images/insta-1.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../../YoHangFront/build/images/insta-2.jpg" class="insta-img image-popup" style="background-image: url(../../../YoHangFront/build/images/insta-2.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../../YoHangFront/build/images/insta-3.jpg" class="insta-img image-popup" style="background-image: url(../../../YoHangFront/build/images/insta-3.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../../YoHangFront/build/images/insta-4.jpg" class="insta-img image-popup" style="background-image: url(../../../YoHangFront/build/images/insta-4.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
      <div class="col-sm-12 col-md ftco-animate">
        <a href="../../../YoHangFront/build/images/insta-5.jpg" class="insta-img image-popup" style="background-image: url(../../../YoHangFront/build/images/insta-5.jpg);">
          <div class="icon d-flex justify-content-center">
            <span class="icon-instagram align-self-center"></span>
          </div>
        </a>
      </div>
    </div>
  </div>
</section>

<!--
// footer --------------------------------------->
<jsp:include page="../common/footer.jsp" flush="false"/>

<!--
// script --------------------------------------->
<script type="text/javascript" src="../../../YoHangFront/build/js/yohang-bundle.js"></script>
<script type="text/javascript" src="../../../YoHangFront/build/vendors/yohang-vendors-bundle.js"></script>


</body>
</html>


