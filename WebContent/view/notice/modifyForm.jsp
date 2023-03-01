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
    <script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>
    <style>
 		table { 
  	    width: 800px;
/*  	    height: 600px;  */
 	    margin-left: auto; 
 	    margin-right: auto; 
 	 	} 
	 	th {
	    text-align: center;
/* 	    border: 1px solid #EFEFEF; */
	    background: #C5CAD7
	 	}
/* 	 	textarea{ width:98%; border:1px solid #CBCACA; border-radius:4px; resize: none;} */
	 	textarea{ width:97%;
	 			  padding: 7px; 
	 			  border:1px solid #CBCACA; 
	 			  border-radius:5px; 
	 			  resize: none;
	 			 }
	 	
	 	
	 	#ism{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
	 	#bsm{
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
	 	
	 	#read{
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
	 	
 	 	#t1{ 
 	 	height:30px; 
 	 	} 
 	 	#t2{ 
 		height:30px; 
	 	} 
 	 	#t3{ 
 	 	height:30px; 
 	 	} 
 	 	#t4{ 
 		height:30px; 
 	 	} 
 	 	.c {
	    text-align: left;
/* 	    border: 1px solid #EFEFEF; */
/* 	    background: #C5CAD7 */
		padding-left : 5px; 
	 	}
	 	
	 	
	 	.input-file-button1{
		  padding: 6px 25px;
		  background-color:#4682b4;
		  border-radius: 4px;
		  color: white;
		  cursor: pointer;
		}
		
		.input-file-button2{
		  padding: 6px 25px;
		  background-color:#FF6600;
		  border-radius: 4px;
		  color: white;
		  cursor: pointer;
		}
    </style>
    
        <script>
        //$('<input type="file" name="modifyFile" id="modifyFile"/><br><br>').insertAfter(this);
		  //$("#modifyFile").append("<input type='file' name='modifyFile' id='modifyFile'/><br><br>");
		  //$("#modifyFile").append("<input type=\'file\' name=\'modifyFile\' id=\'modifyFile\' /><br/><br/>");
		  //$("#modifyFile").paraent().append($('<input type="file" name="modifyFile" id="modifyFile"/><br><br>');
		  //$("#modifyFile").paraent().append($("<input/>" {type:"file",name:"modifyFile",id:'modifyFile'})).append("<br><br>");
		  //$("#modDelBtn, #modDel").remove();
		  // $('<input type="file" name="modifyFile" id="modifyFile"/><br><br>').insertAfter(this);
		
		  //" <input type=\'file\' name=\'modifyFile\' id=\'modifyFile\' /><br/><br/>."
		  //$("#modDelBtn").click(function(){
		  //$(".modFileAdd").append("<input type="file" name="modifyFile" id="modifyFile"/>");
		  
		  
		          		
//         		$("#modDelBtn").on({
//         		    click: function () { //마우스 p 태그 안에 들어왔을 때,
//         		        //alert("mouseenter 이벤트가 발생했습니다.");
//         		        //$("#modDel").remove(this);
//         		        $("#modDel").remove(this);
//         		    },
//         		    click: function () { //마우스 클릭 p 태그 안에서 일어날 때,
//         		        //alert("click 이벤트가 발생했습니다.");
//         		        $('<input type="file" name="modifyFile" id="modifyFile"/><br><br>').insertAfter(this);
//         		    }
        
        	$(document).ready(function(){
        		$("#modDelBtn").click(function(){
        		    //alert('첨부파일 삭제완료');
        		 $("#modDel").remove();
        		 });	  
      		
	        });
      
			
        	
        	function formSubmit(){
        		$("#modifyFrm").submit();
//         		alert("게시글 수정에 성공하셨습니다.");
        	};
        	
        	
        	
//         	function comMod(){
//     			let pageNoVal =  "<c:out value = '${pageNo}'/>";
//     			let rowSizeVal =  "<c:out value = '${rowSize}'/>";
//     			alert("수정완료");
//     			//alert("22222222222222222"+rowSizeVal);
<%--             	location.href="<%=request.getContextPath()%>/notice/list.do?pageNo="+pageNoVal+"&rowSize="+rowSizeVal; --%>
//         	}
        	
        </script>
</head>
<body>
<%@ include file="../module/top00.jsp" %>

<%-- ModifyNoticeHandler 컨트롤러에 의해 아래와 같이 Model 받았다.
	new ModifyRequest(로그인한 userid, 글번호, db의 작성자명, db의 title, db의 내용)
	request.setAttribute("modReq", modReq);
	request.setAttribute("pageNo", pageNo);
	request.setAttribute("no", no);
	request.setAttribute("rowSize", rsize);
	request.setAttribute("noticeData1", noticeData1);

*DB내용:${noticeData}<br/><br/>
*요청페이지:${pageNo}<br/><br/>
*1페이지당 게시글수:${rowSize}<br/><br/> 
${modReq}<br/><br/><br/><br/>
--%>

<%--  <a href="<%=request.getContextPath()%>/index.jsp">HOME</a> --%>
<!-- <p class="home" style="text-align: left; margin-left:150px;"> -->
<p class="home" style="margin:0 auto; max-width: 950px;">
<a href="<%=request.getContextPath()%>/chat.do">HOME</a>
</p>
 <hr/>
  
