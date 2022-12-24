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

 
@WebServlet("/admin/edit_category")
public class EditCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryServices categoryServices = null ; 
	Integer id  ;
    public EditCategoryServlet() {
    	categoryServices  = new CategoryServices();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 id =Integer.valueOf(request.getParameter("id")) ;
		 Category categroy  = categoryServices.get(id);
		 if(categroy==null) {
			  request.setAttribute("massage","Could not find category with ID ["+id+"]");
		 }else {
			 request.setAttribute("name", categroy.getName());
			 if(request.getAttribute("massage")==null) {
				  request.setAttribute("massage","");
			  }
		 }

		 RequestDispatcher requestDispatcher  =  request.getRequestDispatcher("edit_category.jsp"); 
		 requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		name = name.substring(0, 1).toUpperCase() + name.substring(1); 
		List<Category> list = categoryServices.findByName(name);
		if(list.size()>0) {
			 request.setAttribute("massage", name+" Category is allrady exsist");
			 System.out.println("is exsist");
			 request.setAttribute("name","");
			 // redirect page 
			 RequestDispatcher dispatcher = request.getRequestDispatcher("edit_category.jsp");           
			 dispatcher.forward(request, response); 
		}else {
			 System.out.println(name);
			 Category newCategory = categoryServices.get(id);
			 newCategory.setName(name);
			 categoryServices.update(newCategory);
			 request.setAttribute("massage", name+" edit sucssufly");
			
			 // redirect page 
			 RequestDispatcher dispatcher = request.getRequestDispatcher("list_category");           
			 dispatcher.forward(request, response); 
		}
		
		 
	}

}
