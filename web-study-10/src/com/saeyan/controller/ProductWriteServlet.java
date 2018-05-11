package com.saeyan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.saeyan.dao.ProductDAO;
import com.saeyan.dto.ProductVO;

/**
 * Servlet implementation class ProductWriteServlet
 */
@WebServlet("/productWrite.do")
public class ProductWriteServlet extends HttpServlet {
	   private static final long serialVersionUID = 1L;
	       
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public ProductWriteServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

	   /**
	    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	    */
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      // TODO Auto-generated method stub
	      
	      RequestDispatcher dispatcher = request.getRequestDispatcher("product/productWrite.jsp");
	      dispatcher.forward(request, response);
	   
	   }

	   /**
	    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	    */
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      // TODO Auto-generated method stub
	      request.setCharacterEncoding("utf-8");
	      
	      ServletContext context = getServletContext();
	      String path = context.getRealPath("upload");
	      String encType = "UTF-8";
	      int sizeLimit = 20 * 1024 * 1024;
	      
	      MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());
	      
	     
	      String name = multi.getParameter("name");
	      int price = Integer.parseInt(multi.getParameter("price"));
	      String description = multi.getParameter("description");
			String pictureUrl = multi.getFilesystemName("pictureUrl");
	      ProductVO pvo = new ProductVO();
	      pvo.setName(name);
	      pvo.setPrice(price);
	      pvo.setPictureUrl(pictureUrl);
	      pvo.setDescription(description);
	      
	      ProductDAO pdao = ProductDAO.getInstance();
	      pdao.insertProduct(pvo);
	      
	      response.sendRedirect("productList.do");
	      
	   }

}
