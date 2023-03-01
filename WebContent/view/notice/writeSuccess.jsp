<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
 <meta charset="UTF-8">
 <meta name="description" content="member board Web Application">
 <meta name="keywords" content="member, board, article, mvc">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title></title>
 <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/font-awesome.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/templatemo-hexashop.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/owl-carousel.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/lightbox.css">
    
    
    <script src="<%=request.getContextPath()%>/assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="<%=request.getContextPath()%>/assets/js/popper.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="<%=request.getContextPath()%>/assets/js/owl-carousel.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/accordions.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/datepicker.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/scrollreveal.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/jquery.counterup.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/imgfix.min.js"></script> 
    <script src="<%=request.getContextPath()%>/assets/js/slick.js"></script> 
    <script src="<%=request.getContextPath()%>/assets/js/lightbox.js"></script> 
    <script src="<%=request.getContextPath()%>/assets/js/isotope.js"></script> 
    
    <!-- Global Init -->
    <script src="<%=request.getContextPath()%>/assets/js/custom.js"></script>

</head>
<body>
<%@ include file="../module/top00.jsp" %>


<%--
 컨트롤러에 의해 아래와 같이 Model받았다
 ModifyRequest writeReq(로그인한userid,글번호,db의작성자명,db의title,db의내용)
		request.setAttribute("modReq", modReq);
 --%>
<%--  <a href="<%=request.getContextPath()%>/index.jsp">HOME</a> --%>
<p class="home" style="margin:0 auto; max-width: 950px;">
<%-- <a href="<%=request.getContextPath()%>/view/main.jsp">HOME</a> --%>
<a href="<%=request.getContextPath()%>/chat.do">HOME</a>
</p>
 <hr/>
<!--  <h3>쓰기성공!!!(writerSuccess.jsp)</h3> -->
 	 <%--
 	 <c:set var="변수명" value="변수값"/>
 	 <c:set var="pageNo" 
 	    value="${(empty param.pageNo)?'1':param.pageNo}"/>                      
 	 
 	 	<a href="/notice/list.do?pageNo=${pageNo}&rowSize=3">목록보기(rowSize파라미터설정해야함)</a>--%>
 	 	<%-- 수정과 삭제기능은
 	 	  로그인한 유저의 id와 작성자의 id가 일치하는 경우에만 노출하도록 한다 
 	 	<c:if test="${AUTHUSER.memberid==noticeData.notice.writer.writer_id}">
	 	 	<a href="/notice/modify.do?no=${noticeData.notice.number}&pageNo=${pgNo}&rowSize=${rowSize}">글수정</a>
	 	 	<a href="/notice/delete.do?no=${noticeData.notice.number}">글삭제(delete용)</a>
	 	 	<a href="/notice/delete2.do?no=${noticeData.notice.number}">글삭제(update용)</a>
 	 	</c:if>
 	 	--%>

<%@ include file="../module/bottom00.jsp" %>
</body>
</html>






