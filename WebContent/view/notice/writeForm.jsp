<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    
    <style>
        .error {color:red;font-size:0.8em;}
		table {
	    width: 800px;
	    height: 600px;
	    margin-left: auto;
	    margin-right: auto;
	 	}
	 	textarea{ width:98%; border:0; resize: none;}
    </style>

</head>
<body>
<%@ include file="../module/top00.jsp" %>


<%-- writeNoticeHandler 컨트롤러에 의해 아래와 같이 Model 받았다.
	 class User {
	 	private int memberno; //회원번호
	 	private String memberid; //id
	 	private String membername; //이름
	 	private int memberno; //회원등급. 기본1. 1(정상), 2(강퇴), 3(탈퇴), 4(휴면), 999(관리자)
	 request.setAttribute("AUTHUSER", authUser);
	 
	//에러정보
	errors.put("title", Boolean.TRUE);
	errors.put("content", Boolean.TRUE);
	request.setAttribute("errors", errors);

*DB내용:${noticeData}<br/><br/>
*요청페이지:${pageNo}<br/><br/>
*1페이지당 게시글수:${rowSize}<br/><br/> --%>
<%-- ${writeReq}<br/><br/> --%>

<%--  <a href="<%=request.getContextPath()%>/index.jsp">HOME</a> --%>
 <a href="<%=request.getContextPath()%>/view/main.jsp">HOME</a>
 <hr/>
 <h3>writeForm.jsp</h3>
 <form name="writeFrm" id= "writeFrm"
 		method="post" action="<%=request.getContextPath()%>/notice/write.do">
 <input type="hidden" name="rowSize" value="${rowSize}"/> 
 
 <table border="1">
 	 <tr>
 		<th>작성자명</th>
 		<td>${AUTHUSER.emp_kname}</td>
 	</tr>

 	 <tr>
 		<th>제목</th>
 		<td><%-- ${noticeData.notice.title} --%>
 		<input type="text" name="title" id="title" style="width:480px; height:20px"/>
 		<span class="error"><c:if test="${errors.title}">제목을 입력하세요</c:if></span>
 		</td>
 	</tr>
 	
 	 <tr>
 		<th>내용</th>
 		<td>
 		<textarea name="content" id="content" rows="20" cols="70" autofocus></textarea>
 		<span class="error"><c:if test="${errors.content}">내용을 입력하세요</c:if></span>
 		
 		</td>
 	</tr>
 	
 	 <tr>
 		<td colspan="2" style="text-align:center;">
 		<input type="submit" value="글쓰기"/>
 		</td>
 	</tr>
 	
 	 <tr>
 		<td colspan="2" style="text-align:center;">
 		<a href="<%=request.getContextPath()%>/notice/list.do?pageNo=1&rowSize=${rowSize}">목록보기</a>
<%--  		<a href="/notice/read.do?no=글번호&pageNo=1&rowSize=${rowSize}">글 상세조회(모델보면서 보완예정)</a> --%>
<!--  		<a href="/notice/delete.do?no=글번호">글삭제(delete용)</a> -->
<!--  		<a href="/notice/delete2.do?no=글번호">글삭제(update용)</a> -->
 		</td>
 	</tr>
 	
 
 </table>
 <%--
 		<input type="hidden" name="no" id="no" value="${modReq.noticeNumber}"/>
 		<input type="hidden" name="writer_name" id="writer_name" value="${modReq.writer_name}"/>  
 		<!-- 런타임 익셉션 떨어져서 숨기고 no이름 값으로 속성을 안보이게 넘긴다.히든!! 위에 no값은 form태그 안에만 있으면 어디든 위치는 오케이다-->
 		 여기에서는 작성자명을 수정처리컨트롤러에 넘기는 방식으로 추가하였다.
 		현재방식이라면 DB의 작성자명과 세션에 담긴 이름이 동일하므로 세션으로 대체해도 된다 --%>
 </form>


<%@ include file="../module/bottom00.jsp" %>
</body>
</html>






