package file1;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class FileUploadServlet1
 */
@MultipartConfig
@WebServlet("/file1/FileUploadServlet2")
public class FileUploadServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String ���ε�_���� ="/upload";
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String ���� = request.getParameter("title");
		
		Part filePart = request.getPart("upload1");//���ε� �� ���� ������
		String ���ϸ� = getFileName(filePart);
		long ����ũ�� = filePart.getSize();
		
		String ������� = request.getServletContext().getRealPath(���ε�_����);
		Path path = Paths.get(�������, ���ϸ�);
		if(����ũ�� > 0 ) saveFile(filePart, path); //���������ϱ�
		String �ٿ�ε�URL = request.getContextPath()+���ε�_����+"/"+���ϸ�;
		
		request.setAttribute("����", ����);
		request.setAttribute("���ϸ�", ���ϸ�);
		request.setAttribute("����ũ��", ����ũ��);
		request.setAttribute("���������", ���ϸ�);
		if(����ũ��>0) {
			request.setAttribute("���ϸ�", path.toString());
			request.setAttribute("�ٿ�ε� ��ũ", �ٿ�ε�URL);
		}
		request.getRequestDispatcher("/file1/download2.jsp").forward(request, response);
	}
	
	//���ϸ� ���ϱ�
 	private String getFileName(Part filePart) {
        for (String content : filePart.getHeader("content-disposition").split(";"))
            if (content.trim().startsWith("filename")) {
                String path = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
                return new File(path).getName();
            }
        return null;

	}

 	//���������ϱ�
    private void saveFile(Part filePart, Path path) throws IOException {
        InputStream inputStream = filePart.getInputStream();
        OutputStream outputStream = new FileOutputStream(path.toFile());
        try {
            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = inputStream.read(bytes)) != -1)
                outputStream.write(bytes, 0, read);
        } finally {
            if (outputStream != null) outputStream.close();
            if (inputStream != null) inputStream.close();
        }
    }

 	
}
