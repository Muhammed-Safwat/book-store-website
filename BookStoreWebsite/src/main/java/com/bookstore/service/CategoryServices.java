package com.bookstore.service;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class CategoryServices {
	private CategoryDAO categoryDAO ;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public CategoryServices(HttpServletRequest request, HttpServletResponse response) {		
		this.categoryDAO = new CategoryDAO() ;
		this.request = request;
		this.response = response;
	}
	
	public void add() throws ServletException, IOException {
		// get and capitalize name
		String name = request.getParameter("name");
		name = Character.toUpperCase(name.charAt(0)) + name.substring(1);
		
		List<Category> list = findByName(name);
		
		if(list.size()>0) {
			request.setAttribute("message", name+" Category is allrady exsist");
			showFrom();
		}else {
			Category newCategory = new Category(name);
			categoryDAO.create(newCategory);
			request.setAttribute("message", name+" add sucssufly");
		}
		
		 categoryList();	
	}
	
	public void showFrom() throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("category_form.jsp");           
		 dispatcher.include(request, response); 
	}

	public void updateCategory() throws ServletException, IOException {
		String name = request.getParameter("name");
		Integer id =Integer.valueOf(request.getParameter("id"));
		Category newCategory = get(id);
		name = name.substring(0, 1).toUpperCase() + name.substring(1); 
		List<Category> list = findByName(name);
		if(list.size()>0 && list.get(0).getCategoryId() != id) {
			 request.setAttribute("message", name+" Category is allrady exsist");
			 request.setAttribute("categroy", newCategory);
			 // redirect page 
			 RequestDispatcher dispatcher = request.getRequestDispatcher("edit_category.jsp");           
			 dispatcher.forward(request, response); 
		}else {			 			 
			 newCategory.setName(name);
			 categoryDAO.update(newCategory);
			 request.setAttribute("message", newCategory.getName()+" updateted sucssufly");
			 categoryList();				 
		}
 
	}
	
	public void deleteCategory() throws ServletException, IOException {
		
		Integer id  = Integer.valueOf(request.getParameter("id"));
		 
		 Category categroy = categoryDAO.CategoryLazy(id);
		 if (categroy == null || !categroy.getBooks().isEmpty() ) {
			    request.setAttribute("message", "Cannot delete category with ID [" + id + "]");
			}else {
			    categoryDAO.delete(id);
			    request.setAttribute("message", "Category " + categroy.getName() + " deleted successfully");
			}
	    // redirect 
	    categoryList();
	}
	
	public Category get(Integer id ) {
		return categoryDAO.get(id);
	}
	
	public List<Category> findByName(String name) {
		return categoryDAO.findBy("Category" , "name" , name);
	}
	
	public void categoryList() throws ServletException, IOException{
		List<Category> categories  = categoryDAO.listAll();
		request.setAttribute("categories", categories);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("category_list.jsp");
		requestDispatcher.forward(request, response);
	}
	
	public void showEditForm() throws ServletException, IOException {
		Integer id =Integer.valueOf(request.getParameter("id")) ;
		 Category categroy  = get(id);
		 if(categroy == null) {
			  request.setAttribute("massage","Could not find category with ID ["+id+"]");
		 }else {
			 request.setAttribute("categroy", categroy);
		 }

		 RequestDispatcher requestDispatcher  =  request.getRequestDispatcher("edit_category.jsp"); 
		 requestDispatcher.forward(request, response);
	}

	public long count() {
		return categoryDAO.count();
	}
	
	public void GetBooksOfCategory() throws ServletException, IOException {
		String stringId  = request.getParameter("id");
		 Integer id = Integer.valueOf(stringId);
		 Category category = categoryDAO.CategoryLazy(id); 
		
		 if(category==null) {
			 request.setAttribute("message", "Sorry, the category ID ["+id+"] is not available");
			 HomePageService homePageService = new HomePageService(request, response);
			 homePageService.loadHomePage();
		 }else {
			 Set<Book> list =  category.getBooks();
			 System.out.println(list);
			 request.setAttribute("category", category);
			 request.setAttribute("books", list);
			 request.setAttribute("massage", "");
			 if(list.size()==0){
				 request.setAttribute("massage", "no Books");
			 } 
		 }
		 RequestDispatcher dispatcher = request.getRequestDispatcher("frontend/book_list_by_category.jsp");
		 dispatcher.forward(request, response);
	}
}
