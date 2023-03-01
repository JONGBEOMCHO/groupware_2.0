package notice.model;

//632
//article_content 테이블 관련 글번호, 내용
public class NoticeContent {
	
	
	//필드
	private Integer number; //글번호
	private String content; //글번호
	
	
	
	//생성자
	public NoticeContent(Integer number, String content) {
		this.number = number;
		this.content = content;
	}

	
	
	//메소드
	public Integer getNumber() {
		return number;
	}

	public String getContent() {
		return content;
	}
	
	
	
	
	@Override
	public String toString() {
		return "NoticeContent [number=" + number + ", content=" + content + "]";
	}
	
	
	
}
