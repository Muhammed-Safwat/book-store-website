package com.bookstore.test;

import com.bookstore.dao.CategoryDAO;


public class testCategory {
	public static void main(String[] args) {
		 
		 CategoryDAO c = new CategoryDAO();
		 c.CategoryLazy(11);
		// add category 
		
		/*Category cat = new Category("story3");
		System.out.println(cat.toString());
		c.add(cat);
		 
		*/
		/*
		// get category 
		
		System.out.println(c.get(12).toString());
		*/
		
		 
		// delete category 
		
		// c.delete(11) ;
		 
		
		/*
		// update category
		Category category = c.get(15);
		category.setName("updateCategory15");
		c.update(category);
		*/
		
		/*
		//list categories
		
		for (Category  i : c.list() ) {
			System.out.println(i);
		}
		*/
		
		/*
		//count categories 
		System.out.println(c.count());
		*/
		
		//  find By name 
		 System.out.println(c.findByName("java").get(0));
	}
}
