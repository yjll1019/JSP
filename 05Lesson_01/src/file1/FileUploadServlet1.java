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
@WebServlet("/file1/FileUploadServlet1")
public class FileUploadServlet1 extends HttpServlet {
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
		

        response.setContentType("text/html; utf-8"); // ���������� HTML �±� ��� ����
        response.setCharacterEncoding("utf-8");
        PrintWriter writer = response.getWriter();
        writer.write("<html>");
        writer.write("<head>");
        writer.write("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
        writer.write("<title>Servlet 3.0 File Upload Example</title>");
        writer.write("</head>");
        writer.write("<body>");
        writer.write("<h3>���Ͼ��ε� ���</h3>");
        writer.write("<div>����: " + ���� + "</div>");
        writer.write("<div>�����̸�: " + ���ϸ� + "</div>");
        writer.write("<div>����ũ��: " + ����ũ�� + "</div>");
        if (����ũ�� > 0) {
            writer.write("<div>���������: " + path.toString() + "</div>");
            writer.write("<div>�ٿ�ε� ��ũ: <a download href='" + �ٿ�ε�URL + "'>�ٿ�ε�</a></div>");
        }
        writer.write("</body>");
        writer.write("</html>");
        writer.close(); // HTML �±� ��� ��

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
