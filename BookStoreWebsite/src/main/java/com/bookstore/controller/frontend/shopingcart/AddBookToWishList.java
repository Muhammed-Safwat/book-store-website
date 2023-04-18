package com.bookstore.controller.frontend.shopingcart;

import java.io.IOException;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/add_wishlist_book")
public class AddBookToWishList extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
 
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("Run");
			String jsonString = request.getReader().lines().collect(Collectors.joining());
		    
		    // Parse the JSON object using JSONObject
		    JSONObject jsonObject = new JSONObject(jsonString);
		    int id = jsonObject.getInt("id");
		    // Retrieve values from the parsed JSON object
		   WishList  wishlist = (WishList) request.getSession().getAttribute("wishlist");
		   	  
		    wishlist.save(id);
		    request.getSession(true).setAttribute("wishlist", wishlist);
		    response.setStatus(HttpServletResponse.SC_OK);
	}
		
	
}
