package notice.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import notice.model.NoticeFile;
import notice.service.ListNoticeService;
import notice.service.NoticePage;

//이 클래스는 notice테이블의 목록조회 요청에 따라 호출되는 컨트롤러이다.
//요청주소 http://localhost/notice/list.do
//view http://localhost/view/notice/listNotice.jsp
public class ListNoticeHandler implements CommandHandler {

//	private static final String FORM_VIEW="/view/notice/list.jsp";
//	private static final String FORM_VIEW="../view/notice/list.jsp";
//	private static final String FORM_VIEW="/view/testView.jsp";

	private ListNoticeService listNoticeService = 
			new ListNoticeService();
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ListNoticeHandler의 Process()호출성공");
		//User authUser = new User(10, "test", "hong", 1); //원래 여기에 없는 코드. 추후 취합 시에 삭제 필요
		//User authUser = new User(1, "test", "test", "관리자", "admin", 123456, "역삼동", "121212", "01012345678",
		//						"test@naver.com", "경영지원실", 6, 5, 999); //원래 여기에 없는 코드. 추후 취합 시에 삭제 필요
		//request.getSession().setAttribute("AUTHUSER", authUser); //원래 여기에 없는 코드. 추후 취합 시에 삭제 필요
		//컨트롤러가 해야 할 일
		//1.파라미터 얻기(향후 보고싶은 페이지)
		//요청주소 http://localhost/notice/list.do?rowSize=10
		//요청주소 http://localhost/notice/list.do?pageNo=요청페이지&rowSize=10
		
		String strPageNo = request.getParameter("pageNo");//보고싶은 페이지
//		int pageNo = Integer.parseInt(strPageNo);
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}
//		if (pageNo==0) {
//			pageNo=1;
//		}else {
//			if(strPageNo!=null) {
//				pageNo=Integer.parseInt(strPageNo);
//			}else if(strPageNo==null) {
//				pageNo=1;
//			}
//		}
		
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
		
		
		
		//?choice=title&keyword=~~
		String strChoice = request.getParameter("choice");//view페이지 내에 select 태그 id
		String choice = "";
		if(strChoice!=null) {
			choice=strChoice;
		}
		String strKeyword = request.getParameter("keyword");//유저 검색 키워드
		String keyword = "";
		if(strKeyword!=null) {
			keyword=strKeyword;
		}
		
		System.out.println("초이스는"+choice);
		System.out.println("검색어는는"+keyword);
		

		
		
		//2.비즈니스 로직 수행 -> Service -> DAO -> DB -> DAO -> Service -> 비즈니스 로직 수행(되돌아 온다)
		//p652 22라인
		//향후 페이징추가 작업예정 ~~ 리턴 유형에 변화를 줄 예정~~
		//List<Notice> listNotice = listNoticeService.getNoticePage(pageNo, size);
		//NoticePage listNotice = listNoticeService.getNoticePage(pageNo, size);
		//System.out.println("~~~~~~~~~~~~~~~~~"+pageNo);
		NoticePage noticePage = null;
		if(keyword==null || keyword=="") {
			noticePage = listNoticeService.getNoticePage(pageNo, rowSize);	//원래소스
		}else {
			noticePage = listNoticeService.getNoticePage(choice, keyword, pageNo, rowSize);
		}
		System.out.println("시발");
		List<NoticeFile> noticeFile = listNoticeService.listFile();

		//System.out.println("게시글 수"+noticePage); //list타입에서 NoticePage로 바뀌어서 이제 .size 할 수 없다.
		//System.out.println("게시글 수"+listNotice.size()); //list타입에서 NoticePage로 바뀌어서 이제 .size 할 수 없다.
		//3.Model(비즈니스로직 수행결과)처리
		//request.setAttribute("listNotice", listNotice);
		request.setAttribute("noticePage", noticePage);
		request.setAttribute("noticeFile", noticeFile);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("rowSize", rowSize);
		request.setAttribute("choice", choice);
		request.setAttribute("keyword", keyword);
		System.out.println("List 결과"+noticeFile);
		
		//4.View지정
		
//		return FORM_VIEW; //변수 지정=상대경로
//		return request.getContextPath()+"/view/Notice/listNotice.jsp"; //절대경로
		return "/view/notice/listNotice.jsp"; //상대경로
	}

}
