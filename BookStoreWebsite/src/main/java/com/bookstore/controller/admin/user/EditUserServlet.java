package com.bookstore.controller.admin.user;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.User;
import com.bookstore.service.UserServices;


@WebServlet("/admin/edit_user")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserServices userServices  = new UserServices();
	private int id ; 
    public EditUserServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		     	
		    this.id = Integer.valueOf(request.getParameter("id"));  
			 User user = userServices.getById(Integer.valueOf(request.getParameter("id")));
			// System.out.println(user.toString()); 
			 request.setAttribute("password",user.getPassword());
			 request.setAttribute("email",user.getEmail());
			 request.setAttribute("name",user.getFullName());
			 if(request.getAttribute("massage")==null) {
				  request.setAttribute("massage","");
			  }
			RequestDispatcher requestDispatcher  =  request.getRequestDispatcher("edit_user.jsp"); 
			requestDispatcher.forward(request, response);
			 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  name = request.getParameter("name");
		String  email = request.getParameter("email");
		String  password =  request.getParameter("password");
		//Integer id = Integer.valueOf(request.getParameter("id"));
		User user = userServices.getById(this.id);

		 List<User> us = userServices.findByEmail(email);
		 
		if(user!=null && us.size()> 0   &&  us.get(0).getUserId() != this.id ) {
			 request.setAttribute("massage" , "email "+email+" alrady exsist");
			 request.setAttribute("password",user.getPassword());
			 request.setAttribute("email",user.getEmail());
			 request.setAttribute("name",user.getFullName());
			 RequestDispatcher requestDispatcher  =  request.getRequestDispatcher("edit_user.jsp"); 
			 requestDispatcher.forward(request, response);
		}else {
				user.setEmail(email);
				user.setPassword(password);
				user.setFullName(name);
				userServices.UpdateUser(user);
				System.out.println(" updated sucssfully");
			 request.setAttribute("massage" , name+" updated sucssfully");
		}

		 // redirect page 
		  
				 RequestDispatcher dispatcher = request.getRequestDispatcher("list_user");           
				 dispatcher.forward(request, response); 
	}

		
		
	}

