package notice.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import notice.service.NoticeData;
import notice.service.NoticeNotFoundException;
import notice.model.NoticeFile;
import notice.model.Writer;
import notice.service.ModifyNoticeService;
import notice.service.ModifyRequest;
import notice.service.PermissionDeniedException;
import notice.service.ReadNoticeService;
import notice.service.WriteNoticeService;
import notice.service.WriteRequest;
import auth.service.User;
import mvc.command.CommandHandler;

//이 클래스는 수정폼 보여주기 요청 및 수정처리 요청 담당 컨트롤러이다.
//요청주소 http://localhost/notice/modifyNotice.do
public class ModifyNoticeHandler implements CommandHandler {
	
	private static final String FORM_VIEW="/view/notice/modifyForm.jsp";
	//상세보기를 위한 서비스 클래스의 참조변수 선언
	private ReadNoticeService readService = new ReadNoticeService();
	//수정처리를 위한 서비스 클래스의 참조변수 선언
	private ModifyNoticeService modifyService = new ModifyNoticeService();
	//private WriteNoticeService writeService = new WriteNoticeService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ModifyNoticeHandler의 Process()호출성공");
		System.out.println("ModifyNoticeHandler의 request.getMethod()="+request.getMethod());
		
		
		//폼의 요청방식에 따라 비번변경폼 보여줘 요청과 비번변경처리요청을 구분
		if( request.getMethod().equalsIgnoreCase("GET") ) {
			return processForm(request, response);//비번변경폼보여줘
		}else if( request.getMethod().equalsIgnoreCase("POST") ) {
			return processSubmit(request, response);//비번변경처리요청
		}else {
			/*참고
			 * 상태코드 => SC_OK
			 * 200(성공) : 서버가 요청을 제대로 처리했다는 뜻이다.
			 * 이는 주로 서버가 요청한 페이지를 제공했다는 의미로 쓰인다.
			 * 
			 * 상태코드 => SC_METHOD_NOT_ALLOWED
			 * 405(허용되지 않는 메소드) : 
			 * 요청에 지정된 방법을 사용할 수 없다
			 * 예를 들어 POST 방식으로 요청을 받는 서버에 GET요청을 보내는 경우,
			 * 또는 읽기 전용 리소스에 PUT 요청을 보내는 경우에 이 코드를 제공한다.*/
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}

	}//process의 끝

	//(해당게시글의 정보가 출력되어있는)수정폼으로 이동-p669 38라인
	private String processForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			//컨트롤러가 해야 할 일	
			//1.파라미터 얻기 no=수정할 글번호
			
			//no=상세조회할 글번호 &pageNo=요청페이지&rowSize=1페이지당 게시글수
			//String strNo = request.getParameter("no");//상세조회할 글번호 &수정할 글번호
			//만약 파라미터 no(즉, 상세조회할 글번호)가 null이면 RuntimeException발생
			String strNo = request.getParameter("no");//수정할 글번호

			if(strNo==null) {
				throw new RuntimeException();
			}
			int	no = Integer.parseInt(strNo);//상세조회할 글번호 또는 수정을 위한 글 번호
//			int no = 1;
//			if(strNo!=null) {
//				no = Integer.parseInt(strNo);
//			}
//			System.out.println("no="+no);
			
			//만약 파라미터 pageNo(즉, 요청페이지)가 null이면 요청페이지를 1로 설정
			String strPageNo = request.getParameter("pageNo");//보고싶은 페이지
			int pageNo = 1;
			if(strPageNo!=null) {
				pageNo=Integer.parseInt(strPageNo);
			}		
			
			//만약 파라미터 rowSize(페이지당 게시글수)가 null이면 페이지당 게시글수를 3으로 설정
			String strRowSize = request.getParameter("rowSize");//한페이지당 보여지는 게시물 수
			int rsize = 3;
			if(strRowSize!=null) {
				rsize = Integer.parseInt(strRowSize);			
			}
			
			String title = request.getParameter("title"); //수정할 제목
			String content = request.getParameter("content"); //수정할 내용
			
			
			//2.비즈니스 로직 수행 -> Service -> DAO -> DB -> DAO -> Service -> 비즈니스 로직 수행(되돌아 온다)
			/*파라미터
		 int no : 상세조회할 글번호
		 boolean increaseReadCount:ture(이면 조회수 증가)
		 여기에서는 수정을 위해 상세보기를 진행하므로 조회수 증가를 하지 않기 위해 false*/
			/*NoticeData : notice테이블과 notice_content테이블 관련 데이터*/
			NoticeData noticeData =  readService.getNotice(no, false);
			System.out.println("noticeData="+noticeData);
			
			
			//p670 44라인
			//로그인한 회원은 자신의 글에 한하여 내용을 수정할 수 있어야 한다.
			//조건1. 로그인이 되었는 확인(로그인 했니?) 
			//=> 로그인한 유저정보는 세션에서 받자
			/*session에 저장된 로그인한 user정보
		 class User {
		 	private int memberno; //회원번호
		 	private String memberid; //id
		 	private String membername; //이름
		 	private int memberno; //회원등급. 기본1. 1(정상), 2(강퇴), 3(탈퇴), 4(휴면), 999(관리자)
		 	
		 	session.setAttribute("AUTHUSER", user);*/
			//로그인을 하지 않으면 여기서 에러가 난다!!!로그인 정보가 없기 때문에 널포인터 익셉션!!
			User authUser = (User)request.getSession().getAttribute("AUTHUSER"); 
			
			
			//조건2. 로그인 한 회원이 작성한 글인지 확인
			// 		=> 로그인인한 user의 id와 작성자의 id가 일치하는지 확인
