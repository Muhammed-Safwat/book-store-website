package com.bookstore.test;

import java.util.Date;
import java.util.List;

import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;
import com.bookstore.service.BookService;
import com.bookstore.service.CustomerService;

public class TestReview {
	
	 public static void main(String[] args) {
		
		  Review r = new Review();
		  // BookService bs = new BookService();
		  ReviewDAO reviewDao = new ReviewDAO();
		  List<Review> list = reviewDao.findByBookId("35");
		  for(Review E : list)
			  System.out.println(E.toString());
	/*
		 r=  reviewDao.get(15);
		 System.out.println(r.getComment());
		 r.setComment("new comment");
		 reviewDao.update(r);
		 r=  reviewDao.get(15);
		 System.out.println(r.getComment());
		 //  Book b =  bs.get(35);
		  System.out.println();
		  
		 //  ReviewDAO reviewDao = new ReviewDAO();
		   
		/* 
		 *  Customer c = cs.getCustomerById(11);
		
		 
		  System.out.println(c);
	 
		  r.setBook(b);
		 
		  Customer c = cs.getCustomerById(11);
		  r.setCustomer(c);
		  System.out.println(c);
		  r.setRating(4);
		  r.setHeadline("test hedline");
		  r.setComment("test comment for reviw");
		  r.setReviewTime("2022-12-28");
		
		  reviewDao.create(r);*/
		  
		  /// Add review  */
	}
}
