package com.bookstore.dao;

import java.util.List;

import javax.persistence.criteria.Order;

import com.bookstore.entity.BookOrder;
import com.bookstore.entity.OrderDetail;

public class BookOrderDAO extends JpaDAO<BookOrder> implements GenericDAO<BookOrder> {

	@Override
	public BookOrder create(BookOrder bookOrder) {		 
		return super.create(bookOrder);
	}

	@Override
	public BookOrder update(BookOrder bookOrder) {		 
		return super.update(bookOrder);
	}

	@Override
	public BookOrder get(Integer id) {		 
		return super.get(BookOrder.class, id);
	}

	@Override
	public void delete(Integer id) {
		 super.delete(BookOrder.class, id);
	}

	@Override
	public List<BookOrder> listAll() {
		return super.listAll("from BookOrder");
	}

	@Override
	public long count() {
		return super.count("select count(*) from BookOrder");
	}
	
	public List<BookOrder> GetOrdersByCustomerId(Integer id) {
		String sid = String.valueOf(id);
		return super.findByKeword("BookOrder", "customer", sid);
	}

	public List<BookOrder> getOrderWithCustomerId(String orderId , String customerId) {		 
		return super.findByTowKewords("BookOrder", "customer", customerId, "orderId", orderId);
	}
	
	public void  updateTotal(double num , int orderid) {
		 String number = String.valueOf(num);
		 String id = String.valueOf(orderid);
		super.updateValue("BookOrder", "total", number , "orderId", id);
	}
	
	public List<BookOrder> listAll(int max){
		return super.listAll("from BookOrder order by orderDate DESC", max);
	}
	
 
}
