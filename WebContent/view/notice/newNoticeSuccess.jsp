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
	<style>
		#wrb{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
	 	#list{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	</style>

<body>
<%@ include file="../module/top00.jsp" %>

<%--
 WriteNoticeHandler 컨트롤러에 의해 아래와 같이 Model받았다
 	int newNoticeNo : article테이블 입력된 글번호
 	request.setAttribute("newNoticeNo", newNoticeNo);
 	request.setAttribute("rowSize", rowSize); //로우사이즈
 --%>
<%--  rowSize=${rowSize} --%>
<%--  <a href="<%=request.getContextPath()%>/index.jsp">HOME</a> --%>
<p class="home" style="margin:0 auto; max-width: 950px;">
<%-- <a href="<%=request.getContextPath()%>/view/main.jsp">HOME</a> --%>
<a href="<%=request.getContextPath()%>/chat.do">HOME</a>
</p>
 <hr/>
<!--  <h3>입력성공!!!(newNoticeSuccess.jsp)</h3> -->
 	 <%----%>
 	 <c:set var="변수명" value="변수값"/>
 	 <c:set var="pageNo" 
 	    value="${(empty param.pageNo)?'1':param.pageNo}"/>                      
<div style="text-align:center;"> 	 
<%--  	 	<a href="<%=request.getContextPath()%>/notice/list.do?pageNo=1&rowSize=${rowSize}">목록보기</a> --%>
 	 	<button type="button" id="list" onclick="location.href='<%=request.getContextPath()%>/notice/list.do?pageNo=1&rowSize=${rowSize}'">목록보기</button>
<%--  	 	<a href="<%=request.getContextPath()%>/notice/read.do?no=${newNoticeNo}&pageNo=1&rowSize=${rowSize}">작성한 글 보기</a> --%>
 	 	<button type="button" id="wrb" onclick="location.href='<%=request.getContextPath()%>/notice/read.do?no=${newNoticeNo}&pageNo=1&rowSize=${rowSize}'">작성한 글 보기</button>
</div>

 	 	<script>
 	 	$(document).ready(function(){
	 		//let pageNoVal = ${pageNo};
			//let rowSizeVal = ${rowSize}; 
			
// 			let pageNoVal =  "<c:out value = '${pageNo}'/>";
// 			let rowSizeVal =  "<c:out value = '${rowSize}'/>";
			alert("작성완료");
// 			//alert("22222222222222222"+rowSizeVal);
			<%-- location.href="<%=request.getContextPath()%>/notice/list.do?pageNo="+pageNoVal+"&rowSize="+rowSizeVal; --%>
        	
 	 	});
        </script>



<%@ include file="../module/bottom00.jsp" %>
</body>
</html>






