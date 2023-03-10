package com.bookstore.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Book;
import com.bookstore.entity.Review;
import com.bookstore.service.BookService;
import com.bookstore.service.CategoryServices;
import com.bookstore.service.ReviewService;
 
@WebServlet("/view_book")
public class ViewBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookService bookService ; 
	private CategoryServices categoryServices;
	private ReviewService reviewService;
 
    public ViewBookServlet() {
        super();
        bookService = new BookService();
        categoryServices = new CategoryServices();
        reviewService = new ReviewService();
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	  String stringId  = request.getParameter("id");
		 Integer id = Integer.valueOf(stringId);
		 
		 Book book = bookService.get(id);
		 List<Review> reviewList = reviewService.findByBookId(stringId);
		 if(book==null) {
			 request.setAttribute("massage", "Sorry, the book with ID ["+id+"] is not available");
			 RequestDispatcher dispatcher = request.getRequestDispatcher("admin/massage.jsp");
			 dispatcher.forward(request, response);
		 }else {
			 
			 System.out.println("reviewList ==>"+reviewList);
 				request.setAttribute("book", book);
				request.setAttribute("reviewList", reviewList);
				RequestDispatcher dispatcher = request.getRequestDispatcher("frontend/book_detail_page.jsp");
				dispatcher.forward(request, response); 
		 }

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
