package notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import notice.model.NoticeContent;
import jdbc.JdbcUtil;

//p656
//이 클래스는 notice_content테이블과 관련된 DB작업실행 클래스이다.
public class NoticeContentDAO {
	
	//필드
	
	//생성자
	
	//메소드
	
	
	//내용조회-p647 15라인
	/*파라미터 int no:상세조회할 글 번호
	 * 리턴유형 NoticeContent : 글번호, 내용*/
	public NoticeContent selectById(Connection conn, int no) throws SQLException{
		PreparedStatement pstmt = null;
		String sql = 	"select notice_no, content "+ 
						"from notice_content "+ 
						"where notice_no=?";
		ResultSet rs = null;
		NoticeContent content = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);//상제조회할 글번호
			rs = pstmt.executeQuery();
		if(rs.next()) {
			content = new NoticeContent(
					rs.getInt("notice_no"),
					rs.getString("content"));
			}
			return content;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}	
	
	
	//글내용수정
	/*파라미터   int noticeNumber : 글번호
	  String content : 수정할 내용 */
	public void update(Connection conn, int noticeNumber, String content) {
		PreparedStatement pstmt = null;
		String sql = "update notice_content "+ 
						"set content=? "+ 
						"where notice_no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, noticeNumber);
			int cnt = pstmt.executeUpdate();
			System.out.println("notice_content update된 행 수"+cnt);
		}catch(SQLException e) {
			e.printStackTrace();
		}		
		
	}

	//글삭제-delete
	/*파라미터   int no : 삭제할 글번호
	  리턴타입 int cnt: 삭제(delete)된 행 수. 1이면 삭제성공, 0이면 삭제실패*/
	public int deleteNotice(Connection conn, int no) {
		PreparedStatement pstmt = null;
		String sql = "delete from notice_content "+ 
					 "where notice_no=?";
		
		int cnt=0; // 삭제(delete)된 행 수를 저장할 변수
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			cnt = pstmt.executeUpdate();
			System.out.println("notice 삭제(delete)된 행 수"+cnt);
			return cnt;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
		}	
		return cnt;
	
	}


	//내용입력
	//파라미터 NoticeContent content: notice테이블에 입력된 마지막 글번호,입력한 내용
	//리턴타입 NoticeContent content: notice테이블에 입력된 마지막 글번호,입력한 내용
	public NoticeContent insert(Connection conn, NoticeContent content) {
		PreparedStatement pstmt = null;
		String sql = "insert into notice_content(notice_no, content) values(?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, content.getNumber());
			pstmt.setString(2,content.getContent());
			int cnt = pstmt.executeUpdate();
			System.out.println("content insert결과행수"+cnt);
			System.out.println("!!!!!!!!!!!!!!!!!!!!@@@@@@@@@@@@@@@"+content);
			
			if(cnt>0) { //noticeContent테이블에 insert성공
				return content;
			}else {
				return null;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	
	
	
}
