package com.saeyan.controller;

//���� ���ε带 ���� ���� Ŭ����
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest; //���� ���ε带 ���� ����ϴ� Ŭ����
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy; //���� �̸��� �ߺ��Ǹ� �˾Ƽ� �ٲ��ִµ� �� �� ����ϴ� 

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/upload2.do")
public class MultiUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MultiUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//���⸦ �ٲ��ָ� �ٿ�޴� ��ΰ� �ٲ��.
		String savePath = "upload";
		//�ִ� ���ε� ���� ũ�� 5MB�� ����
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "utf-8";
		
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		System.out.println("�������� ���� ���丮");
		System.out.println(uploadFilePath);
		
		try {
			MultipartRequest multi = new MultipartRequest(
			request, uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy()		
			//��ü, �������� ���� ���丮, �ִ� ���ε� ���� ũ��, ���ڵ� ���, ������ �̸��� �����ϸ� ���ο� �̸��� �ο���.
			);
			
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()) {
				String file = (String) files.nextElement();
				String file_name = multi.getFilesystemName(file); 
				//�ߺ� ���ε� �� ���ϸ��� �ٲ۴�.
				String ori_file_name = multi.getOriginalFileName(file);
				out.println("<br> ���ε�� ���ϸ� : " + file_name);
				out.println("<br> ���� ���ϸ� : "+ ori_file_name);
				out.println("<hr>");
			}
		}catch(Exception e) {
			System.out.println("���� �߻�: "+e);
		}

	}

}
