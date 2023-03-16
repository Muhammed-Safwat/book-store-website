package com.bookstore.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name = "review")
public class Review {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "review_id")
	private Integer reviewId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="book_id")
	private Book book;
	
	@ManyToOne(fetch = FetchType.LAZY,cascade = {
			CascadeType.DETACH,CascadeType.MERGE,
			CascadeType.REFRESH ,CascadeType.PERSIST
	})
	@JoinColumn(name="customer_id")
	private Customer customer;
	
	@Column(name = "rating")
	private int rating;
	
	@Column(name = "headline")
	private String headline;
	
	@Column(name = "comment")
	private String comment;
	
	@Column(name = "review_time")
	private String reviewTime;

	public Review() {
	}
	
	public Review(Book book, Customer customer, int rating, String headline, String comment, String reviewTime) {
		super();
		this.book = book;
		this.customer = customer;
		this.rating = rating;
		this.headline = headline;
		this.comment = comment;
		this.reviewTime = reviewTime;
	}

	public Review(int rating, String headline, String comment, String reviewTime) {
		super();
		this.rating = rating;
		this.headline = headline;
		this.comment = comment;
		this.reviewTime = reviewTime;
	}

	public Integer getReviewId() {
		return reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getHeadline() {
		return headline;
	}

	public void setHeadline(String headline) {
		this.headline = headline;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String  getReviewTime() {
		return reviewTime;
	}

	public void setReviewTime(String reviewTime) {
		this.reviewTime = reviewTime;
	}

	@Override
	public String toString() {
		return "Review [reviewId=" + reviewId + ", rating=" + rating
				+ ", headline=" + headline + ", comment=" + comment + ", reviewTime=" + reviewTime + "]";
	}

	 

	
	

 
 	
}
