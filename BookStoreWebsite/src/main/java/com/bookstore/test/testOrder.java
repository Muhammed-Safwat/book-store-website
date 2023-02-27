package com.bookstore.test;

import java.util.List;

import javax.persistence.criteria.Order;

import com.bookstore.dao.BookDAO;
 
import com.bookstore.entity.Book;
 

public class testOrder {
	public static void main(String[] args) {
		
		BookDAO dao  = new BookDAO();
		List<Book> books= dao.bestSealing(3);
	   for(Book d : books) {
		   System.out.println(d.toString());
	   }
		/*BookOrderDAO bookOrderDAO = new BookOrderDAO() ; 
		List<BookOrder> orders = bookOrderDAO.listAll();
		
		for(BookOrder b : orders) {
			for(OrderDetail d : b.getOrderDetails()) {
				d.setSubtotal();
			}
			b.setTotal();
			bookOrderDAO.update(b); 
		}*/
		 
	       
	       
	 
	}
}
