package com.bookstore.controller.admin.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.User;
import com.bookstore.service.UserServices;

@WebServlet("/admin/create-user")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("user_form.jsp");           
		 dispatcher.include(request, response); 
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  name = request.getParameter("name");
		String  email = request.getParameter("email");
		String  password =  request.getParameter("password");
		/*
		 *  System.out.println(name);
			System.out.println(email);
			System.out.println(password);
		*/
		 UserServices userServices = new UserServices();
		 
		if(userServices.findByEmail(email).size() > 0 ) {  
			 request.setAttribute("massage" , "email alrady exsist");

			 RequestDispatcher requestDispatcher  =  request.getRequestDispatcher("edit_user.jsp"); 
			 requestDispatcher.forward(request, response);
			// redirect page 
			 RequestDispatcher dispatcher = request.getRequestDispatcher("massage.jsp");           
			 dispatcher.forward(request, response); 
		}else {
			 userServices.createUser(name, email , password);
			 request.setAttribute("massage" , name+"created sucssfully");
		}

		 // redirect page 
		 // redirect page 
				 RequestDispatcher dispatcher = request.getRequestDispatcher("list_user");           
				 dispatcher.forward(request, response); 
	}

}
