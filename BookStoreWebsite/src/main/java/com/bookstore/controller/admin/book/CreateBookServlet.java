package com.bookstore.controller.admin.book;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookstore.service.BookService;

@WebServlet("/admin/create_book")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,  // 1 MB
	    maxFileSize = 10 * 1024 * 1024,  // 10 MB
	    maxRequestSize = 10 * 1024 * 1024 // 10 MB
	)
public class CreateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  BookService bookService = new BookService(request, response);
		  bookService.showBookForm();
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		byte[] image = GetImage(req , resp);
		req.getSession(true).setAttribute("bookImage", image);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 BookService bookService = new BookService(request, response);
		 byte[] image =(byte[]) request.getSession().getAttribute("bookImage");
	     request.getSession().removeAttribute("bookImage");
		 bookService.addBook(request , response ,image);
		 
	}
	
	protected byte[] GetImage(HttpServletRequest request, HttpServletResponse response) {
		byte[] image  =null; 
		try {
			Part part = request.getPart("image");
			if(part !=null && part.getSize()>0) {
				
				 long size = part.getSize();
				 image = new byte[(int)size];
				 
				 InputStream inputStream = part.getInputStream();
				 inputStream.read(image) ;
				 
				 inputStream.close();
			}
		} catch (IOException | ServletException e) {	 
			e.printStackTrace();
		}  
		return image ;
	}
	
}
