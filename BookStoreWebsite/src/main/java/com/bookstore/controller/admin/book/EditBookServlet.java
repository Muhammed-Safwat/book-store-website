package com.bookstore.controller.admin.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.admin.category.createCategoryServlet;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.service.BookService;
import com.bookstore.service.CategoryServices;


@WebServlet("/admin/edit_book")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 10,   // 10 kB
		  maxFileSize = 1024 * 300,        // 300 kB
		  maxRequestSize = 1024 * 1024     // 1 MB
	)
public class EditBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookService bookService; 
	private BookHelper bookHelper;
    private Book  book ; 
   
	public EditBookServlet() {
        super();
        bookService = new BookService();
        bookHelper =new BookHelper();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Integer id = Integer.valueOf(request.getParameter("id"));
		 if(bookService.get(id)==null) {
			 request.setAttribute("massage", "This book not exsist");
			 bookHelper.RequestDispatcher("list_book", request, response);
		 }else {
			 setDataToRequst(request ,id); 
			 request.setAttribute("massage", "");
		     // change page 
			 bookHelper.RequestDispatcher("book_edit.jsp" , request, response); 
		 }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		List<Book> books = bookService.findByTitle(title);
		if(books.size()>0 && books.get(0).getBookId() != book.getBookId()) {
			 request.setAttribute("massage", "Book "+title+" is alrady exsist");
			 request.setAttribute("id", book.getBookId());
			 bookHelper.RequestDispatcher("list_book" , request, response); 
		}else {
			 UpdateBook(request , response);	
			 request.setAttribute("massage", "Book "+book.getTitle()+" Updated succsufuly");
			 bookHelper.RequestDispatcher("list_book", request, response);
		}
	}
	
	private void setDataToRequst(HttpServletRequest request , Integer id){
		book = bookService.get(id);
		bookHelper.SetCategoryListToRequest(request);	
		request.setAttribute("book", book);
		// System.out.println("this book is ==> " + this.book.toString());
	}
	
	private void UpdateBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{	
		bookHelper.selectData(book , request ,response);
		System.out.println(book.toString());
		bookService.update(book); 
	}
	

}
