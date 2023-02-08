package com.bookstore.controller.frontend;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Book;
import com.bookstore.entity.Test;
import com.bookstore.service.BookService;
import com.bookstore.service.CategoryServices;
import com.google.gson.Gson;


@WebServlet("")
public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CategoryServices categoryServices = null ;
    BookService bookService = null ;
    private Gson gson = new Gson();
    
    
    public HomePageServlet() {
        super();
        categoryServices = new CategoryServices();
        bookService = new BookService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// category
		/*List<Category>  categoryList = categoryServices.list();
		/*request.setAttribute("categories", categoryList);
		System.out.println(categoryList);
		*/
		/*
		
		 ServletContext context = request.getServletContext();
		 
		context.setAttribute("categories", categoryList);
		*/
		// new books */
	 	List<Book>  BookList = bookService.newList();	
		request.setAttribute("books", BookList);
		//System.out.println(categoryList);
		
		 String page = "/frontend/index.jsp" ; 
		 RequestDispatcher dispatcher  = request.getRequestDispatcher(page);
		 dispatcher.forward(request, response); 
		
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		  
		
		/*Book t = new Book() ; 
		 
		   t.setPrice(33.2);
	       System.out.println(t);
	    
	       String ss = new Gson().toJson(t);

	     	System.out.println(ss);
	        PrintWriter out = response.getWriter();
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        out.print(ss);
	        out.flush();*/
        

      
	}

}
