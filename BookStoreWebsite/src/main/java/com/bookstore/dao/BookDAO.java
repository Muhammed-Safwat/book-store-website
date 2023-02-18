package com.bookstore.dao;

import java.util.List;
import java.util.Set;

import com.bookstore.entity.Book;
import com.bookstore.service.CategoryServices;

public class BookDAO extends JpaDAO<Book> implements GenericDAO<Book> {

	@Override
	public Book create(Book book) {
		return  super.create(book);
	}

	@Override
	public Book update(Book book) {
		return super.update(book);
	}

	@Override
	public Book get(Integer id) {
		return super.get(Book.class, id);
	}
	
	public List<Book> findByTitle(String title) {
		return super.findBy("Book", "title", title);
	}
	
	public Set<Book> ListByCategory(Integer id){
		CategoryServices categoryServices  = new CategoryServices();
		return categoryServices.get(id).getBooks();
	}

	@Override
	public void delete(Integer id) {
		super.delete(Book.class, id);
	}

	@Override
	public List<Book> listAll() {
		return super.listAll("from Book");
	}
	
	public List<Book> newList(){
		return super.decOrderList("Book" , "publishDate");
	}

	public long count() {
		 return super.count("select count(*) from Book");
	}
	
	public List<Book> findBookByKeyWord( String keyword){
		 List<Book> books = super.findByKeword("Book", "title" , keyword);
		if(books.size()==0) {
			return super.findByKeword("Book", "description" , keyword);
		}
		  
		return books;
	}

}
