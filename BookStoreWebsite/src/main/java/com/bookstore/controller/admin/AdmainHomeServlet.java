package com.bookstore.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookOrderDAO;
import com.bookstore.dao.CustomerDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Review;
import com.bookstore.service.UserServices;
 

@WebServlet("/admin/homepage")
public class AdmainHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserServices  userServices = null ;
	private BookOrderDAO bookOrderDAO = null;
	private ReviewDAO reviewDAO;
	
    public AdmainHomeServlet() {
        super();
        userServices = new  UserServices() ;
        reviewDAO = new ReviewDAO();
        bookOrderDAO = new BookOrderDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		List<BookOrder> orders =  bookOrderDAO.listAll(4);
		List<Review> reviews =  reviewDAO.listAll(4); 
		 request.setAttribute("orders", orders);
		 request.setAttribute("reviews", reviews);
		 
		 setAttributes(request);
		 
		 RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		 dispatcher.forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void setAttributes(HttpServletRequest request) {
		    BookOrderDAO  bookOrderDAO = new BookOrderDAO();
		    CustomerDAO customerDAO = new CustomerDAO();
		    
		 request.setAttribute("totalOrders", bookOrderDAO.count());
		 request.setAttribute("totalReviews",reviewDAO.count()  );
		 request.setAttribute("totalCustomers",customerDAO.count());
		 request.setAttribute("totalBooks", bookOrderDAO.count());
		 request.setAttribute("totalUsers",userServices.count());
		 
	}

}
