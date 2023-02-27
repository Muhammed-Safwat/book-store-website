package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.Book;
import com.bookstore.entity.OrderDetail;


public class OrderDetailDAO  extends JpaDAO<OrderDetail>{
	
	public void delete(int id) {
		 super.delete(OrderDetail.class, id);
	}
	
	public List<OrderDetail> mostFav() {		 
		return super.listAll("SELECT book FROM Book WHERE book. ");
	}


	
}
