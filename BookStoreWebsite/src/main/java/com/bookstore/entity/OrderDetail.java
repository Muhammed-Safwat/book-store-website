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
@Table(name = "order_detail")
public class OrderDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="order_detail_id")
	private int id ; 
	
	@ManyToOne(fetch = FetchType.LAZY 
			,cascade = {CascadeType.DETACH , CascadeType.MERGE , CascadeType.REFRESH ,CascadeType.PERSIST})
	@JoinColumn(name = "book_id")
	private Book book;
	
	@ManyToOne(fetch = FetchType.LAZY ,cascade = {CascadeType.DETACH , CascadeType.MERGE , CascadeType.REFRESH ,CascadeType.PERSIST})
	@JoinColumn(name="order_id")
	private BookOrder bookOrder;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name="subtotal")
	private double subtotal;

	public OrderDetail(){
		
	}

	public OrderDetail(int id,BookOrder bookOrder,  Book book, int quantity, double subtotal) {
		super();
		this.id = id;
		this.book = book;
		this.quantity = quantity;
		this.subtotal = subtotal;
		this.bookOrder = bookOrder;
		
	}
	
	public OrderDetail(BookOrder bookOrder,Book book, int quantity, double subtotal) {
		this.book = book;
		this.quantity = quantity;
		this.subtotal = subtotal;
		this.bookOrder = bookOrder;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	


	public BookOrder getBookOrder() {
		return bookOrder;
	}

	public void setBookOrder(BookOrder bookOrder) {
		this.bookOrder = bookOrder;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	
	public void setSubtotal() {
		this.subtotal=(this.book.getPrice())*(this.quantity);
	}

	@Override
	public String toString() {
		return "BookOrder [id=" + id + ", book=" + book + ", quantity=" + quantity + ", subtotal=" + subtotal + "]";
	}
	
 

}
