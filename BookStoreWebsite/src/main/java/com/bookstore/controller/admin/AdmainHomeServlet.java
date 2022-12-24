package com.bookstore.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.User;
import com.bookstore.service.UserServices;

@WebServlet("/admin/homepage")
public class AdmainHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserServices  userServices = null ;
	
    public AdmainHomeServlet() {
        super();
        userServices = new  UserServices() ;
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		 dispatcher.forward(request, response);
		 System.out.println( request.getServletContext().getAttribute("admin"));
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
