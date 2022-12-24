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
import com.bookstore.service.BookService;
 
@WebServlet("/search")
public class SearchBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BookService bookService; 
 
    public SearchBookServlet() {
        super();
        bookService = new BookService();
    }
 
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String keyword = request.getParameter("key");
		
	 
		  List<Book> books =  bookService.findByKeyWord(keyword);
		  
		  if(books.size()==0) {
			  request.setAttribute("massage", "No books");
		  }else {
			  request.setAttribute("massage", "");
		  }
		  
		  request.setAttribute("books", books);
		  request.setAttribute("key", keyword);
		  System.out.println(keyword);
		  System.out.println(books);
		  
		     String page = "/frontend/search_result.jsp" ; 
			 RequestDispatcher dispatcher  = request.getRequestDispatcher(page);
			 dispatcher.forward(request, response);
		
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		doGet(request, response);
	}

}
