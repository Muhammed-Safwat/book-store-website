package com.bookstore.controller.admin.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Book;
import com.bookstore.service.BookService;

@WebServlet("/admin/list_book")
public class listBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookService bookService = null ;
   
	public listBookServlet() {
        super();
        bookService = new BookService();
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Book> list = bookService.list();
		request.setAttribute("books", list);
		 
		 
		
		// redirect page 
		RequestDispatcher dispatcher = request.getRequestDispatcher("books_list.jsp");
		dispatcher.forward(request, response);
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
