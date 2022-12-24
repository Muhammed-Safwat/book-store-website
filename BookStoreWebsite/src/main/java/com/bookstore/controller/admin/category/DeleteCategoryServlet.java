package com.bookstore.controller.admin.category;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.service.BookService;
import com.bookstore.service.CategoryServices;

 
@WebServlet("/admin/delete_category")
public class DeleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryServices categoryServices = null ; 
	private BookService bookService = null ;
    public DeleteCategoryServlet() {
    	 categoryServices = new CategoryServices();
    	 bookService = new BookService();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id  = Integer.valueOf(request.getParameter("id"));
		
		Set<Book> bookList  = bookService.findBooksByCategory(id);
		 
		 if(bookList.size() > 0) {
			  request.setAttribute("massage","Con not delete category with ID ["+id+"]");
		 }else {
			 Category categroy  = categoryServices.get(id);
			 if(categroy!= null) {
			    categoryServices.delete(id);  
			    request.setAttribute("massage",categroy.getName()+" Category deleted sucssufully");
		 	}else {
		 		  request.setAttribute("massage","Could not find category with ID ["+id+"]");
		 	}
		 }
		RequestDispatcher requestDispatcher  =  request.getRequestDispatcher("list_category"); 
		requestDispatcher.forward(request, response);
	}
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