/*			if(!canModify(authUser, noticeData)) { //수정불가이면
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}*/
			/*참고 HttpServletResponse.SC_FORBIDDEN
			 * HttpServletResponse.SC_FORBIDDEN: 403에러
			 서버가 허용하지 않는 웹 페이지나 미디어를 사용자가 요청할 때 
			 웹 서버가 반환하는 HTTP 상태 코드이다. 
			 다시 말해, 클라이언트가 서버에 도달할 수 있어도 
			 서버가 페이지 접근 허용을 거부했다는 것을 뜻한다*/
			
			//아래 ModifyRequest(로그인한 userid, 글번호, db의 작성자명, db의 title, db의 내용)
/*			ModifyRequest modReq = new ModifyRequest(authUser.getMemberid(), 
					no, 
					noticeData.getNotice().getWriter().getWriter_name(),
					noticeData.getNotice().getTitle(), 
					noticeData.getContent().getContent());*/
			
				ModifyRequest modReq = new ModifyRequest(no, 
						noticeData.getNotice().getWriter().getWriter_name(),
						noticeData.getNotice().getTitle(), 
						noticeData.getContent().getContent());
	

			
			System.out.println("modReq="+modReq);
			
			NoticeData noticeData1 =  readService.getNotice(no, true);
			NoticeFile noticeFile =  readService.getFile(no);
			
			//String finalUnit= unitConvert(noticeFile.getFile_size());
			String finalUnit=null;
			if(noticeFile != null) {
				finalUnit= unitConvert(noticeFile.getFile_size());
				request.setAttribute("finalUnit", finalUnit);
			}
			
			
			
			
			//3.Model(비즈니스로직 수행결과)처리 & 4.View - p670 53라인
			request.setAttribute("modReq", modReq);
			request.setAttribute("noticeFile", noticeFile);
			request.setAttribute("finalUnit", finalUnit);
			request.setAttribute("pageNo", pageNo);
			request.setAttribute("rowSize", rsize);
			request.setAttribute("noticeData1", noticeData1);

			
			//4.View지정~~~변경예정
			
			return FORM_VIEW;
//		return "../view/testView.jsp";
//		return request.getContextPath()+"/view/notice/modifyForm.jsp";
			
			
		}catch(NoticeNotFoundException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND); //404에러
			return null;
		}
	}
		
	//수정처리-p670 66라인
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
			//파일 업로드(수정)
			MultipartRequest multi = null; 
			String saveFolder = request.getServletContext().getRealPath("/upload"); 
			String encType = "UTF-8";
			int maxSize = 20*1024*1024;
			multi = new MultipartRequest(request, saveFolder, maxSize, encType, new	DefaultFileRenamePolicy()); 
			
			//컨트롤러가 해야 할 일	
			//1.파라미터 얻기 no=수정할 글번호
			
			//no=상세조회할 글번호 &pageNo=요청페이지&rowSize=1페이지당 게시글수
			//String strNo = request.getParameter("no");//상세조회할 글번호 &수정할 글번호
			//만약 파라미터 no(즉, 상세조회할 글번호)가 null이면 RuntimeException발생			
			String strNo = multi.getParameter("no");//수정할 글번호

			if(strNo==null) {
				throw new RuntimeException();
			}
			int	no = Integer.parseInt(strNo);//상세조회할 글번호 또는 수정을 위한 글 번호
			
			
