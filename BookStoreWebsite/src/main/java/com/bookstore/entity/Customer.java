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
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="customer")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "customer_id")
	private Integer customerId;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "firstname")
	private String firstName;
	
	@Column(name = "lastName")
	private String lastName; 
	
	@Column(name = "address_line1")
	private String addressLine1;

	@Column(name = "address_line2")
	private String addressLine2;
	
	@Column(name = "city")
	private String city;
	
	@Column(name = "state")
	private String state;
	
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
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "customer" , cascade =  CascadeType.ALL)
	private Set<Review> reviews = new HashSet<Review>(0);

	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "customer" , cascade =  CascadeType.ALL)
	private Set<BookOrder> orders  = new HashSet<BookOrder>(0);
	
	
	public Customer() {
		super();
	}
	
	

	public Customer(String email, String firstName, String lastName, String addressLine1, String addressLine2,
			String city, String state, String country, String phone, String zipcode, String password,
			String registerDate, Set<Review> reviews) {
		super();
		this.email = email;
		this.firstName = firstName;
		this.lastName = lastName;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.city = city;
		this.state = state;
		this.country = country;
		this.phone = phone;
		this.zipcode = zipcode;
		this.password = password;
		this.registerDate = registerDate;
		this.reviews = reviews;
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

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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
	
	public String getFullName() {
		return this.getFirstName() + " " + this.getLastName();
	}
	
	

	public Set<BookOrder> getOrders() {
		return orders;
	}



	public void setOrders(Set<BookOrder> orders) {
		this.orders = orders;
	}



	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", email=" + email + ", fullName=" + firstName + ", lastName="
				+ lastName + ", addressLine1=" + addressLine1 + ", addressLine2=" + addressLine2 + ", city=" + city
				+ ", state=" + state + ", country=" + country + ", phone=" + phone + ", zipcode=" + zipcode
				+ ", password=" + password + ", registerDate=" + registerDate + "]";
	}
	
	 
	 

 
	 
	
	

}
