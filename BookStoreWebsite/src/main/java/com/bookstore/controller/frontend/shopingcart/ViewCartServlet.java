package com.bookstore.controller.frontend.shopingcart;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/view_cart")
public class ViewCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ViewCartServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopingCart cart  =	(ShopingCart) request.getSession().getAttribute("cart");
		request.setAttribute("cart", cart);
		request.getRequestDispatcher("frontend/shopingCart.jsp").include(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		/* System.out.println(request.getContentLength());
		    StringBuilder sb = new StringBuilder();
		    BufferedReader reader = request.getReader();
		    String line;
		    while ((line = reader.readLine()) != null) {
		      sb.append(line);
		    }
		    String requestBody = sb.toString();
		  System.out.println("DDDDDDDD" + requestBody);*/
	}

}
