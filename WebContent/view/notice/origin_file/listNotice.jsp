<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="description" content="member board Web Application">
  <meta name="keywords" content="member, board, notice, mvc">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공 지 사 항</title>
        <!-- Download방식으로 jQuery연동 -->
<!--         <script src="./js/jquery-3.6.3.min.js"></script> -->
        <!-- CDN방식으로 jQuery연동 -->
<!--         <script src="https://code.jquery.com/jquery-2.2.4.js"></script> -->
<!--         <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script> -->
        <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
        <style>
		.t1{ 
		width: 950px;
 	    margin-left: auto; 
 	    margin-right: auto; 
  	    border: 1px solid #bcbcbc;
  	    text-align: center;
 	 	} 
 	 	.t2{ 
		width: 950px;
 	    margin-left: auto; 
 	    margin-right: auto; 
  	    border: 1px solid #bcbcbc;
  	    text-align: center;
 	 	} 
 	 	
 	 	.hang{ 
		height:30px;
 	 	} 
	 	
	 	th {
 	    border: 1px solid #bcbcbc;

	 	}
	 	
	 	#nu{ width:50px;
	 	}
	 	#ti{ width:230px;
	 	}
	 	#wr{ width:90px;
	 	}
	 	#wd{ width:150px;
	 	}
	 	#md{ width:230px;
	 	}
	 	#ct{ width:60px;
	 	}
	 	
	 	td {
	    width: 120px;
 	    border: 1px solid #bcbcbc;
	 	}
	 	
	 	
 	 	tr { 
 	    height: 60px; 
	    border: 1px solid #bcbcbc; 
 	 	} 
	 	

	 	
	 	
	 	h1 { text-align: center; }
	 	p { text-align: right; margin-right:200px;}
        
        </style>
        <script>
        	$(document).ready(function(){
//         		alert("asdsd");
        		//게시물 출력수 선택
        		//<select name="rowSize" id="rowSize";">에 이벤트
        		$("#rowSize").change(function(){  //
        			//let val = $("select#rowSize option:selected").val(); //띄어쓰기==>  select의 자식요소 option
        			$("#rowSizeFrm").submit();
        		});
        		
        	});

		
    	    function authCheck(gr){ 
				//alert(gr);
				//gr=999;
 	          if(gr==null || gr==1){ 
	             alert("권한이 없습니다.");
<%--          	             location.replace("<%=request.getContextPath()%>/notice/list.do?rowSize=${rsize}"); --%>
 	             location.href='<%=request.getContextPath()%>/notice/list.do?rowSize=${rsize}';
 	          }else{
<%--          	             location.replace("<%=request.getContextPath()%>/notice/write.do?rowSize=${rsize}"); --%>
 	             location.href='<%=request.getContextPath()%>/notice/write.do?rowSize=${rsize}';
	          }
 	          
	    }
        
        </script>
        
        
        
</head>
<body>

<%-- 컨트롤러에 의해서 아래와 같이 Model을 받았다   23.01.13. 받는 모델을 변경!!!!! listNotice에서 NoticePage로
List<Notice> listNotice=~~~~;
 request.setAttribute("listNotice", listNotice); 
 
 NoticePage noticePage<=목록+페이징처리 관련내용.
 request.setAttribute("noticePage", noticePage);
 request.setAttribute("pageNo", pageNo);
 request.setAttribute("rsize", rsize);
 request.setAttribute("searchPage", searchPage);
 request.setAttribute("choice", choice);
 request.setAttribute("keyword", keyword);
 --%>

<%-- <%=session.getValue("AUTHUSER") %> --%>
<%-- <%=session.getAttribute("AUTHUSER") %> --%>
<%-- <%=session.getAttribute("grade") %> --%>
<%-- <%=session.getValue("AUTHUSER") %> --%>
<%-- ${AUTHUSER.emp_grade} --%>

<%--
${noticePage.getContent()} <hr/><hr/><hr/>
${noticePage.content} <hr/><hr/><hr/> --%>

<%-- ${keyword} --%>




