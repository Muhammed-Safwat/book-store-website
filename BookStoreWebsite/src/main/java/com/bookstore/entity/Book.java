package com.bookstore.entity;

import java.beans.Transient;
import java.util.Base64;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

 
@Entity 
@Table(name="book")
public class Book{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="book_id")
	private Integer bookId;
	
	@Column(name="title")
	private String title;
	
	@Column(name="author")
	private String author;
	
	@Column(name="description")
	private String description;
	
	@Column(name="isbn")
	private String isbn;
	
	@Column(name="image")
	private byte[] image;

	
	@Column(name="price")
	private double price;
	
	@Column(name="publish_date")
	private String publishDate;
	
	@Column(name="last_update_time")
	private String lastUpdateTime;
	
	@ManyToOne(fetch = FetchType.EAGER , cascade = {CascadeType.DETACH , CascadeType.MERGE , CascadeType.REFRESH ,CascadeType.PERSIST})
	@JoinColumn(name="category_id")
	private Category category;
	
	@OneToMany(fetch = FetchType.EAGER , mappedBy = "book")
	private Set<Review> reviews = new HashSet<Review>(0);
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "book")
	private Set<OrderDetail> BookOrders = new HashSet<OrderDetail>(0);
 	
	 
	public Book() {
		
	}
	
	public Book(String title, String author, String description, String isbn, byte[] image ,
			double price, String publishDate, String lastUpdateTime) {
		this.title = title;
		this.author = author;
		this.description = description;
		this.isbn = isbn;
		this.image = image;
		this.price = price;
		this.publishDate = publishDate;
		this.lastUpdateTime = lastUpdateTime;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

 

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(String lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public Set<Review> getReviews() {
		return reviews;
	}

	public void setReviews(Set<Review> reviews) {
		this.reviews = reviews;
	}
	
	public String getBase64Image() {
		return Base64.getEncoder().encodeToString(this.image);
	}
	
	@Transient
	public double getAverageRating() {
		
		double sum = 0 ;
		if(reviews.isEmpty()) {
			return 0 ; 
		}
		
		for(Review review : reviews) {
			sum+=review.getRating();
		}
		
		double averageRate = sum / reviews.size();
	  
		return  averageRate ;  
	}
	@Transient
	public int getNumberOfReviews() {
		return reviews.size();
	}

	public Set<OrderDetail> getBookOrders() {
		return BookOrders;
	}

	public void setBookOrders(Set<OrderDetail> bookOrders) {
		BookOrders = bookOrders;
	}

	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", title=" + title + ", author=" + author + ", description=" + description
				+ ", isbn=" + isbn + ", price=" + price + ", publishDate=" + publishDate + ", lastUpdateTime="
				+ lastUpdateTime + "]";
	}
	

}
