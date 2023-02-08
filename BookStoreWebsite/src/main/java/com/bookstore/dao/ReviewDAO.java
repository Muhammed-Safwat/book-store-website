package com.bookstore.dao;

import java.util.List;

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

	@Override
	public long count() {
		 
		return  super.count("select count(*) from Review");
	}

}
