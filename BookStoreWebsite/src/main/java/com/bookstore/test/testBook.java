package com.bookstore.test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.service.BookService;
import com.bookstore.service.CategoryServices;

public class testBook {
	 public static void main(String[] args) {
		 BookDAO bookDAo = new BookDAO();
		 
		 
		 List<Book> books = bookDAo.findBookByKeyWord("spring");
		
		 for(Book b : books) {
			 System.out.println(b.toString());
		 }
		 
		 /*
		 Book newBook = new Book();
			CategoryDAO c = new CategoryDAO();
			Category category = c.get(11);
			 
			newBook.setCategory(category );
			
			newBook.setTitle("Effective Java (2nd Edition)");
			newBook.setAuthor("Joshua Bloch");
			newBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
			newBook.setPrice(38.87f);
			newBook.setIsbn("0321356683");
			
			DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");		
			Date publishDate=null;
			try {
				publishDate = dateFormat.parse("05/28/2008");
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			
	//		newBook.setPublishDate(publishDate);
			
			String imagePath = "F:\\BackEnd project\\Book Store Website\\imgs\\download.png";
			
			byte[] imageBytes=null;
			
			try {
				imageBytes = Files.readAllBytes(Paths.get(imagePath));
			} catch (IOException e) {	 
				e.printStackTrace();
			}
			
			 newBook.setImage(imageBytes);
			 
			 bookDAo.create(newBook);
			 
		 
		 
		 /*
		 // test get book 
		System.out.println(bookDAo.get(33).toString()); 
		
		*/ 
		 /*
		 // update
			 Book book = bookDAo.get(33);
			 book.setPrice(40.68);
			 bookDAo.update(book);
		 */
		 /*
			 // list all 
			 List<Book> list = bookDAo.listAll();
			 for(Book b : list ) {
				 System.out.println(b.toString());
			 }
		 */
		 
		/* // count 
		 
		 System.out.println(bookDAo.count()); 
		 */
		/* // find by title 
		 System.out.println(bookDAo.findByTitle("Effective Java (2nd Edition)").get(0).toString());
	    /*/
		 // delete 
		// s bookDAo.delete(33) ;
	}
	
	
	
	
}
