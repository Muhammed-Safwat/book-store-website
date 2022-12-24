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

@WebServlet("/admin/list_user")
public class ListUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ListUserServlet() {
        super();
         
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // send Users list 
		 UserServices userServices  = new UserServices();
		  List<User> users =  userServices.listUser();
		//  System.out.println(request.getAttribute("massage"));
		  if(request.getAttribute("massage")==null) {
			  request.setAttribute("massage","");
		  }
		 request.setAttribute("users", users);
		 System.out.println("====>"+request.getServletContext().getAttribute("admin"));
		 // redirect page 
		 RequestDispatcher dispatcher = request.getRequestDispatcher("user_list.jsp");           
		 dispatcher.forward(request, response); 
		
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	 
		doGet(request, response);
	}

}
