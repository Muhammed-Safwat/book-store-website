package com.bookstore.controller.admin.book;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.service.BookService;
import com.bookstore.service.CategoryServices;

@WebServlet("/admin/create_book")
@MultipartConfig(
	  fileSizeThreshold = 1024 * 10, // 10 kB
	  maxFileSize = 1024 * 300,      // 300 kB
	  maxRequestSize = 1024 * 1024    // 1 MB
)
public class CreateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookService bookService = null ;
	BookHelper bookHelper ; 
	
    public CreateBookServlet() {
    	bookService = new BookService();
    	bookHelper = new BookHelper();
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 bookHelper.SetCategoryListToRequest(request);
		 request.setAttribute("massage", "");
	     // change page 
		 bookHelper.RequestDispatcher("book_form.jsp" , request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(1);
		
		if(bookHelper.isExist(request.getParameter("title"))) {
			request.setAttribute("massage", "This Book is alrady exsist");
			bookHelper.RequestDispatcher("book_form.jsp",request, response);
			System.out.println(2);
		}else{
			saveBook(request , response);
			bookHelper.RequestDispatcher("list_book",request ,response);
			System.out.println(3);
		}
	}
	
	private void saveBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{	
		Book book = new Book();
		Category category = bookHelper.GetCategoy(request);
		bookHelper.selectData(book , request ,response);
		System.out.println(book.toString());
		bookService.add(book);   
	}
	

	

	

	

}
