package notice.model;

public class NoticeFile {

	//필드
	private Integer notice_no;
	private String file_name;
	private String ori_name;
	private String file_type;
	private long file_size;
	

	
	//생성자
	public NoticeFile(){}
	
	public NoticeFile(int notice_no, String file_name, String ori_name, String file_type, long file_size) {
		this.notice_no = notice_no;
		this.file_name = file_name;
		this.ori_name = ori_name;
		this.file_type = file_type;
		this.file_size = file_size;
	}
	
	public NoticeFile(String file_name, String ori_name, String file_type, long file_size) {
		this.file_name = file_name;
		this.ori_name = ori_name;
		this.file_type = file_type;
		this.file_size = file_size;
	}

	
	
	
	//메소드 getter & setter
	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getOri_name() {
		return ori_name;
	}

	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
	}

	
	public String getFile_type() {
		return file_type;
	}

	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}

	public long getFile_size() {
		return file_size;
	}

	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}

	//toString
	@Override
	public String toString() {
		return "NoticeFile [notice_no=" + notice_no + ", file_name=" + file_name + ", ori_name=" + ori_name
				+ ", file_type=" + file_type + ", file_size=" + file_size + "]";
	}

	
	
		
	
	
	
	
	
	
	
	
	
	
	
}
