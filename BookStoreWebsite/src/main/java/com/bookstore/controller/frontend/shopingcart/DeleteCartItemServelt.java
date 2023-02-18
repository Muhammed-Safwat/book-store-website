package com.bookstore.controller.frontend.shopingcart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete-item")
public class DeleteCartItemServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteCartItemServelt() {
        super();
         
    }
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.valueOf(request.getParameter("id"));
		ShopingCart cart = (ShopingCart) request.getSession().getAttribute("cart");
		System.out.println(cart.findBookInCart(id)); 
		cart.removeItem(id);
		request.getSession().setAttribute("cart",cart);
		response.sendRedirect(request.getContextPath()+"/view_cart");
	}

}
