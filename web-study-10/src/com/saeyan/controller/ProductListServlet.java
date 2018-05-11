package com.saeyan.controller;
//��û�� ������ ProductDAOŬ������ selectAllProducts()�� ������ �ֱ� ����� ��ǰ�� ����ϴ� ���� Ŭ����.
import java.io.IOException; 
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dto.ProductVO;
import com.saeyan.dao.ProductDAO;
/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/productList.do")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductDAO pDao = ProductDAO.getInstance();
		
		List<ProductVO> productlist = pDao.selectAllProducts();
		request.setAttribute("productList", productlist);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("product/productList.jsp");
		dispatcher.forward(request, response);
	}


}
