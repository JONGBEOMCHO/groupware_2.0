package notice.service;
 
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/fileDelete")
public class FileDelete extends HttpServlet{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        actionDo(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        actionDo(request,response);
    }
    private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        String fileName = request.getParameter("file");
        String no = request.getParameter("no");
        String pageNo = request.getParameter("pageNo");
        String rowSize = request.getParameter("rowSize");
        
        //String directory = this.getServletContext().getRealPath("/data/pds/");
        String directory = this.getServletContext().getRealPath("/upload");
        
        File file = new File(directory+fileName);
        
        if(file.exists()) {    //삭제하고자 하는 파일이 해당 서버에 존재하면 삭제시킨다
            file.delete();
            request.setAttribute("msg", "fileDeleteOk");
        } else {
            request.setAttribute("msg", "fileDeleteNo");
        }
        request.setAttribute("url", request.getContextPath()+"/modify.do");
		request.setAttribute("rowSize", rowSize); //로우사이즈
		request.setAttribute("pageNo", pageNo); //
		request.setAttribute("no", no); //
        
        //RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/msg/message.jsp");
        //RequestDispatcher dispatcher = request.getRequestDispatcher("/view/notice/modifyForm.jsp");
        RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath()+"modify.do");
        dispatcher.forward(request, response);
        ///보류...
    }
    
}