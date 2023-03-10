package com.bookstore.controller.frontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Book;
import com.bookstore.service.BookService;
import com.bookstore.service.CustomerService;
import com.bookstore.service.ReviewService;


@WebServlet("/profile/create_review")
public class CreateCustomerReivewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BookService bookService;
    private ReviewService reviewService;
    private CustomerService customerService ; 
  
    public CreateCustomerReivewServlet() {
    	bookService = new BookService();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stringId = 	request.getParameter("id");
		Integer id = Integer.valueOf(stringId);
		Book book = bookService.get(id);
		System.out.println(book.toString());
		request.setAttribute("book", book);
		
		request.getRequestDispatcher("../frontend/make_review.jsp").include(request, response);
	}

}
