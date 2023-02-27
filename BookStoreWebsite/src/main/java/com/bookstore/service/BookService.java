package com.bookstore.service;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;

public class BookService {	
	private BookDAO bookDAO  = null ; 
	private HttpServletRequest request;
    private HttpServletResponse response;
    
    
	public BookService() {
		this.bookDAO = new BookDAO(); 
	}
	
	public void add(Book book) {
		bookDAO.create(book);
	}
	
	public void update(Book book) {
		bookDAO.update(book);
	}
	
	public void delete(Integer id) {
		bookDAO.delete(id);
	}
	
	public Book get(Integer id ) {
		return bookDAO.get(id);
	}
	
	public List<Book>  findByTitle(String title) {
		return bookDAO.findByTitle(title);
	}
	
	public List<Book> newList(){
		return bookDAO.newList();
	}
	
	public List<Book> list(){
		return bookDAO.listAll();
	}
	
	public long count() {
		return bookDAO.count();
	} 
	
	public Set<Book> findBooksByCategory(Integer id){
		return bookDAO.ListByCategory(id);
	}
	
	public List<Book> findByKeyWord(String key){
		return  bookDAO.findBookByKeyWord(key);
	}

	public List<Book> mostFav(int max) {
		 
		return bookDAO.mostFav(max);
	}

	public List<Book> bestSealing(int max) {
		 
		return bookDAO.bestSealing(max);
	}


}
