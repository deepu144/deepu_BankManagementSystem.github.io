package com.bankmanagement.deepu.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/adminlogout")
public class AdminLogoutServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("clientName", null);
		session.setAttribute("requestedClient", null);
		session.setAttribute("update", null);
		session.setAttribute("changes", null);
		session.setAttribute("error", null);
		session.setAttribute("requestedClient", null);
		session.invalidate();
		response.sendRedirect("AdminLogIn.jsp");
	}

}
