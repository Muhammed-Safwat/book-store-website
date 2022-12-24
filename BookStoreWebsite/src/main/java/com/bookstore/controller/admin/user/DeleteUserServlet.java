package com.bookstore.controller.admin.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.User;
import com.bookstore.service.UserServices;
 
@WebServlet("/admin/delete_user")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println(request.getParameter("id"));
			Integer id  = Integer.valueOf(request.getParameter("id"));
			UserServices userServices  = new UserServices();
			User  user = userServices.getById(id);
			if(id==1){
				request.setAttribute("massage","The default admin user account cannot be deleted");
			}else if(user!=null ) {
				userServices.delete(id);
				request.setAttribute("massage","User deleted");
			}else {
			
				request.setAttribute("massage","Could not find user with ID [user_id], or it might have been deleted by another admin");
			}
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin/list_user");
			requestDispatcher.forward(request, response);
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("id"));
	}

}