<%-- ${listNotice} <hr/><hr/><hr/><hr/> --%>
<!-- <hr/> -->
<%----%>
<%--   	

	<c:forEach var="item" items="${listNotice}"> 
	<c:if test="${noticePage.hasNotices()}">
  	<c:forEach var="item" items="${noticePage.content}">
 		<c:out value="${item}" /><br/><br/>
 		*글번호 : <c:out value="${item.number}" /><br/><br/>
 		*제목 : <c:out value="${item.title}" /><br/><br/>
 		*작성자 ID : <c:out value="${item.writer.writer_id}" /><br/><br/>
 		*작성자 이름 : <c:out value="${item.writer.writer_name}" /><br/><br/>
 		*작성일 : <c:out value="${item.regdate}" /><br/><br/>
 		*조회수 : <c:out value="${item.read_cnt}" /><br/><br/>
 	</c:forEach>
 	</c:if>
 	
 	--%>
 	<%--Notice 클래스 안에 get메소드를 뽑는 것이다. --%>
<%--  		*작성자id<c:out value="${item.getWriter().writer_id}" /><br/><br/>  
				이렇게 작성 해도 된다.. 그런데 보기 좋게 get지우고 소문자바꾸고 괄호지우고 하는것. 
	 		*작성자이름<c:out value="${item.getWriter().writer_name}" /><br/><br/> 
 	<br/><br/><br/><br/><br/><br/>--%>


<%-- <a href="<%=request.getContextPath()%>/index.jsp">HOME</a> --%>
<a href="<%=request.getContextPath()%>/view/main.jsp">HOME</a>
<hr/>
 <h1>공  지  사  항</h1>
 
 
 <form name="rowSizeFrm" id="rowSizeFrm" action="<%=request.getContextPath()%>/notice/list.do" method="post">
 	<p>게시물수 : 
	<select name = "rowSize" id = "rowSize" >
<!-- 			<option value="" selected disabled hidden></option> -->
			<option value="" disabled>선택</option>
			<option value="1" <c:if test="${rsize == 1}">selected</c:if>>1</option>
         	<option value="3" <c:if test="${rsize == 3}">selected</c:if>>3</option>
         	<option value="5" <c:if test="${rsize == 5}">selected</c:if>>5</option>
         	<option value="10" <c:if test="${rsize == 10}">selected</c:if>>10</option>
    </select> 
    </p>
 </form>
 
 

 
 <p>

 	
 	<button type="button" onclick="authCheck(${AUTHUSER.emp_grade});">글쓰기</button>
 </p>
 <table class="t1" style="table-layout: fixed">
 	<thead>
 		<tr class="hang">
 			<th id="nu">번호</th>
 			<th id="ti">제목</th>
 			<th id="wr">작성자</th>
 			<th id="rd">작성일</th>
 			<th id="md">최종수정일</th>
 			<th id="ct">조회수</th>
 		</tr>
 	</thead>

 	<tbody>
 	<%--  keyword가 없으면서 게시글이 없는 경우 --%>
 	<%-- JSTL if조건문 이용하여 출력 --%>
 	<c:if test="${empty keyword or (keyword eq '')}">
	 	<c:if test="${noticePage.hasNoNotices()}"> 
	 	 <tr>
	 		<td colspan="6" style="text-align:center;">게시글이 없습니다.</td>
	 	</tr>
	 	</c:if>
 	</c:if>
 	<%--  keyword가 있으면서 결과가 없는 경우 --%>
 	<%-- JSTL if조건문 이용하여 출력 --%>
 	 <c:if test="${not empty keyword or (keyword ne '')}">
	 	<c:if test="${noticePage.hasNoNotices()}"> 
	 	 <tr>
	 		<td colspan="6" style="text-align:center;">결과가 없습니다.</td>
	 	</tr>
	 	</c:if>
 	</c:if>

 	<%-- JSTL forEach 반복문 이용하여 출력시작 
 		for(int i=1; i<=10; i++){syso (i)} 1 2 3 ....9 10  
 		for(타입 변수명 : 컬렉션명){ syso(변수명) }
 		--%>
<%--  	<c:forEach var="i" begin="1" end="10" step="1"> 
  	<c:forEach var="item" items="${listNotice}">
 		<c:out value="${item}" /><br/><br/>
 	</c:forEach>
 	<br/><br/><br/><br/><br/><br/> --%>
 	
<%--  	<c:forEach var="item" items="${listNotice}"> --%>
	<c:if test="${noticePage.hasNotices()}"> 
 	<c:forEach var="item" items="${noticePage.content}">
 	<tr>
 		<td>${item.number}</td>
 		<td><a href="<%=request.getContextPath()%>/notice/read.do?no=${item.number}&pageNo=${noticePage.currentPage}&rowSize=${rsize}">${item.title}</a></td>
 		<td>${item.writer.writer_id}</td>
