package notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import notice.model.NoticeFile;
import notice.service.NoticeData;
import notice.service.ReadNoticeService;


//p659
//이 클래스는 상세조회를 담당하는 컨트롤러이다.
//요청주소 http://localhost/notice/read.do
//<td><a href="/notice/read.do?no=${item.number}&pageNo=요청페이지&rowSize=페이지당 글수">${item.title}</a></td>
public class ReadNoticeHandler implements CommandHandler {
	
//	private static final String FORM_VIEW="view/testView.jsp";
	//p660
	private ReadNoticeService readService = new ReadNoticeService();
	private NoticeFile noticeFile = null;
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReadNoticeHandler의 Process()호출성공");
		
		//컨트롤러가 해야 할 일
		//1.파라미터 얻기
		//no=상세조회할 글번호 &pageNo=요청페이지&rowSize=1페이지당 게시글수
		//String strNo = request.getParameter("no");//상세조회할 글번호
		//int no = Integer.parseInt(strNo);
		//만약 파라미터 no(즉, 상세조회할 글번호)가 null이면 RuntimeException발생
		String strNo = request.getParameter("no");
//		int no = 1;
//		if(strNo==null) {
//			throw new RuntimeException();
//		}
//		no = Integer.parseInt(strNo);//상세조회할 글번호
		int no = 1;
		if(strNo!=null) {
			no = Integer.parseInt(strNo);//상세조회할 글번호
		}
		
		
		
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
		
		
		//2.비즈니스 로직 수행 -> Service -> DAO -> DB -> DAO -> Service -> 비즈니스 로직 수행(되돌아 온다)
		/*파라미터
		 int no : 상세조회할 글번호
		 boolean increaseReadCount:ture(이면 조회수 증가)*/
		/*NoticeData : notice테이블과 notice_content테이블 관련 데이터*/
		NoticeData noticeData =  readService.getNotice(no, true);
		noticeFile = readService.getFile(no);
		System.out.println("@@@@@@@@@@크레이트!@"+noticeFile.getFile_size());
		String finalUnit= unitConvert(noticeFile.getFile_size());
		
		System.out.println("@@@@@@@@파이널!!!!!"+finalUnit);
		
		//3.Model(비즈니스로직 수행결과)처리
		//릴레이용 pageNo=요청페이지&rowSize=1페이지당 게시글수
		request.setAttribute("noticeData", noticeData);
		request.setAttribute("noticeFile", noticeFile);
		request.setAttribute("finalUnit", finalUnit);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("rowSize", rsize);
		

		
		//4.View지정
		
//		return FORM_VIEW;
//		return request.getContextPath()+"/view/notice/readNotice.jsp";
		return "/view/notice/readNotice.jsp";
		//return null;
	}



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
	
}
