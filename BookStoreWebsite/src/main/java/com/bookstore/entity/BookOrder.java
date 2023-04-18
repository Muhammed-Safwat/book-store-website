package com.bookstore.entity;

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
@Table(name = "book_order")
public class BookOrder  {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id")
	private Integer orderId;
	 
	@ManyToOne(fetch = FetchType.EAGER, cascade = {
			CascadeType.DETACH,CascadeType.MERGE,
			CascadeType.REFRESH ,CascadeType.PERSIST
	})
	@JoinColumn(name="customer_id")
	private Customer customer;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "bookOrder"
			, cascade = CascadeType.ALL, orphanRemoval = true)
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>(0);
	 
	@Column(name="order_date")
	private String orderDate;
	
	@Column(name="total")
	private double total;
	
	@Column(name="status")
	private String status;
	
	@Column(name="r_address_line1")
	private String addressLine1;
	
	@Column(name="r_address_line2")
	private String addressLine2;
	
	@Column(name="payment_method")
	private String paymentMethod;
	
	@Column(name="r_firstname")
	private String firstName;
	
	@Column(name="r_lastname")
	private String lastName;
	
	@Column(name="r_phone")
	private String phone;

	@Column(name="r_country")
	private String country ;

	@Column(name="r_state")
	private String state ;
	
	@Column(name="r_city")
	private String city ;
	
	@Column(name="r_zipcode")
	private String zipcode ;
	
	@Column(name="shipping_fee")
	private Double shippingFee ;
	
	@Column(name="tax")
	private Double tax  ;
	
	@Column(name="subtotal")
	private Double subtotal ;
 
	
	public BookOrder() {
		super();
	}
	

	public BookOrder(Customer customer, String orderDate, double total, String status,
			String addressLine1, String addressLine2, String paymentMethod, String firstName, String lastName,
			String phone, String country, String state, String city, String zipcode, Double shippingFee, Double tax,
			Double subtotal) {
		super();
		this.customer = customer;
		this.orderDate = orderDate;
		this.total = total;
		this.status = status;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.paymentMethod = paymentMethod;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.country = country;
		this.state = state;
		this.city = city;
		this.zipcode = zipcode;
		this.shippingFee = shippingFee;
		this.tax = tax;
		this.subtotal = subtotal;
	}


	public BookOrder(Integer orderId, Customer customer, Set<OrderDetail> orderDetails, String orderDate, double total,
			String status, String addressLine1, String addressLine2, String paymentMethod, String firstName,
			String lastName, String phone, String country, String state, String city, String zipcode,
			Double shippingFee, Double tax, Double subtotal) {
		super();
		this.orderId = orderId;
		this.customer = customer;
		this.orderDetails = orderDetails;
		this.orderDate = orderDate;
		this.total = total;
		this.status = status;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.paymentMethod = paymentMethod;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.country = country;
		this.state = state;
		this.city = city;
		this.zipcode = zipcode;
		this.shippingFee = shippingFee;
		this.tax = tax;
		this.subtotal = subtotal;
	}

	public Integer getOrderId() {
		return orderId;
	}


	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}


	public Customer getCustomer() {
		return customer;
	}


	public void setCustomer(Customer customer) {
		this.customer = customer;
	}


	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}


	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}


	public String getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}


	public double getTotal() {
		return total;
	}


	public void setTotal(double total) {
		this.total = total;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getAddressLine1() {
		return addressLine1;
	}


	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}


	public String getAddressLine2() {
		return addressLine2;
	}


	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}


	public String getPaymentMethod() {
		return paymentMethod;
	}


	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}


	public Double getShippingFee() {
		return shippingFee;
	}


	public void setShippingFee(Double shippingFee) {
		this.shippingFee = shippingFee;
	}


	public Double getTax() {
		return tax;
	}


	public void setTax(Double tax) {
		this.tax = tax;
	}


	public Double getSubtotal() {
		return subtotal;
	}


	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}


	public void setTotal() {
		double total = 0 ;
		if(!this.orderDetails.isEmpty()) {
			for(OrderDetail order : this.orderDetails) {
				total += order.getQuantity() * order.getBook().getPrice();
			}
			    this.subtotal=total;
			    this.shippingFee = this.subtotal * 0.1; 
			    this.tax = this.getNumberOfCopies() * 1.0;
				total += this.subtotal + this.tax + this.shippingFee;
		}
		
		this.total=total;
	}
	
	
	public int getNumberOfCopies() {
		int total = 0 ;
		
		for(OrderDetail order : this.getOrderDetails()) {
			total += order.getQuantity();
		}
		return total;
	}


	@Override
	public String toString() {
		return "BookOrder [orderId=" + orderId + ", orderDate=" + orderDate + ", total=" + total + ", status=" + status
				+ ", addressLine1=" + addressLine1 + ", addressLine2=" + addressLine2 + ", paymentMethod="
				+ paymentMethod + ", firstName=" + firstName + ", lastName=" + lastName + ", phone=" + phone
				+ ", country=" + country + ", state=" + state + ", city=" + city + ", zipcode=" + zipcode
				+ ", shippingFee=" + shippingFee + ", tax=" + tax + ", subtotal=" + subtotal + "]";
	}
	
	
	
	
	
}