<%--  		<td>${item.regdate}(YYYY-MM-DD)</td> --%>
<%--  		<td><fmt:formatDate type="date" value="${item.regdate}" /></td> --%>
 		<td>
<%--  			<fmt:formatDate type="date" value="${item.regdate}" /><br/> --%>
<%--  			<fmt:formatDate pattern="yyyy-MM-dd" type="date" value="${item.regdate}" /><br/> --%>
<%--  			<fmt:formatDate pattern="yyyy년 MM월 dd일" type="date" value="${item.regdate}" /><br/> --%>
 			<fmt:formatDate pattern="yyyy.MM.dd. HH:mm:ss" type="date" value="${item.regdate}" /></td>
 		<td><fmt:formatDate pattern="yyyy.MM.dd. HH:mm:ss" type="date" value="${item.moddate}" /></td>
 		<td>${item.read_cnt}</td>
 	</tr>
 	</c:forEach>
 	</c:if>
 	</tbody>
  </table>	
 	
 	<br/><br/>
 	<%-- paging출력 부분 --%>
 <span id="page" style="text-align:center;">
 	<div>
		<c:if test="${empty keyword or (keyword eq '')}">
	 		<%-- JSTL if조건문: 이전 출력 --%>
	 		<c:if test="${noticePage.startPage>5}">
	 		 <a href="<%=request.getContextPath()%>/notice/list.do?pageNo=${noticePage.startPage-5}&rowSize=${rsize}">Prev</a> 
	 		</c:if>	
	 			
	 		<%-- JSTL forEach조건문: 페이지 번호 출력 --%>
	 		<c:forEach var="pNo"
	 			begin="${noticePage.startPage}" end="${noticePage.endPage}">
	 		 <a href="<%=request.getContextPath()%>/notice/list.do?pageNo=${pNo}&rowSize=${rsize}">[${pNo}]</a> 
	 		</c:forEach>
	 		
	 		<%-- JSTL forEach조건문: 다음 출력 --%>
	 		<c:if test="${noticePage.endPage<noticePage.totalPages}">
	 		 <a href="<%=request.getContextPath()%>/notice/list.do?pageNo=${noticePage.startPage+5}&rowSize=${rsize}">Next</a> 
	 		</c:if>	
		</c:if>
		
		<c:if test="${not empty keyword or (keyword ne '')}">
		 	<c:if test="${noticePage.hasNoNotices()}"> 
		 		<a href="<%=request.getContextPath()%>/notice/list.do">전체목록보기</a> 
		 	</c:if>
		 	<c:if test="${noticePage.hasNotices()}"> 
			<%-- JSTL if조건문: 이전 출력 --%>
	 		<c:if test="${noticePage.startPage>5}">
	 		 <a href="<%=request.getContextPath()%>/notice/list.do?pageNo=${noticePage.startPage-5}&rowSize=${rsize}&choice=${choice}&keyword=${keyword}">Prev</a> 
	 		</c:if>	
	 			
	 		<%-- JSTL forEach조건문: 페이지 번호 출력 --%>
	 		<c:forEach var="pNo"
	 			begin="${noticePage.startPage}" end="${noticePage.endPage}">
	 		 <a href="<%=request.getContextPath()%>/notice/list.do?pageNo=${pNo}&rowSize=${rsize}&choice=${choice}&keyword=${keyword}">[${pNo}]</a> 
	 		</c:forEach>
	 		
	 		<%-- JSTL forEach조건문: 다음 출력 --%>
	 		<c:if test="${noticePage.endPage<noticePage.totalPages}">
	 		 <a href="<%=request.getContextPath()%>/notice/list.do?pageNo=${noticePage.startPage+5}&rowSize=${rsize}&choice=${choice}&keyword=${keyword}">Next</a>
	 		 </c:if>
	 		 <br/><br/>
	 		 <a href="<%=request.getContextPath()%>/notice/list.do">전체목록보기</a>	 
	 		</c:if>	
		</c:if>
		
	</div>
 </span>
 	