<br/><br/>
<!--  <h3>modifyForm.jsp</h3> -->
 <form name="modifyFrm" id= "modifyFrm"
 		method="post" action="<%=request.getContextPath()%>/notice/modify.do" enctype="multipart/form-data"> 
 <input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
 <input type="hidden" name="rowSize" id="rowSize" value="${rowSize}"/>
 <input type="hidden" name="no" id="no" value="${modReq.noticeNumber}"/>

 
 <table border="1">
 	<tr id="t1" style="height:50px;">
 		<th>게시글 번호</th>
 		<td class="c">${modReq.noticeNumber}</td>
 	</tr>
 	
 	 <tr id="t2" style="height:50px;">
 		<th>작성자명</th>
 		<td class="c">${modReq.writer_name}</td>
 	</tr>

 	 <tr id="t3" style="height:50px;">
 		<th>최초 작성일</th>
 		<td class="c"><fmt:formatDate pattern="yyyy년 MM월 dd일  HH:mm:ss" type="date" value="${noticeData1.notice.regdate}" /></td>
 	</tr>
 	
 	 <tr id="t4" style="height:50px;">
 		<th>제목<b style="color:red; font-weight: 500;">*</b></th>
 		<td class="c"><%-- ${noticeData.notice.title} --%>
 		<input type="text" name="title" id="title" style="border:1px solid #CBCACA; width:450px; padding:7px; border-radius:5px;" value="${modReq.title}"/>
 		</td>
 	</tr>
 	
 	 <tr>
 		<th>내용<b style="color:red; font-weight: 500;">*</b></th>
 		<td>
<%--  		<textarea name="content" id="content" rows="20" cols="60" autofocus>${modReq.content}</textarea> --%>
 		<textarea name="content" id="content" rows="20" cols="60" autofocus>${modReq.content}</textarea>
 		</td>
 	</tr>
 	
 	<tr>
 		<th>첨부파일</th>
 		<td>
 			<c:choose>
 				<c:when test="${noticeFile eq null}">
 					<div class=modFileAdd>
					<input type="file" name="modifyFile" id="modifyFile"/><br/><br/>
					</div>
				</c:when>
 				<c:when test="${noticeFile ne null}">
 					<div id=modDel>
 					<label class="input-file-button1" for="input-file1">
					  기존 업로드된 파일
					</label><br/>
 					<img title="${noticeFile.file_name}" class="file-img" src="../assets/images/clip2.png" width="20px" height="20px"/>${noticeFile.file_name}&nbsp;&nbsp;(${finalUnit})
<!--  					<img class="file-img" src="../assets/images/ex.png" width="15px" height="15px"/> -->
<%-- 					 <a href="${contextPath}/fileDelete?file=${noticeFile}&no=${modReq.noticeNumber}&pageNo=${pageNo}&rowSize=${rowSize}"> --%>
<!-- 					 <button type="button" id="modDelBtn" style="background-color:transparent; border:none;"><img src="../assets/images/ex.png" style="width:15px; height:15px;"/></button> -->
<!-- 					 </a> -->
					<br/><br/><br/>
					<label class="input-file-button2" for="input-file2">
					  업로드된 파일 수정
					</label><br/>
<!-- 					<input type="file" id="input-file" style="display:none"/> -->
					<input type="file" name="modifyFile2" id="modifyFile2"/>
					</div>
 				</c:when>
 			</c:choose>
 		</td>
 	</tr>
 	
 	
 	 <tr style="height:50px;">
 		<td colspan="2" style="text-align:center;">
<!--  		<input type="submit" id="ism" value="수정하기"/> -->
 		<button type="button" id="bsm" onclick="formSubmit();">수정하기</button>
 		</td>
 	</tr>
 	
 	 <tr style="height:50px;">
 		<td colspan="2" style="text-align:center;">
 		<button type="button" id="list" onclick="location.href='<%=request.getContextPath()%>/notice/list.do?pageNo=${pageNo}&rowSize=${rowSize}'">목록보기</button>
 		<button type="button" id="read" onclick="location.href='<%=request.getContextPath()%>/notice/read.do?no=${modReq.noticeNumber}&pageNo=${pageNo}&rowSize=3'">게시글 상세조회</button>
 		<button type="button" id="del" onclick="location.href='<%=request.getContextPath()%>/notice/delete.do?no=${modReq.noticeNumber}'">게시글 삭제</button>

<%--  		<a href="<%=request.getContextPath()%>/notice/list.do?pageNo=${pageNo}&rowSize=${rowSize}">목록보기(파라미터 처리 안함)</a> --%>
<%--  		<a href="<%=request.getContextPath()%>/notice/read.do?no=${modReq.noticeNumber}&pageNo=${pageNo}&rowSize=3">글 상세조회(모델보면서 보완예정)</a> --%>
<%--  		<a href="<%=request.getContextPath()%>/notice/read.do?no=${modReq.noticeNumber}">뒤로(글상세조회)</a> --%>
<%--  		<a href="<%=request.getContextPath()%>/notice/delete.do?no=${modReq.noticeNumber}">글삭제(delete용)</a> --%>
<%--  		<a href="<%=request.getContextPath()%>/notice/delete2.do?no=${modReq.noticeNumber}">글삭제(update용)</a> 기능상 필요 없어 삭제--%>
 		</td>
 	</tr>
 	
 
 </table>
 		
<%--  		<input type="hidden" name="writer_name" id="writer_name" value="${modReq.writer_name}"/>   --%>
 		<!-- 런타임 익셉션 떨어져서 숨기고 no이름 값으로 속성을 안보이게 넘긴다.히든!! 위에 no값은 form태그 안에만 있으면 어디든 위치는 오케이다-->
 		<%-- 여기에서는 작성자명을 수정처리컨트롤러에 넘기는 방식으로 추가하였다.
 		현재방식이라면 DB의 작성자명과 세션에 담긴 이름이 동일하므로 세션으로 대체해도 된다 --%>
 </form>
 
 
 <script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
 
<%@ include file="../module/bottom00.jsp" %>
</body>
</html>






