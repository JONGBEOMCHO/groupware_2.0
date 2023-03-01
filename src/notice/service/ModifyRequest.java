package notice.service;

import java.util.Map;

import notice.model.NoticeFile;

//p666
//글 수정을 위한 수정하는 사용자id, 수정할 글번호, 수정할 제목, 수정할 내용을 담는 클래스
//유효성 검사 기능을 제공하는 클래스
public class ModifyRequest {

	private String userId;//수정하는 사용자 id
	private int noticeNumber;//수정할 글번호
	private String writer_name;//작성자 name(출력용-원래 없는것)
	private String title; //수정할 제목
	private String content; //수정할 내용
	private NoticeFile modiFile;
	
	


/*	public ModifyRequest(String userId, int noticeNumber, String writer_name, String title, String content) {
		this.userId = userId;
		this.noticeNumber = noticeNumber;
		this.writer_name = writer_name;
		this.title = title;
		this.content = content;
	}*/
	
	public ModifyRequest(int noticeNumber, String writer_name, String title, String content) {
		this.noticeNumber = noticeNumber;
		this.writer_name = writer_name;
		this.title = title;
		this.content = content;
	}
	
	
	
	public ModifyRequest(int noticeNumber, String writer_name, String title, String content, NoticeFile modiFile) {
		this.noticeNumber = noticeNumber;
		this.writer_name = writer_name;
		this.title = title;
		this.content = content;
		this.modiFile = modiFile;
	}
	


	
	public String getUserId() {
		return userId;
	}




	public int getNoticeNumber() {
		return noticeNumber;
	}



	public String getWriter_name() {
		return writer_name;
	}



	public String getTitle() {
		return title;
	}



	public String getContent() {
		return content;
	}



	public NoticeFile getModiFile() {
		return modiFile;
	}




	//유효성 검사기능 -p667 35라인
	public void validate( Map<String, Boolean> errors) {
		if(title==null || title.trim().isEmpty() ){
			errors.put("title", Boolean.TRUE);
		}
	}




	@Override
	public String toString() {
		return "ModifyRequest [userId=" + userId + ", noticeNumber=" + noticeNumber + ", writer_name=" + writer_name
				+ ", title=" + title + ", content=" + content + ", modiFile=" + modiFile + "]";
	}



//	@Override
//	public String toString() {
//		return "ModifyRequest [userId=" + userId + ", noticeNumber=" + noticeNumber + ", writer_name=" + writer_name
//				+ ", title=" + title + ", content=" + content + "]";
//	}



	
	
	
	
	
	
}
