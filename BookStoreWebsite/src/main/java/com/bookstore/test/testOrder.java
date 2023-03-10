package com.bookstore.test;

import java.util.List;

import com.bookstore.dao.BookOrderDAO;
import com.bookstore.entity.BookOrder;
 

public class testOrder {
	public static void main(String[] args) {
		
		 
		 BookOrderDAO bookOrderDAO = new BookOrderDAO() ; 
		List<BookOrder> orders = bookOrderDAO.listAll();
		
		for(BookOrder b : orders) {
			 b.setTotal();
			 bookOrderDAO.update(b);
		} 
		 
		 
	       
	       
	 
	}
}
