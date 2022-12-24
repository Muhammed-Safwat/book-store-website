package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.Review;

public class ReviewDAO extends JpaDAO<Review> implements GenericDAO<Review> {

	@Override
	public Review create(Review review) {
		return super.create(review);
	}

	@Override
	public Review update(Review t) {	 
		return null;
	}

	@Override
	public Review get(Integer id) { 
		return null;
	}

	@Override
	public void delete(Integer id) {
		
	}

	@Override
	public List<Review> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

}
