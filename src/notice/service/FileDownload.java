package notice.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/notice/download.dong")
public class FileDownload extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	


	//업로드된 파일 리스트 확인
	public String[] fileList(String realPath, HttpServletRequest request) {
		File dir = new File(realPath);
		return dir.list();
	}
	
	//파일 다운로드
	public void process(HttpServletRequest request, HttpServletResponse response) throws IOException {
	//public void fileDown(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		//1.파일명 가져오기
		String fileName = request.getParameter("fileName");
		//2.경로 가져오기
		String saveDir = request.getServletContext().getRealPath("upload"); 
		//String downLoadFile = "C:\\Users\\user\\git\\12_jsp_basic\\12_jsp_basic\\WebContent\\img\\" + fileName; 
		File file = new File(saveDir+"/"+fileName);
		//3.파일 유형 가져오기
		String mimeType = request.getServletContext().getMimeType(file.toString());
		System.out.println("mimeType : "+mimeType); //파일 유형을 가져온다.
		if(mimeType == null) {
			//http에서 파일형식을 모를때 지정하는 방식이 된다. 8비트 형식의 /응용프로그램 .egg, .bin등
			response.setContentType("application/octet-stream");
			System.out.println("파일 형식을 모를 때 실행 된다.");
		}
		
		//4. 다운로드용 파일명을 설정
		String downName = null;
		System.out.println("request.getHeader : "+request.getHeader("user-agent"));
		if(request.getHeader("user-agent").indexOf("Trident") == -1) { //Trident : 익스플로러 값
			downName = new String(fileName.getBytes("UTF-8"), "8859_1");
			System.out.println("익스폴러리 외 실행");
	
		}else {
			downName = new String(fileName.getBytes("euc-kr"), "8859_1");
			System.out.println("익스플로러 실행");
		}
		//5. 전송객체에 현재 파일을 붙여서 보내겠다(content-disposition 컨텐트를 처분)(attachment(부착)).
		response.setHeader("Content-Disposition", "attachment;filename=\"" + downName + "\";");
		
		//6. 요청된 파일을 읽어서 클라이언트 쪽으로 저장한다.
	    FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream(); 

	    int length;
	    byte[] b = new byte[(int)file.length()];
	
	    int data=0;
	    while((data=(fileInputStream.read(b,0, b.length))) !=-1) {
	    	
	    	servletOutputStream.write(b, 0, data);
	    	servletOutputStream.close();
	    	fileInputStream.close();
	    	System.out.println("마지막 실행~~~~");
	    }
	
	
	}
	
	
}
