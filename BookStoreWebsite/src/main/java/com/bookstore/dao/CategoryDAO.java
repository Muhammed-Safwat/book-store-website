package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.Category;

public class CategoryDAO extends JpaDAO<Category> implements GenericDAO<Category> {

	@Override
	public Category create(Category category) {	 
		return super.create(category);
	}

	@Override
	public Category update(Category category) {	 
		return super.update(category);
	}

	@Override
	public Category get(Integer id) { 
		return super.get(Category.class, id);
	}

	@Override
	public void delete(Integer id) {
		 super.delete(Category.class, id);
	}

	@Override
	public List<Category> listAll() {
		return super.listAll("from Category");
	}

	@Override
	public long count() {	 
		return super.count("select count(*) from Category");
	}
	
	public List<Category> findByName(String name) {
		List<Category>  list = super.findBy("Category", "name", name);
		return list ; 
	}
	


}
