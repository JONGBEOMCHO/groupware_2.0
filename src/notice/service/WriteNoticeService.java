package notice.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import auth.service.User;
import jdbc.JdbcUtil;
import jdbc.conn.ConnectionProvider;
import notice.dao.NoticeContentDAO;
import notice.dao.NoticeDAO;
import notice.model.Notice;
import notice.model.NoticeContent;

//p638
//글쓰기 기능을 제공하는 서비스클래스
public class WriteNoticeService {
	
	//필드
	private NoticeDAO noticeDAO = new NoticeDAO();
	private NoticeContentDAO noticeContentDAO = new NoticeContentDAO();
	
	//생성자
	
	
	//메소드
	//글입력
	/*파라미터  WriteRequest writeReq : Writer(로그인한 유저id, 로그인한 유저명), 입력제목, 입력내용*/
	//리턴타입 Integer : notice테이블에 입력된 글번호
//	public Integer write(WriteRequest writeReq) { ★★★★★★★★★★※emp_no 참조키 제약사항 걸기 전 소스
	public Integer write(WriteRequest writeReq, User authUser) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);	//autocommit 설정해제
			
			Notice notice = toNotice(writeReq); //p639 25라인
			
			//파라미터 Notice notice:Writer(로그인한유저id,로그인한유저명),입력제목,입력내용, 입력일,마지막수정일 추가
			//Notice테이블에 마지막 insert + Notice테이블에 마지막 insert한 id가져오기
//			Notice savedNotice = noticeDAO.insert(conn, notice);//Notice테이블에 insert //p639 26라인     //  ★★★★★★★★★★※emp_no 참조키 제약사항 걸기 전 소스
			Notice savedNotice = noticeDAO.insert(conn, notice, authUser);//Notice테이블에 insert //p639 26라인
			if(savedNotice==null) {
				throw new RuntimeException("notice테이블에 insert하면서 발생한 error(insert 실패)");
			}
			
			//p639 30라인
			NoticeContent content = 
					new NoticeContent(savedNotice.getNumber(), writeReq.getContent());
			
			
			//p639 33라인
			NoticeContent savedContent= noticeContentDAO.insert(conn, content);//Notice_content테이블에 insert
			if(savedContent==null) {
				throw new RuntimeException("noticeContent테이블에 insert하면서 발생한 error(insert 실패)");
			}
			
			conn.commit();	//커밋 실행 p639 38라인		
			
			return savedNotice.getNumber();//p639 40라인
			
		}catch (SQLException e) {//p639 41라인
			//e.printStackTrace(); 없어도 된다.
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}catch(RuntimeException e) {//p639 44라인
			JdbcUtil.rollback(conn);
			throw e;
		}finally {//p639 47라인
			JdbcUtil.close(conn);
		}
	}//write 끝

	//p639 52라인
	//글입력시 필요한 data를 세팅 : 파라미터에
	//*파라미터  WriteRequest writeReq : Writer(로그인한 유저id, 로그인한 유저명), 입력제목, 입력내용*/
	//리턴유형 Notice : WriteRequest에 입력일, 마지막 수정일 추가
	private Notice toNotice(WriteRequest writeReq) {
		//파라미터에 
		Date now = new Date();
		//입력일은 현재 날짜시간정보 설정
		//마지막 수정일은 입력일과 동일하게 현재날짜시간 정보 설정
		return new Notice(null, writeReq.getWriter(), writeReq.getTitle(), now, now, 0, "Y");
		
	}
}
