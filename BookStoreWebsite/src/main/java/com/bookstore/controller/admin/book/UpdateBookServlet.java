package com.bookstore.controller.admin.book;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.BookService;
@MultipartConfig(
		  fileSizeThreshold = 1024 * 10,   // 10 kB
		  maxFileSize = 1024 * 300,        // 300 kB
		  maxRequestSize = 1024 * 1024     // 1 MB 
	)
@WebServlet("/admin/update_book")
public class UpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 BookService bookService = new BookService(request, response);
		 bookService.updateBook();
	}

}
