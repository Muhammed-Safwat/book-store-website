package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Book;

public class HomePageService {
	private HttpServletRequest request  ;
	private HttpServletResponse response;
	private BookService bookService;
	public HomePageService(HttpServletRequest request, HttpServletResponse response)  {
		 this.request=request;
		 this.response=response;
		 bookService = new BookService(request, response);
	}
	
	public void loadHomePage() throws ServletException, IOException{
		List<Book>  bookList = bookService.newList();
	 	List<Book> mostfav = bookService.mostFav(3);
	 	List<Book> bestSaling = bookService.bestSealing(3);
		request.setAttribute("books", bookList);
		request.setAttribute("mostfav", mostfav);
		request.setAttribute("bestSaling", bestSaling);
		 
		 RequestDispatcher dispatcher  = request.getRequestDispatcher("/frontend/index.jsp");
		 dispatcher.forward(request, response); 
	}
}
