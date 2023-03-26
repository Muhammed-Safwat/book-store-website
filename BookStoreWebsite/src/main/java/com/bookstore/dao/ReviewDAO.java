
package com.bookstore.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

public class ReviewDAO extends JpaDAO<Review> implements GenericDAO<Review> {

	@Override
	public Review create(Review review) {
		return super.create(review);
	}

	@Override
	public Review update(Review r) {	 
		return super.update(r);
	}

	@Override
	public Review get(Integer id) { 
		return super.get(Review.class, id);
	}

	@Override
	public void delete(Integer id) {
		super.delete(Review.class, id);
	}

	@Override
	public List<Review> listAll() {
		 
		return  super.listAll("from Review");
	}
	public Category CategoryLazy(Integer id) {	 
		
	    Transaction tx = null;
      
		Category  category = session.get(Category.class, id);  
        Hibernate.initialize(category.getBooks());
        tx.commit();  
        session.close();
        return category;
	}
	
	public List<Review> findByBookId(String id) {
		    Session session = super.LazyLodding();
		    Transaction tx = null;
		    tx = session.beginTransaction();
		    List<Review> reviews = session.createQuery("select r from Review r where r.book = '"+id+"'")
		                                 .getResultList();
		    List<Customer> customers = new ArrayList<>();
		    for(Review review : reviews) {
		    	customers.add(review.getCustomer()); 
		    	review.getCustomer().toString();
		    }
		    Hibernate.initialize(customers);
		    Hibernate.initialize(reviews);		    
		    tx.commit();
            session.close();
         return reviews;
	}
	
	public List<Review> listReviewWithBook(int max){
		 Session session = super.LazyLodding();
		    Transaction tx = null;
		    tx = session.beginTransaction();
		     
		    List<Review> reviews  = session.createQuery("from Review order by reviewTime desc").setMaxResults(max).getResultList();
		    System.out.println("R"+reviews.size());	 
		    List<Book> books = new ArrayList<>();
		    for(Review review : reviews) {
		    	books.add(review.getBook()); 
		    	System.out.println(review.getBook().toString());	 
		    }
		    List<Customer> customers = new ArrayList<>();
		    for(Review review : reviews) {
		    	customers.add(review.getCustomer()); 
		    	review.getCustomer().toString();
		    }
		    Hibernate.initialize(customers);
		    Hibernate.initialize(books);
		    Hibernate.initialize(reviews);		    
		    tx.commit();
            session.close();
            this.factory.close();
      return reviews;
	}
	
	public List<Review> listReviewWithBook(){
		 Session session = super.LazyLodding();
		    Transaction tx = null;
		    tx = session.beginTransaction();
		     
		    List<Review> reviews  = session.createQuery("from Review order by reviewTime desc").getResultList();
		    System.out.println("R"+reviews.size());	 
		    List<Book> books = new ArrayList<>();
		    for(Review review : reviews) {
		    	books.add(review.getBook()); 
		    	System.out.println(review.getBook().toString());	 
		    }
		    List<Customer> customers = new ArrayList<>();
		    for(Review review : reviews) {
		    	customers.add(review.getCustomer()); 
		    	review.getCustomer().toString();
		    }
		    Hibernate.initialize(customers);
		    Hibernate.initialize(books);
		    Hibernate.initialize(reviews);		    
		    tx.commit();
           session.close();
     return reviews;
	}
	
	public Review getReviewLazy(Integer id) {	 
		Session session = super.LazyLodding();
	    Transaction tx = null;
        tx = session.beginTransaction();
		Review   review = session.get(Review.class, id);  
        Hibernate.initialize(review.getBook());
        Hibernate.initialize(review.getCustomer());
        tx.commit();  
        session.close();
        return review;
	}
	
	@Override
	public long count() {
		 
		return  super.count("select count(*) from Review");
	}
	
	public List<Review> listAll(int max){
		return super.listAll("from Review order by reviewTime desc", max);
	}

}
