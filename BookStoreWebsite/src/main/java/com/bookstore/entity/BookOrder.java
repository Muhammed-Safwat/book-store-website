package com.bookstore.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

 
@Entity
@Table(name = "book_order")
public class BookOrder {

	@Id
	@Column(name="order_id")
	private Integer orderId;
	 
	
	private Customer customer;
	
	@Column(name="order_date")
	private String orderDate;
	
	@Column(name="shipping_address")
	private String address;
	
	@Column(name="recipient_name")
	private String name;
	
	 
	
	@Column(name="recipient_phone")
	private String phone;
	
	@Column(name="")
	private String city;
	
	@Column(name="")
	private String state;
	
	@Column(name="")
	private String zipcode;
	
	@Column(name="")
	private String country;
	
	@Column(name="")
	private String paymentMethod;
	
	@Column(name="")
	private float total;
	
	@Column(name="")
	private float subtotal;
	
	@Column(name="")
	private float shippingFee;
	
	@Column(name="")
	private float tax;
	
	@Column(name="status")
	private String status;
	
	@Column(name="")
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>(0);

	




	
}
