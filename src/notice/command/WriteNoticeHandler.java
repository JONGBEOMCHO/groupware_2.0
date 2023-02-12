package notice.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.service.WriteNoticeService;
import notice.model.Writer;
import notice.service.WriteRequest;
import auth.service.User;
import mvc.command.CommandHandler;



//p640
//이 클래스는 쓰기폼 보여주기 요청 및 쓰기처리 요청 담당 컨트롤러이다.
//요청주소 http://localhost/notice/writer.do
public class WriteNoticeHandler implements CommandHandler {

	private static final String FORM_VIEW = "/view/notice/writeForm.jsp";
	private WriteNoticeService writeNoticeService = new WriteNoticeService(); 

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("WriteNoticeHandler의 Process()호출성공");
		System.out.println("WriteNoticeHandler의 request.getMethod()=" + request.getMethod());

		// 폼의 요청방식에 따라 쓰기변경폼 보여줘 요청과 쓰기처리요청을 구분
		if (request.getMethod().equalsIgnoreCase("GET")) {
			return processForm(request, response);// 쓰기폼보여줘
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(request, response);// 쓰기처리요청
		} else {
			/*
			 * 참고 상태코드 => SC_OK 200(성공) : 서버가 요청을 제대로 처리했다는 뜻이다. 이는 주로 서버가 요청한 페이지를 제공했다는
			 * 의미로 쓰인다.
			 * 
			 * 상태코드 => SC_METHOD_NOT_ALLOWED 405(허용되지 않는 메소드) : 요청에 지정된 방법을 사용할 수 없다 예를 들어
			 * POST 방식으로 요청을 받는 서버에 GET요청을 보내는 경우, 또는 읽기 전용 리소스에 PUT 요청을 보내는 경우에 이 코드를 제공한다.
			 */
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}

	}// process의 끝

	// 쓰기폼으로 이동-p641 31라인
	private String processForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 로그인한 유저정보는 세션에서 받자
		User authUser = loginedUser(request); //원래소스
//		User authUser = new User(10, "user12", "hong", 1);
//		request.getSession().setAttribute("AUTHUSER", authUser);
		
		String strRsize=request.getParameter("rowSize"); //1페이지당 보여줄 페이지수
		int rowSize=3;
		if(strRsize!=null) {
			rowSize = Integer.parseInt(strRsize);			
		}
//		int rowSize=3;
		
		String strPageNo = request.getParameter("pageNo");//보고싶은 페이지
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}
		
		
		
		request.setAttribute("AUTHUSER", authUser); //원래 소스
		request.setAttribute("rowSize", rowSize); //로우사이즈 기본3
		request.setAttribute("pageNo", pageNo); //
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%rowSize"+rowSize);
		return FORM_VIEW;
	}
	//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	//아래 loginedUser통으로 주석처리하고  위에 processForm메소드에
//	User authUser = loginedUser(request);
//	request.setAttribute("AUTHUSER", authUser);
	//주석 처리해도 ${AUTHUSER.membername}이런식으로 속성 불러오기 가능! 로그인한 세션 User객체에서 그대로 사용가능
	//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	
	// 로그인한 유저정보는 세션에서 받자
	 public User loginedUser(HttpServletRequest request) { 
	 /*session에 저장된 로그인한	 user정보 
	 		class User { 
	 			private int memberno; //회원번호 
	 			private String memberid; //id 
	 			private String membername; //이름 
	 			private int memberno; //회원등급. 기본1. 1(정상), 2(강퇴), 3(탈퇴), 4(휴면), 999(관리자)
	 session.setAttribute("AUTHUSER", user); //로그인을 하지 않으면 여기서 에러가 난다!!!로그인 정보가 없기 때문에 널포인터 익셉션!! */
		 User authUser = (User)request.getSession().getAttribute("AUTHUSER"); 
		 return authUser; 
	 }
	 

	// 쓰기처리-p641 35라인
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 파라미터받기
		// String writer_name = request.getParameter("wrtier_name"); //작성자명
		//String rowSize=request.getParameter("rowSize"); //1페이지당 보여줄 페이지수  //원래 소스
		//System.out.println("rowSize="+rowSize); //원래소스
		String strRowSize = request.getParameter("rowSize");//한페이지당 보여지는 게시물 수
//		int size = Integer.parseInt(strRowSize);-->>원래 에러 나는 형태.... nullpoint exception 뜬다.
		int rowSize = 3;
//		if(strRowSize==null) {
//			rowSize=3;
//		}else {
//			rowSize = Integer.parseInt(strRowSize);			
//		}
		if(strRowSize!=null) {
			rowSize = Integer.parseInt(strRowSize);			
		}
		
		
		String strPageNo = request.getParameter("pageNo");//보고싶은 페이지
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}
		
		
		//로그인한 유저정보는 세션에서 받자
		User authUser = loginedUser(request);
		

		
		// 유효성검사 - p641 41라인
		Map<String, Boolean> errors = new HashMap<String, Boolean>(); // Map 은 인터페이스 이므로 구현 클래스는 자식클래스로 해야한다.
		request.setAttribute("errors", errors);// p641 37라인
		WriteRequest writeReq = createWriteRequest(authUser, request);
//		WriteRequest writeReq = createWriteRequest(request);
		writeReq.validate(errors);
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		// 2.비즈니스로직처리 Controller->Service->DAO->DB->DAO->Service->Controller
		//파라미터  WriteRequest writeReq : Writer(로그인한 유저id, 로그인한 유저명), 입력제목, 입력내용*/
		//리턴타입 Integer : notice테이블에 입력된 글번호
//		int newNoticeNo = writeNoticeService.write(writeReq); //  ★★★★★★★★★★※emp_no 참조키 제약사항 걸기 전 소스
		int newNoticeNo = writeNoticeService.write(writeReq, authUser); //Integer 타입에서 언박싱된것 이건 큰것에서 작은것으로 ~! 이건 자동 언박싱 또는 자동형변환이다.
		request.setAttribute("newNoticeNo", newNoticeNo); //-->그런데 다시 오브젝트 타입... 이럴거면 언박싱하는 의미가...
		request.setAttribute("rowSize", rowSize); //로우사이즈
		request.setAttribute("pageNo", pageNo); //
		
		return "/view/notice/newNoticeSuccess.jsp";
//			return FORM_VIEW;

	}//processSubmit()끝

	// 유효성검사-p641 53라인
	//리턴유형 WriteRequest : Writer(로그인한 유저id, 로그인한 유저명), 입력제목, 입력내용
	private WriteRequest createWriteRequest(User authUser, HttpServletRequest request) {
//	private WriteRequest createWriteRequest(String authUser, HttpServletRequest request) {
		
		//String title = request.getParameter("title"); // 제목
		//String content = request.getParameter("content"); // 내용
		//String title = ; // 제목
		//String content = ; // 내용
		
		return new WriteRequest(
				new Writer( authUser.getEmp_id(), 
							authUser.getEmp_kname()),
							request.getParameter("title"), 
							request.getParameter("content"));

		}

	
	
}
