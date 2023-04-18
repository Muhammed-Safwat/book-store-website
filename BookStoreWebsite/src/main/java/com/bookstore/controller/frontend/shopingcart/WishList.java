package com.bookstore.controller.frontend.shopingcart;

import java.util.HashMap;
import java.util.Map;

import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;

public class WishList {
	private BookDAO bookDAO;
	private Map<Integer , Book> list ;
	
	public WishList(){
		this.bookDAO= new BookDAO();
		list  = new HashMap<>();
	}
	
	public void save(int id) {
		if(!isExsit(id)) {
			add(id);
		}else {
			remove(id);
		}
	}

	private void remove(int id) {
		this.list.remove(id);
	}

	private void add(int id) {
		Book book = bookDAO.get(id);
		this.list.put(id, book);
	}

	public boolean isExsit(int id) {
		return this.list.containsKey(id);
	}
	
	public Map<Integer , Book> getItems(){
		return this.list;
	}
	
	public int totalItems(){
		return this.list.size();
	}
	
}
