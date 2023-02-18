package com.bookstore.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="users")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_id")
	private Integer userId ; 
	
	@Column(name="email")
	private String email ; 
	
	@Column(name="full_name")
	private String fullName ; 
	
	@Column(name="password")
	private String  password ;
	
	  
	
	public User() {
		super();
	}

	public User( String fullName, String email, String password) {
		super();
		this.email = email;
		this.fullName = fullName;
		this.password = password;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		 this.email =  email;
	}
	
	public void password(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String  getFirstName() {
		String   builder = "" ;
		for(int i = 0 ; i<this.fullName.length() ; i++) {
			if(this.fullName.charAt(i)==' ')
				break; 
			
				builder+=this.fullName.charAt(i) ;
		}
		return builder.toUpperCase();
	}
	
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", email=" + email + ", fullName=" + fullName + ", password=" + password
				+ "]";
	} 
	
	 
}
