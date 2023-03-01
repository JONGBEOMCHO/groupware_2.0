package notice.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.JdbcUtil;
import jdbc.conn.ConnectionProvider;
import notice.dao.NoticeDAO;
import notice.model.Notice;
import notice.model.NoticeFile;

//p650
//
public class ListNoticeService {

	//필드
	private NoticeDAO noticeDAO = new NoticeDAO();
	//private int size = 3; //p651 14라인   -->>주석 처리하고 컨트롤러에서 size 값을 받겠다!! 라는 뜻
	//생성자
	
	//메소드
	////p651 14라인 : 목록조회+페이징처리 관련 내용-p651 16라인
	/*파라미터 
	 * int pageNo: 보고싶은 페이지(요청페이지)
	   int size: 1페이지당출력게시물
	 *리턴타입 NoticePage : 목록+페이징처리 관련내용*/
	
	//public 리턴유형 메소드명(매개변수) {
	//public List<Notice> getNoticePage(int pageNo, int size) { //위에 주석 처리하고 컨트롤러에서 size 값을 받겠다!! 라는 뜻
	public NoticePage getNoticePage(int pageNo, int size) { //원래소스
			
		try{
		Connection conn = ConnectionProvider.getConnection();
		//페이징처리와 관련하여
		//limit 시작행 인덱스 번호, 1페이지당 출력게시물수를 제시햔다.
		/*파라미터 
		 int startRow : 시작행 인덱스번호, 가장 첫 번쨰 행은 0부터 시작
		 int size : 1페이지당 출력게시물 수 
		 pageNo-1 은 인덱스 번호가 0부터 시작하기 때문에 해주는 것이고
		 size를 곱하는 것은 페이지당 출력 개수를 곱해야 그 배수로 움직이기 때문에.
		 ex) size 가 3이고 요청페이지행이 5일때 첫 시작 페이지가 구하는것이면*/
		
					//(8-1)*3=21 (8번째 행의 시작페이지 인덱스 번호(21) )
				
		int total = noticeDAO.selectCount(conn);//전체 게시물수 //원래소스
		List<Notice> noticeList = noticeDAO.select(conn, (pageNo-1)*size, size); //원래소스
		
		return new NoticePage(total, pageNo, size, noticeList);
		
//			return noticeList;
		
		}catch(SQLException e){
		throw new RuntimeException();
		}
		
	}
		
		
	public NoticePage getNoticePage(String choice, String keyword, int pageNo, int size) { //리턴 유형이 바뀜
			
		try{
		Connection conn = ConnectionProvider.getConnection();
		//페이징처리와 관련하여
		//limit 시작행 인덱스 번호, 1페이지당 출력게시물수를 제시햔다.
		/*파라미터 
		 int startRow : 시작행 인덱스번호, 가장 첫 번쨰 행은 0부터 시작
		 int size : 1페이지당 출력게시물 수 
		 pageNo-1 은 인덱스 번호가 0부터 시작하기 때문에 해주는 것이고
		 size를 곱하는 것은 페이지당 출력 개수를 곱해야 그 배수로 움직이기 때문에.
		 ex) size 가 3이고 요청페이지행이 5일때 첫 시작 페이지가 구하는것이면*/
		
					//(8-1)*3=21 (8번째 행의 시작페이지 인덱스 번호(21) )
		
		int sTotal = noticeDAO.searchSelectCount(conn, choice, keyword);//전체 게시물수 
		List<Notice> sNoticeList = noticeDAO.searchSelect(conn, choice, keyword, (pageNo-1)*size, size); 
		
		return new NoticePage(sTotal, pageNo, size, sNoticeList);
		
//				return noticeList;
		
		}catch(SQLException e){
		throw new RuntimeException();
		}

	}


	public List<NoticeFile> listFile() {
		Connection conn=null;
		try {
			conn = ConnectionProvider.getConnection();

			List<NoticeFile> noticleFile = noticeDAO.listFile(conn);
		
		
			return noticleFile;
		
		}catch(SQLException e) {
			throw new RuntimeException();
		}finally {
			JdbcUtil.close(conn);
		}
	}
	
	
	
}
