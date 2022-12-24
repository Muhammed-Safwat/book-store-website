package com.bookstore.controller.frontend;

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

 
@WebServlet("/view_category")
public class ViewBooksByCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BookService bookService ; 
    private CategoryServices categoryServices;
   
    public ViewBooksByCategoryServlet() {
        super();
        bookService = new BookService();
        categoryServices = new CategoryServices(); 
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 Integer id = Integer.valueOf(request.getParameter("id"));
		 Category category = categoryServices.get(id); 
		 if(category==null) {
			 request.setAttribute("massage", "Sorry, the category ID ["+id+"] is not available");
		 }else {
			 Set<Book> list =  bookService.findBooksByCategory(id);
			 System.out.println(list);
			 request.setAttribute("category", category);
			 request.setAttribute("books", list);
			 request.setAttribute("massage", "");
			 if(list.size()==0){
				 request.setAttribute("massage", "no Books");
			 } 
		 }
		 RequestDispatcher dispatcher = request.getRequestDispatcher("frontend/book_list_by_category.jsp");
		 dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		doGet(request, response);
	}

}
