package notice.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.oreilly.servlet.MultipartRequest;

import notice.dao.NoticeContentDAO;
import notice.dao.NoticeDAO;
import notice.model.Notice;
import notice.model.NoticeFile;
import auth.service.User;
import jdbc.JdbcUtil;
import jdbc.conn.ConnectionProvider;

//p667
//게시글수정처리 관련 서비스 클래스
public class ModifyNoticeService {
	
	//필드
	private NoticeDAO noticeDAO = new NoticeDAO();
	private NoticeContentDAO contentDAO = new NoticeContentDAO();
	
	
	//생성자
	
	
	
	//메소드
	//수정처리 -p667 17라인
	//modifyRequest : 글수정을 위한 수정하는 사용자id, 수정할 글번호, 수정할 제목, 수정할 내용
	public void modify(ModifyRequest modifyRequest) {
		Connection conn = null;
		try {
			conn=ConnectionProvider.getConnection();
			conn.setAutoCommit(false);//auto커밋false설정

			//특정 글번호에 해당하는 (변경전)데이터 가져오기-p667 23라인
			Notice notice = noticeDAO.selectById(conn, modifyRequest.getNoticeNumber());
			if(notice==null) {
				throw new NoticeNotFoundException();
			}
			
			//수정불가시 퍼미션거부 예외처리로 넘긴다.
			//파라미터 : 수정하려는 사용자id, 특정글번호에 해당하는(변경전)db데이터
			//리턴유형 : db데이터작성자id와 수정하려는 사용자id가 동일하면   true리턴, 그렇지 않으면 false리턴*/
/*			if(!canModify(modifyRequest.getUserId(), notice)) {//p667 28라인
				throw new PermissionDeniedException();
			}*/
			//notice테이블의 내용 수정처리-p668 31라인
			noticeDAO.update(conn, modifyRequest.getNoticeNumber(), 
									modifyRequest.getTitle());
			
			
			
			
			
			//notice_content테이블의 수정처리-p668 33라인
			contentDAO.update(conn, modifyRequest.getNoticeNumber(), 
									modifyRequest.getContent());
			
			
			
			conn.commit();//커밋
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}catch(PermissionDeniedException e) {
			JdbcUtil.rollback(conn);
			throw e;
		}finally {
			JdbcUtil.rollback(conn);
		}
	}

	
	
	
	public NoticeFile fileInsert(ModifyRequest modReq, User authUser) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
				if( modReq.getModiFile().getFile_name() != null ){
					NoticeFile file = new NoticeFile(modReq.getNoticeNumber(), 
													modReq.getModiFile().getFile_name(),
													modReq.getModiFile().getOri_name(),
													modReq.getModiFile().getFile_type(),
													modReq.getModiFile().getFile_size()
													);
				System.out.println(modReq.getNoticeNumber());
			
				NoticeFile noticeFile = noticeDAO.fileInsert(conn, file);
				conn.commit();
				return noticeFile;
				}
				return null;
				 
			}catch (SQLException e) {
				e.printStackTrace();
				JdbcUtil.rollback(conn);
			}catch (RuntimeException e) {
				JdbcUtil.rollback(conn);
			}finally {
				JdbcUtil.close(conn);
			}
		return null;
	}
	
	

	

	public NoticeFile fileUpdate(ModifyRequest modReq, User authUser) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
				if( modReq.getModiFile().getFile_name() != null ){
					NoticeFile file = new NoticeFile(modReq.getNoticeNumber(), 
													modReq.getModiFile().getFile_name(),
													modReq.getModiFile().getOri_name(),
													modReq.getModiFile().getFile_type(),
													modReq.getModiFile().getFile_size()
													);
				System.out.println(modReq.getNoticeNumber());
				System.out.println("file내용!!!!!!!!!!!"+file);
				NoticeFile noticeFile = noticeDAO.fileUpdate(conn, file);
				conn.commit();
				return noticeFile;
				}
				return null;
				 
			}catch (SQLException e) {
				e.printStackTrace();
				JdbcUtil.rollback(conn);
			}catch (RuntimeException e) {
				JdbcUtil.rollback(conn);
			}finally {
				JdbcUtil.close(conn);
			}
		return null;
	}




	
	//p668 47라인
		/*파라미터
		 String modifyingUserId : 수정하려는 사용자 id
		  Notice notice : 특정글번호에 해당하는 (변경전)DB데이터
		*리턴유형
		boolean : db데이터작성자id와 수정하려는 사용자id가 동일하면   true리턴, 그렇지 않으면 false리턴*/
/*	private boolean canModify(String modifyingUserId, Notice notice) {

		//DB데이터에서 작성자 id를 가져오기
		String id = notice.getWriter().getWriter_id();
		
		//return "기준문자열".equels("비교문자열");
		//return "db데이터작성자 id".equels("수정하려는 사용자id");
		//일치하면 true리턴, 불일치하면 false리턴
		return id.equals(modifyingUserId);
	}
*/
}
