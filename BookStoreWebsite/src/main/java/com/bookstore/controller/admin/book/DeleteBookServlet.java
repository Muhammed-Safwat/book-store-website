package com.bookstore.controller.admin.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Book;
import com.bookstore.service.BookService;
 
@WebServlet("/admin/delete_book")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BookService bookService ;   
    private BookHelper bookHelper; 
    public DeleteBookServlet() {
    	bookService = new BookService() ;
    	bookHelper = new  BookHelper();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Integer id = Integer.valueOf(request.getParameter("id"));
		 System.out.println("id ==> "+id);
		 Book book = bookService.get(id);
		 
		 if(book==null){
			 request.setAttribute("massage", "This book deleted");
		 }else {
			 bookService.delete(id);
			 request.setAttribute("massage", "book "+id+" deleted sucssufly ");
		 }

	     // change page 
		 bookHelper.RequestDispatcher("list_book" , request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doGet(request, response);
	}

}
