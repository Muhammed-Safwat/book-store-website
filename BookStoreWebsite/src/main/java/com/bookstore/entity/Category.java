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
@Table(name = "category")
public class Category{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "category_id")
	private Integer categoryId;
	
	@Column(name = "name")
	private String name;
	
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "category" , cascade = {CascadeType.DETACH , CascadeType.MERGE , CascadeType.REFRESH ,CascadeType.PERSIST})
	private Set<Book> books = new HashSet<Book>(0);
    
	public Category() {
		 
	}
	public Category(String name) {
		this.name = name;
	}

	public Category(String name, Set<Book> books) {
		this.name = name;
		this.books = books;
	}


	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Set<Book> getBooks() {
		return books;
	}

	public void setBooks(Set<Book> books) {
		this.books = books;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", name=" + name + "]";
	}



	
}