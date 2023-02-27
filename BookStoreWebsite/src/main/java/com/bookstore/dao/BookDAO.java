package com.bookstore.dao;

import java.util.ArrayList;
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
	
	 
	public void delete(Book obj) { 
		super.deleteObject(Book.class, obj);
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
	
	public List<Book> bestSealing(int max) {
		List<Book> books = listAll("SELECT od.book FROM OrderDetail od  GROUP by od.book.bookId ORDER BY SUM(od.quantity) DESC ",max);
		return books;
	}

	public List<Book> mostFav(int max) {
		List<Book> books = new ArrayList<Book>(max); 
		
		 List<Object[]> objs =   listAllForMostFav("SELECT r.book , count(r.book.bookId) as ReviewCount , AVG(r.rating) as AvgRating FROM Review r group by"
				+ " r.book.bookId having AVG(r.rating) >=3.6 ORDER BY ReviewCount DESC , AvgRating DESC ",max);
		 if(!objs.isEmpty()) {
			 for(Object[] obj : objs) {
				  Book b = (Book) obj[0];
				  books.add(b);
			  } 
		 }

		  return books;
	}

	
	 

}
