package com.bookstore.controller.admin.category;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Category;
import com.bookstore.service.CategoryServices;

 
@WebServlet("/admin/create_category")
public class createCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryServices categoryServices = null ; 
	
 
	public createCategoryServlet() {
		 categoryServices = new CategoryServices();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// redirect page 
				 RequestDispatcher dispatcher = request.getRequestDispatcher("category_form.jsp");           
				 dispatcher.include(request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		name = name.substring(0, 1).toUpperCase() + name.substring(1); 
		List<Category> list = categoryServices.findByName(name);
		if(list.size()>0) {
			request.setAttribute("massage", name+" Category is allrady exsist");
			System.out.println("is exsist");
		}else {
			System.out.println(name);
			Category newCategory = new Category(name);
			categoryServices.add(newCategory);
			request.setAttribute("massage", name+" add sucssufly");
		}
		
		 // redirect page 
		 RequestDispatcher dispatcher = request.getRequestDispatcher("list_category");           
		 dispatcher.forward(request, response); 
		
		
	}

}
