package com.bookstore.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;

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
	
	public List<Review> findByBookId(String id) {
		return super.findBy("Review", "book", id); 
	}
	
	@Override
	public long count() {
		 
		return  super.count("select count(*) from Review");
	}
	
	public List<Review> listAll(int max){
		return super.listAll("from Review order by reviewTime desc", max);
	}

}
