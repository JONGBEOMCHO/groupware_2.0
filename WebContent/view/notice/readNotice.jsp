<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
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
		table {
	    width: 800px;
	    height: 600px;
	    margin-left: auto;
	    margin-right: auto;
	 	}
	 	th {
	    text-align: center;
/* 	    border: 1px solid #EFEFEF; */
	    background: #C5CAD7;
	    width : 190px;
	 	}
	 	
	 	.c {
	    text-align: left;
/* 	    border: 1px solid #EFEFEF; */
/* 	    background: #C5CAD7 */
		padding-left : 5px; 
	 	}
	 	
	 	
	 	#list{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	#mod{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	#del{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
        </style>
    
    
    

        <script>
        	$(document).ready(function(){

        	});
        	
        	function mdAuthCheck(gr){
        		//gr=999;
        		if(gr=null || gr=='1'){
        			alert("????????? ????????????.");
        			location.href='<%=request.getContextPath()%>/notice/read.do?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}else{
        			location.href='<%=request.getContextPath()%>/notice/modify.do?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}
        	}
        	
        	
        	function rmAuthCheck(gr){
        		//gr=999;
        		if(gr=null || gr=='1'){
        			alert("????????? ????????????.");
        			location.href='<%=request.getContextPath()%>/notice/read.do?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}else{
        			location.href='<%=request.getContextPath()%>/notice/delete.do?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}
        	}
        	
        	
        	function rmAuthCheck2(gr){
        		//gr=999;
        		if(gr=null || gr=='1'){
        			alert("????????? ????????????.");
        			location.href='<%=request.getContextPath()%>/notice/read.do?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}else{
        			location.href='<%=request.getContextPath()%>/notice/delete2.do?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}
        	}
<%--         	location.href="<%=request.getContextPath()%>/notice/list.do"; // --%>
        </script>
        

</head>
<body>
<%@ include file="../module/top00.jsp" %>


<%-- ??????????????? ?????? ????????? ?????? Model ?????????.
		request.setAttribute("noticeData", noticeData);//notice???????????? notice_content?????????
		request.setAttribute("pageNo", pageNo);//???????????????
		request.setAttribute("rowSize", rowSize);//1???????????? ????????????
*??????:${noticeData}<br/><br/>
*???????????????:${pageNo}<br/><br/>
*1???????????? ????????????:${rowSize}<br/><br/>--%>

<%-- ${AUTHUSER.emp_grade} --%>


<%--  <a href="<%=request.getContextPath()%>/index.jsp">HOME</a> --%>
<%--  <a href="<%=request.getContextPath()%>/chat.do">HOME</a> --%>
<!-- <p class="home" style="text-align: left; margin-left:150px;"> -->
<p class="home" style="margin:0 auto; max-width: 950px;">
<%-- <a href="<%=request.getContextPath()%>/view/main.jsp">HOME</a> --%>
<a href="<%=request.getContextPath()%>/chat.do">HOME</a>
</p>
 <hr/>

<br/><br/>
<!--  <h3>readNotice.jsp</h3> -->
 <table border="1" style="text-align:center;">
<!--  <table border="1"> -->
 	<tr style="height:50px;">
 		<th class="h">????????? ??????</th>
 		<td class="c">${noticeData.notice.number}</td>
 	</tr>
 	
 	 <tr style="height:50px;">
 		<th class="h">????????????</th>
 		<td class="c">${noticeData.notice.writer.writer_name}</td>
 	</tr>
 	
 	 <tr style="height:50px;">
 		<th class="h">?????? ?????????</th>
<%--  		<td>${noticeData.notice.regdate}</td> --%>
 		<td class="c"><fmt:formatDate pattern="yyyy??? MM??? dd???  HH:mm:ss" type="date" value="${noticeData.notice.regdate}" /></td>
 	</tr>
 	
 	<tr style="height:50px;">
 		<th class="h">????????? ?????????</th>
<%--  		<td>${noticeData.notice.regdate}</td> --%>
 		<td class="c"><fmt:formatDate pattern="yyyy??? MM??? dd???  HH:mm:ss" type="date" value="${noticeData.notice.moddate}" /></td>
 	</tr>
 	
 	
 	 <tr style="height:50px;">
 		<th class="h">??????</th>
 		<td class="c">${noticeData.notice.title}</td>
 	</tr>
 	
 	 <tr>
 		<th class="h">??????</th>
 		<td class="c" style="white-space: pre-wrap;"><u:pre value="${noticeData.content.content}"/>
 		<br/>
 		<br/>
 		<br/>
 		<br/>
 		<br/>
 		<br/>
 		<br/></td>
 	</tr>
 	
 	 <tr style="height:50px;">
 		<th class="h">????????????</th>
 		<td class="c">
		<c:if test="${noticeFile ne null}">
<%--  		<a href="<c:url value='${request.getServletContext().getRealPath("/upload")}/${noticeFile.file_name}'/>"></a> --%>
<%-- 		<img title="${noticeFile.file_name}" class="file-img" src="../assets/images/clip2.png" width="20px" height="20px"/>
 					${noticeFile.file_name} --%>
<%--			<a href="${request.getServletContext().getRealPath("/upload")}/${noticeFile.file_name}" download>
 			<img title="${noticeFile.file_name}" class="file-img" src="../assets/images/clip2.png" width="20px" height="20px"/>
 			${noticeFile.file_name}</a>--%>
 			<a href="<c:url value='${request.getServletContext().getRealPath("/upload")}/notice/download.dong?fileName=${noticeFile.file_name}'/>">
 			<img title="${noticeFile.file_name}" class="file-img" src="../assets/images/clip2.png" width="20px" height="20px"/>
 			${noticeFile.file_name} &nbsp;&nbsp; (${finalUnit})</a>
 		</c:if>
 		</td>
 	</tr>

 	 <tr style="height:50px;">
 		<td colspan="2" style="text-align:center;" class="c">
 		<%--pp662 29?????? 
 		<c:set var="?????????" value="?????????"/> 
 		<%--
 		<c:set var="pageNo" value="${?????????????????????????:???????????????}"/>
 		
 		result="???????"1":"100"
 		String result=null;
 		if(??????){
 			??????????????????
 			result="1";
 		}else{
 			???????????????
 			result="100";
 		}
 		syso(result);--%>
 		
 		<c:set var="pageNo" value="${(empty param.pageNo)?'1':param.pageNo}"/>
 		<!--???????????? pageNo?????? ??????????????? 1??? ???????????? ????????? ????????? (???????????? ?????? ?????? ?????????) ??? ????????? ????????????~~
 		 * ListNoticeHandler??? ?????? ????????? ???????????? ????????? ?????? ??? ?????????.
		 * pageNo.isEmpty() = empty param.pageNO ??? ?????? ?????? -->
		 
		<%--pageNo=${pageNo}<br/> --%>

 		

 		
<%--  		<a href="<%=request.getContextPath()%>/notice/list.do?pageNo=${pageNo}&rowSize=${rowSize}">????????????</a> --%>
 		<button type="button" id="list" onclick="location.href='<%=request.getContextPath()%>/notice/list.do?pageNo=${pageNo}&rowSize=${rowSize}';">????????????</button>
 		<%--????????? ??????????????? ???????????? ????????? id??? ???????????? id??? ???????????? ???????????? ??????????????? ??????. --%>
 		<%-- <c:if test="${AUTHUSER.memberid==noticeData.notice.writer.writer_id}"> --%>
 		<c:if test="${AUTHUSER.emp_id==noticeData.notice.writer.writer_id}">
<%--  		<a href="<%=request.getContextPath()%>/notice/modify.do?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}">????????? ??????</a> --%>
 		<button type="button" id="mod" onclick="mdAuthCheck(${AUTHUSER.emp_grade});">????????? ??????</button>
 		
<%--  		<a href="<%=request.getContextPath()%>/notice/delete.do?no=${noticeData.notice.number}">?????????(delete???)</a> --%>
 		<button type="button" id="del" onclick="rmAuthCheck(${AUTHUSER.emp_grade});">????????? ??????</button>
<%--  		<button type="button" onclick="rmAuthCheck(${AUTHUSER.grade});">????????? ??????(delete)</button> --%>
 		</c:if>
<%--  		<a href="<%=request.getContextPath()%>/notice/delete2.do?no=${noticeData.notice.number}">?????????(update???)</a> --%>
<%--  		<button type="button" onclick="rmAuthCheck2(${AUTHUSER.grade});">????????? ??????(update)</button>  //????????? ??????????????? ???????????? --%>
 		<%-- </c:if>--%>
 		</td>
 	</tr>
 </table>
 
 
<!--  <table> -->
<!--     <tr> -->
<!--         <th colspan="2">?????? ??????</th> -->
<!--     </tr> -->
<%--     <c:choose> --%>
<%--         <c:when test="${message != null }"> --%>
<!--             <tr> -->
<%--                 <td>${message }</td> --%>
<!--             </tr> -->
<%--         </c:when> --%>
<%--         <c:otherwise> --%>
<%--             <c:forEach var="list" items="${list }"> --%>
<!--                 <tr> -->
<%--                     <td><font size="1.5"><b>${list.cid }</b> --%>
<%--                         ${list.ctime } --%>
<%--                         <c:if test = "${sessionId.id == list.cid }"> --%>
<!--                             <b> -->
<%--                                 <a href="javascript:open_win('BoardServlet?command=comment_edit_delete&cnum=${list.cnum }','noname')">[??????/??????]</a> --%>
<!--                             </b> -->
<%--                         </c:if> --%>
<!--                         </font> -->
<!--                         <br> -->
<%--                             ${list.ccontent } --%>
<!--                     </td> -->
<!--                 </tr> -->
<%--             </c:forEach> --%>
<%--         </c:otherwise> --%>
<%--     </c:choose> --%>
<!-- </table> -->



<%-- <form action = "BoardServlet" method = "post" name = "check">
<input type = "hidden" name = "command" value = "comment_write">
<input type = "hidden" name = "pnum" value = "${param.num }">
<table>
    <tr>
        <th>??????</th>
        <td><textarea rows="3" cols="40" name = "c_content"></textarea></td>
    
        <td><input type = "submit" value = "????????????" onclick = "return com_check()"></td>
    </tr>
</table>
</form>
 
<c:forEach var="i" begin = "1" end ="${totalCount }" step="1">
    <a href="BoardServlet?command=board_view&num=${param.num }&page=${i}">[${i}]</a>
</c:forEach>
 
<br><br>
<input type = "button" value = "??????" onclick = "location.href='BoardServlet?command=board_list'">
<c:if test = "${sessionId.id == sVo.mid }">
<input type = "button" value = "??????" onclick = "open_win('BoardServlet?command=board_pass&num=${sVo.num}','update')">
<input type = "button" value = "??????" onclick = "open_win('BoardServlet?command=board_pass&num=${sVo.num}','delete')">
<input type = "button" value = "??????" onclick = "open_win('BoardServlet?command=board_reply_form&num=${sVo.num}','reply')">
</c:if> --%>
 
 
 
 
<%@ include file="../module/bottom00.jsp" %>
</body>
</html>






