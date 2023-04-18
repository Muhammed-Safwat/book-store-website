package com.bookstore.controller.frontend.shopingcart;

import java.io.IOException;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.bookstore.dao.BookDAO;
import com.bookstore.service.BookService;
import com.bookstore.service.ShoppingCartService;


@WebServlet("/view_cart")
public class ViewCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShoppingCartService cartService = new ShoppingCartService(request, response);
		cartService.showViewCart();
	}
	
/*	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // Retrieve the array of objects from the request parameters
		  String jsonString = request.getReader().lines().collect(Collectors.joining());
		  System.out.println(request.getReader().lines());
		  JSONArray jsonArray = new JSONArray(jsonString);
		  ShopingCart cart  =	(ShopingCart) request.getSession().getAttribute("cart");
		  cart.clear();
		  BookDAO dao = new BookDAO();
		  // Process the array of objects as needed
		  // Example: iterate through the array and retrieve object properties
		  for (int i = 0; i < jsonArray.length(); i++) {
		    JSONObject jsonObject = jsonArray.getJSONObject(i);
		    System.out.println(jsonObject);
		    int id = jsonObject.getInt("id");
		    int quantity = jsonObject.getInt("quantity");
		    cart.addItem(dao.get(id), quantity);
		    System.out.println(quantity);
		    // Process the retrieved properties as needed
		  }
		 response.setStatus(HttpServletResponse.SC_OK);
		 request.setAttribute("cart", cart);
		 request.getRequestDispatcher("frontend/shoping_cart.jsp").include(request, response);
	}*/

}
