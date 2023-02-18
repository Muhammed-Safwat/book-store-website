package com.bookstore.test;

import com.bookstore.entity.Book;
import com.bookstore.service.BookService;

public class testBook {
	 public static void main(String[] args) {
		
		 BookService bookService = new BookService();
		 Book b = bookService.get(35);
		 System.out.println(b.getAverageRating());
		  
	}
	
	
	
	
}
