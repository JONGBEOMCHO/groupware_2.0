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
     </head>
    
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
* {
	 font-weight:bold;
	 font-size: 1.0rem;
	 }
div {
	padding: 10px;
	box-shadow: 0px 0px 5px 0px gray;
	width: 100%;
}
table{
	border-radius: 10px;
	text-align:center;
	width: 100%;
}
.short{
 white-space: nowrap;
 overflow: hidden;
 text-overflow: ellipsis;
}
</style>
<body>

<%--  <%@ include file="./module/top00.jsp" %> --%>

<input type="hidden" id="emp_no" name="emp_no" value="${AUTHUSER.emp_no}">
<form name="rowSizeFrm" id="rowSizeFrm"
		action="/document/listDocument.do" method="get">
	</form>
	
	<br>
	<table border="1">
		<thead>
			<tr>
				<th>????????????</th>
				<th>??????</th>
				<th>????????????</th>
				<th>??????</th>
				<th>??????</th>
				<th>??????</th>
				<th>?????????</th>
				<th>????????????</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${documentPage.hasNoDocuments() }">
				<tr>
					<td colspan="8" style="text-align: center;">??????????????? ????????????.</td>
				</tr>
			</c:if>
			
			
			
	 	<c:if test="${!documentPage.hasNoDocuments() }">
				<c:forEach var="item" items="${documentPage.content}">
					<tr>
						<td><c:out value=" ${item.do_no}" /></td>
						<td><a href="/document/read.do?no=${item.do_no}&pageNo=${documentPage.currentPage}&rowSize=${rsize}"><c:out value=" ${item.title}" /></a></td>
						<td><c:out value=" ${item.draft_empno}" /></td>
						<td><c:out value=" ${item.writer.emp_kname}"/></td>
						<td><c:out value=" ${item.writer.dept_name}"/></td>
						<td><p class="short" ><c:out value=" ${item.writer.emp_position}"/></p></td>
						<td><c:out value=" ${item.draft_date}" /></td>
						<td><span><c:out value=" ${item.stat_no}" /></span></td>
					</tr>
				</c:forEach>
			</c:if>  
			</tbody>
			<tr>
			 	<td colspan="8" style="text-align: center;">
					 <c:if test="${documentPage.startPage>5}">
						<a	href="/document/listDocument.do?pageNo=${documentPage.startPage-5}&rowSize=${rsize}">prev</a>
					</c:if> <!-- JSTL forEch?????????: ?????????????????????  --><c:forEach var="pNo"
						begin="${documentPage.startPage}" end="${documentPage.endPage}">
						<a href="/document/listDocument.do?pageNo=${pNo}&rowSize=${rsize}">${pNo}</a>
					</c:forEach> <!-- JSTL if?????????: ???????????? --> 
					<c:if test="${documentPage.endPage<documentPage.totalPages}">
						<a
							href="/document/listDocument.do?pageNo=${documentPage.startPage+5}&rowSize=${rsize}">next</a>
					</c:if>
				</td> 
			</tr>
		
	</table> 
	<script> 
$("span:contains(' 2')").css({color:"red"});
$("span:contains(' 1')").html("??????");
$("span:contains(' 2')").html("??????");
$("p:contains(' 1')").html("??????");
$("p:contains(' 2')").html("??????");
$("p:contains(' 3')").html("??????");
$("p:contains(' 4')").html("??????");
$("p:contains(' 5')").html("??????");

</script>

</body>
</html>