//			int no;
//			if(strNo!=null) {
//				no = Integer.parseInt(strNo);
//			}
//			System.out.println("no="+no);
			
			//만약 파라미터 pageNo(즉, 요청페이지)가 null이면 요청페이지를 1로 설정
			String strPageNo = multi.getParameter("pageNo");//보고싶은 페이지
			int pageNo = 1;
			if(strPageNo!=null) {
				pageNo=Integer.parseInt(strPageNo);
			}		
			
			//만약 파라미터 rowSize(페이지당 게시글수)가 null이면 페이지당 게시글수를 3으로 설정
			String strRowSize = multi.getParameter("rowSize");//한페이지당 보여지는 게시물 수
			int rsize = 3;
			if(strRowSize!=null) {
				rsize = Integer.parseInt(strRowSize);			
			}

			String title = multi.getParameter("title"); //수정할 제목
			String content = multi.getParameter("content"); //수정할 내용
			String writer_name = multi.getParameter("wrtier_name"); 
		
			
			//로그인한 유저정보는 세션에서 받자
			User authUser = (User)request.getSession().getAttribute("AUTHUSER");
			

			
			//작성자명(원래 안해도 되는데 아래 modReq 매개변수로 넣기위해서 파라미터값으로 가져온다.덕분에 modifyForm.jsp에도 인풋태그 name 값으로 히든으로 추가하였다.. )//작성자명(원래 안해도 되는데 아래 modReq 매개변수로 넣기위해서 파라미터값으로 가져온다.덕분에 modifyForm.jsp에도 인풋태그 name 값으로 히든으로 추가하였다.. )
			
			/*session에 저장된 로그인한 user정보
			 class User {
			 	private int memberno; //회원번호
			 	private String memberid; //id
			 	private String membername; //이름
			 	private int memberno; //회원등급. 기본1. 1(정상), 2(강퇴), 3(탈퇴), 4(휴면), 999(관리자)
			 	
			 	session.setAttribute("AUTHUSER", user);*/
				//로그인을 하지 않으면 여기서 에러가 난다!!!로그인 정보가 없기 때문에 널포인터 익셉션!!
//				User authUser = (User)request.getSession().getAttribute("AUTHUSER"); 
					
			//아래 ModifyRequest(로그인한 userid, 글번호, db의 작성자명, db의 title, db의 내용)
/*			ModifyRequest modReq = new ModifyRequest(authUser.getMemberid(), 
													no, 
													writer_name,
													title, 
													content);*/
/*			원본소스
 			ModifyRequest modReq = new ModifyRequest(no, 
													writer_name,
													title, 
													content);
													*/
								