<!--  	--------------------------------------------------------------------------------------------------------------------------------------------- -->
<%--  <table class="t2" style="table-layout: fixed">
 	<thead>
 		<tr class="hang">
 			<th id="nu">번호</th>
 			<th id="ti">제목</th>
 			<th id="wr">작성자</th>
 			<th id="rd">작성일</th>
 			<th id="md">최종수정일</th>
 			<th id="ct">조회수</th>
 		</tr>
 	</thead>



 	<tbody>
 	<!-- 게시글이 없는 경우 -->
 	<!-- JSTL if조건문 이용하여 출력 -->
 	<c:if test="${searchPage.hasNoNotices()}"> 
 	 <tr>
 		<td colspan="6" style="text-align:center;">결과가 없습니다.</td>
 	</tr>
 	</c:if>

	<c:if test="${searchPage.hasNotices()}"> 
 	<c:forEach var="item" items="${searchPage.content}">
 	<tr>
 		<td>${item.number}</td>
 		<td><a href="<%=request.getContextPath()%>/notice/read.do?no=${item.number}&pageNo=${searchPage.currentPage}&rowSize=${rowSize}">${item.title}</a></td>
 		<td>${item.writer.writer_id}</td>
<!--  		<td>${item.regdate}(YYYY-MM-DD)</td> -->
<!--  		<td><fmt:formatDate type="date" value="${item.regdate}" /></td> -->
 		<td>
<!--  			<fmt:formatDate type="date" value="${item.regdate}" /><br/> -->
<!--  			<fmt:formatDate pattern="yyyy-MM-dd" type="date" value="${item.regdate}" /><br/> -->
<!--  			<fmt:formatDate pattern="yyyy년 MM월 dd일" type="date" value="${item.regdate}" /><br/> -->
 			<fmt:formatDate pattern="yyyy.MM.dd. HH:mm:ss" type="date" value="${item.regdate}" /></td>
 		<td><fmt:formatDate pattern="yyyy.MM.dd. HH:mm:ss" type="date" value="${item.moddate}" /></td>
 		<td>${item.read_cnt}</td>
 	</tr>
 	</c:forEach>
 	</c:if>
 	</tbody>

 	</table>
 	<!-- 반복문 이용하여 출력 끝-->
 	
<br/><br/>
 	<!-- paging출력 부분 -->
 <span id="page2" style="text-align:center;">
 	<div>
 		<!-- JSTL if조건문: 이전 출력 -->
 		<c:if test="${searchPage.startPage>5}">
 		 <a href="<%=request.getContextPath()%>/notice/list.do?pageNo=${searchPage.startPage-5}&rowSize=${rsize}">prev</a> 
 		</c:if>	
 			
 		<!-- JSTL forEach조건문: 페이지 번호 출력 -->
 		<c:forEach var="pNo"
 			begin="${searchPage.startPage}" end="${searchPage.endPage}">
 		 <a href="<%=request.getContextPath()%>/notice/list.do?pageNo=${pNo}&rowSize=${rsize}">[${pNo}]</a> 
 		</c:forEach>
 		
 		<!-- JSTL forEach조건문: 다음 출력 -->
 		<c:if test="${searchPage.endPage<searchPage.totalPages}">
 		 <a href="<%=request.getContextPath()%>/notice/list.do?pageNo=${searchPage.startPage+5}&rowSize=${rsize}">next</a> 
 		</c:if>	
	</div>
 </span> --%>
 
 <br/><br/><br/><br/>
<!--  검색기능 폼 -->
 <form name="searchFrm" id="searchFrm" action="<%=request.getContextPath()%>/notice/list.do" 
 		method="post" style="text-align:center;">
 <input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
 <input type="hidden" name="rowSize" id="rowSize" value="${rsize}"/> 
 <select name="choice" id="choice"> <!-- 높이:20 중간맞춤 -->
<!--     <option value="sel">선택</option> -->
    <option value="title" <c:if test="${choice == 'title'}">selected</c:if>>제목</option>
    <option value="writer_id" <c:if test="${choice == 'writer_id'}">selected</c:if>>작성자</option>
<!--     <option value="content">내용</option> -->
</select>
<lebel class="hidden"></lebel>	<!-- ?choice=title&keyword=~~~ -->
<input type="text" name="keyword" id="keyword" value="${param.keyword}"/>
 
<button type="submit">검색</button>
 
</form>
 
 
 
 
 
 
 
 
 
</body>
</html>