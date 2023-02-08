package com.bookstore.entity;

 
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "customer")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "customer_id")
	private Integer customerId;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "fullname")
	private String fullName;
	
	 
	@Column(name = "address")
	private String address;

	@Column(name = "city")
	private String city;
	
	@Column(name = "country")
	private String country;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "zipcode")
	private String zipcode;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "register_date")
	private String registerDate;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "customer")
	private Set<Review> reviews = new HashSet<Review>(0);

	
   // private Set<BookOrder> bookOrders = new HashSet<BookOrder>(0);

	public Customer() {
		super();
	}
	
	public Customer(String email, String fullName, String address, String city,  
			String country, String phone, String zipcode, String password, String registerDate) {
		super();
		this.email = email;
		this.fullName=fullName;
		this.address = address;
		this.city = city; 
		this.country = country;
		this.phone = phone;
		this.zipcode = zipcode;
		this.password = password;
		this.registerDate = registerDate;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

 

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public Set<Review> getReviews() {
		return reviews;
	}

	public void setReviews(Set<Review> reviews) {
		this.reviews = reviews;
	}

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", email=" + email + ", fullName=" + fullName + ", address="
				+ address + ", city=" + city + ", country=" + country + ", phone=" + phone + ", zipcode=" + zipcode
				+ ", password=" + password + ", registerDate=" + registerDate + ", reviews=" + reviews + "]";
	}

 
	 
	
	

}
