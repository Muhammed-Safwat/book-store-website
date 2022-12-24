package com.bookstore.service;

import java.util.List;

import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

public class CategoryServices {
	private CategoryDAO categoryDAO ;
	
	public CategoryServices() {
		this.categoryDAO = new CategoryDAO() ;
	}
	
	public void add(Category category) {
		categoryDAO.create(category);
	}
	
	public void update(Category category) {
		categoryDAO.update(category);
	}
	
	public void delete(Integer id) {
		categoryDAO.delete(id);
	}
	
	public Category get(Integer id ) {
		return categoryDAO.get(id);
	}
	
	public List<Category> findByName(String name) {
		return categoryDAO.findBy("Category" , "name" , name);
	}
	
	public List<Category> list(){
		return categoryDAO.listAll();
	}
	
	public long count() {
		return categoryDAO.count();
	}
	
	
}