/*		
			ModifyRequest modReq =null;										
				if(multi.getFilesystemName("modifyFile") == null) {
						modReq = new ModifyRequest(no, 
													writer_name,
													title, 
													content,
											new NoticeFile(0,
													multi.getFilesystemName("modifyFile"),
													multi.getOriginalFileName("modifyFile"),
													multi.getContentType("modifyFile"),
													0)
								);			
					}else {
						modReq = new ModifyRequest(no, 
													writer_name,
													title, 
													content,
											new NoticeFile(0,
													multi.getFilesystemName("modifyFile"),
													multi.getOriginalFileName("modifyFile"),
													multi.getContentType("modifyFile"),
													multi.getFile("modifyFile").length())
													);
							}											
			
*/
			
			
			ModifyRequest modReq =null;										
			if(multi.getFilesystemName("modifyFile") != null) {
				modReq = new ModifyRequest(no, 
						writer_name,
						title, 
						content,
						new NoticeFile(0,
								multi.getFilesystemName("modifyFile"),
								multi.getOriginalFileName("modifyFile"),
								multi.getContentType("modifyFile"),
								multi.getFile("modifyFile").length())
						);
			}else if((multi.getFilesystemName("modifyFile2") != null)) {
				modReq = new ModifyRequest(no, 
						writer_name,
						title, 
						content,
						new NoticeFile(0,
								multi.getFilesystemName("modifyFile2"),
								multi.getOriginalFileName("modifyFile2"),
								multi.getContentType("modifyFile2"),
								multi.getFile("modifyFile2").length())
						);
			}else {
				modReq = new ModifyRequest(no, 
						writer_name,
						title, 
						content,
						new NoticeFile(0,
								multi.getFilesystemName("modifyFile"),
								multi.getOriginalFileName("modifyFile"),
								multi.getContentType("modifyFile"),
								0)
					);			
			}		

			//유효성검사 - p670 77라인
			Map<String, Boolean> errors = new HashMap<String, Boolean>(); //Map 은 인터페이스 이므로 구현 클래스는 자식클래스로 해야한다.
			request.setAttribute("errors", errors);//p670 78라인
			modReq.validate(errors);
			if(!errors.isEmpty()) {
				return FORM_VIEW;
			}
			try {//p670 83라인
				//3. 비즈니스 로직 수행 => 유효성 검증된 데이터를 DB에 update 진행해라
				//파라미터modifyRequest modReq : 글수정을 위한 수정하는 사용자id, 수정할 글번호, 수정할 제목, 수정할 내용
				//modifyService.modify(modReq);
				
				//int modiNoticeNo=0;
				NoticeFile noticeFile = null;
				if(multi.getFilesystemName("modifyFile") != null) {
					
						modifyService.modify(modReq); //★★★★★★★★★★※emp_no 참조키 제약사항 설정된 소스
						noticeFile = modifyService.fileInsert(modReq, authUser); //★★★★★★★★★★※emp_no 참조키 제약사항 설정된 소스
						System.out.println("글수정, 파일 insert~~~~~~~~~~~~~~~");
				}else if(multi.getFilesystemName("modifyFile2") != null) {
					System.out.println("modifyFile2 내용"+multi.getFilesystemName("modifyFile2"));
					System.out.println("modReq 내용"+modReq);
						modifyService.modify(modReq); //★★★★★★★★★★※emp_no 참조키 제약사항 설정된 소스
						noticeFile = modifyService.fileUpdate(modReq, authUser); //★★★★★★★★★★※emp_no 참조키 제약사항 설정된 소스
						System.out.println("글수정, 파일 update~~~~~~~~~~~~~~~");
						System.out.println("notice File 내용"+noticeFile);
				}else {
					modifyService.modify(modReq);
					System.out.println("글만 수정~~~~~~~~~~~~~~~~~~~~~");
				}
				
				//String finalUnit= unitConvert(noticeFile.getFile_size());
				
				//3.Model(비즈니스로직 수행결과)처리 & 4.View - p670 53라인
				request.setAttribute("modReq", modReq);
				request.setAttribute("noticeFile", noticeFile);
				//request.setAttribute("finalUnit", finalUnit);
				request.setAttribute("rowSize", rsize); //로우사이즈
				request.setAttribute("pageNo", pageNo); //보고싶은 페이지
				request.setAttribute("no", no); //글번호	
				

				
				//4.View지정~~~변경예정
				//4.View-P670 85라인
				//return request.getContextPath()+"/view/notice/modifySuccess.jsp"; //수정성공페이지
				return "/view/notice/modifySuccess.jsp"; //수정성공페이지
				//return null; 
//				return "/notice/list.do";
//				return "/view/notice/modifyForm.jsp";
				
			}catch(NoticeNotFoundException e){
				response.sendError(HttpServletResponse.SC_NOT_FOUND);//404에러
				return null;
			}catch(PermissionDeniedException e) {//p671 89라인
				response.sendError(HttpServletResponse.SC_FORBIDDEN); //403에러
				return null;
			}

	}//processSubmit()끝
		
	
	//파일 용량 단위 변환 메소드
	//NoticeFile noticeFile=null;
	public String unitConvert(long fileSize) {
		//fileSize = noticeFile.getFile_size();
		long[] unit = { 1, 1024, 1048576, 1073741824};
		String[] units= {" Byte", " KB", " MB", " GB"};
		String value=null;
		System.out.println("계산입니다."+fileSize/unit[1]);
		for(int i=0;(fileSize/unit[i])>0; i++) {
			value=Long.toString(fileSize/unit[i]);
			value+=units[i];
			System.out.println(i+"번째"+value);
		}
		return value;
	}	
	



	//수정권한 체크 p670 61라인
	/*파라미터
		 User authUser : 로그인한 유저정보
		 NoticeData noticeData : notice테이블과 notice_content테이블 관련데이터
	 *리턴유형
	 boolean : 수정가능하면   true리턴, 그렇지 않으면 false리턴*/
	//private boolean canModify(로그인한 유저정보, 작성자 정보) {
/*	private boolean canModify(User authUser, NoticeData noticeData) {
		//로그인한 유저정보에서 id를 가져오기
		String userId = authUser.getMemberid();

		//작성자 정보에서 id를 가져오기
		String writerId = noticeData.getNotice().getWriter().getWriter_id();
		
		//return "기준문자열".equels("비교문자열");
		//return "로그인한 userid".equels("작성자id");
		return userId.equals(writerId);
		
	}//canMody()끝*/
	

}

















