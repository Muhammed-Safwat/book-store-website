package com.bookstore.controller.frontend.shopingcart;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.bookstore.entity.Book;
import com.bookstore.service.BookService;

@WebServlet("/add_to_cart")
public class AddedToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddedToCartServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String id= (String) request.getAttribute("id");
		System.out.println("add to cart work succssufly");
		System.out.println("id ==> "+id); 
		/*InputStream requestBodyInput = request.getInputStream();
		System.out.println(requestBodyInput.toString());*/
		/*System.out.println(request.getContentLength());
		 StringBuffer jb = new StringBuffer();
		  String line = null;
		  try {
		    BufferedReader reader = request.getReader();
		    while ((line = reader.readLine()) != null)
		      jb.append(line);
		  } catch (Exception e) { } 

		  System.out.println("============jsoong"+ jb.toString()); 
		 
		 JSONObject jsonObject = new JSONObject();
	      //Inserting key-value pairs into the json object
	      jsonObject.put("ID", id );
	       
	      
		PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(jsonObject);
        out.flush();  */
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("add to cart work succssufly");
		
		Integer id = Integer.valueOf(request.getParameter("id"));
		Integer quantity = Integer.valueOf(request.getParameter("quantity"));
		 BookService bookService = new  BookService();
		 Book book  = bookService.get(id);
		 System.out.println(book+"===============");
		 request.setAttribute("book", book);
		 request.setAttribute("total", book.getPrice()*quantity);
		 if(request.getSession()!=null) {
			ShopingCart cart = (ShopingCart)  request.getSession().getAttribute("cart");
			cart.addItem(book, quantity);
			cart.showShoppingCart();
		 }
		 
		 System.out.println(quantity);
		 System.out.println(book.toString());
		 
		 request.getRequestDispatcher("frontend/added_to_cart.jsp").include(request, response);
	}
       
 
}
