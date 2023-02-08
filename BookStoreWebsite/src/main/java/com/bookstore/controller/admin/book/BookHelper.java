package com.bookstore.controller.admin.book;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.service.BookService;
import com.bookstore.service.CategoryServices;

public class BookHelper {
	
	BookService bookService ;
	CategoryServices categoryServices  ; 
	
	public BookHelper() {
		bookService = new BookService();
		categoryServices = new CategoryServices();
	}
 
	protected String GetCurrentDate() {
	     Date date = new Date() ;
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:m:ss");
	    return formatter.format(date);
	}
	
	protected  Category GetCategoy(HttpServletRequest request) {
		 Integer  id =Integer.valueOf(request.getParameter("category")) ;
		 Category category = categoryServices.get(id);
		 System.out.println(category.getCategoryId());
		return category; 
	}
	
	protected void SetCategoryListToRequest(HttpServletRequest req){
		List<Category> categoryList = categoryServices.list();
		req.setAttribute("categoryList", categoryList);
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
	
	protected boolean isExist(String title) {
		// slect books
		List<Book> list = bookService.findByTitle(title);
		
		if(list.size()==0) {
			return false ;
		}
		return true ;
	}
	
	protected Book SetBookData(Book book , String title , String author , String description ,String isbn,String lastUpdateTime ,String publishDate,Category category,double price  ,byte[] image) {
		book.setTitle(title);
		book.setAuthor(author);
		book.setCategory(category);
		book.setDescription(description);
		if(image!=null) book.setImage(image);
		book.setIsbn(isbn);
		book.setLastUpdateTime(lastUpdateTime);
		book.setPublishDate(publishDate);
		book.setPrice(price);
		return book ;
	}
	
	protected Book selectData(Book book ,HttpServletRequest request, HttpServletResponse response)  {
		// declare attribute 
		String title , author , description, isbn ,publishDate ="" , lastUpdateTime="";	 
		byte[] image;  
		double price;
		Category category = null  ; 
		// get data 
		title = request.getParameter("title");
		author = request.getParameter("author");
		description = request.getParameter("discription");
		isbn = request.getParameter("ispn");
		lastUpdateTime = GetCurrentDate();
		publishDate = request.getParameter("publish-date");
		price = Float.parseFloat(request.getParameter("price"));
		//price = Double.parseDouble(request.getParameter("price"));
		System.out.println(request.getParameter("price"));
		category = GetCategoy(request);
	    image = GetImage(request, response);
	    
	    
	   return this.SetBookData(book , title , author , description ,  isbn, lastUpdateTime , publishDate, category, price  ,image);
		 
	}
	
 
	protected void RequestDispatcher(String page , HttpServletRequest request, HttpServletResponse response ) {
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}  		 
	}
}
