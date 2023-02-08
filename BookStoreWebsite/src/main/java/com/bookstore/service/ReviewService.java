package com.bookstore.service;

import java.util.List;

import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Review;

public class ReviewService {
	private ReviewDAO reviewDAO; 
	
	public ReviewService(){
		reviewDAO = new ReviewDAO();
	}
	
	public List<Review> listReviews() {
		return reviewDAO.listAll();
	}
	
	public void createCustomer(Review review) {
		reviewDAO.create(review);
	}
	
	
	public Review getCustomerById(Integer id) {
		return reviewDAO.get(id);
	}
	
	/*
		public List<Review> findByEmail(String email) {	 
			return  customerDAO.findBy("Review", "email", email); 
		}
	*/
	
	public Review UpdateCustomer(Review review) {
		return reviewDAO.update(review);
	}
	
	public void delete(Integer id) {
		reviewDAO.delete(id);
	}
}
