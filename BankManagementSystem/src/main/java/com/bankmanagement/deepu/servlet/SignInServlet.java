package com.bankmanagement.deepu.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.bankmanagement.deepu.dao.SignInDao;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/signingin")
public class SignInServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String remember = req.getParameter("rememberme");
		
		SignInDao sid = new SignInDao(name, password);
		
			try {
				if(sid.check()) {
					HttpSession session = req.getSession();
					session.setAttribute("Access", "Yes");
					session.setAttribute("name",name);
					session.setAttribute("password", password);
					res.sendRedirect("ClientWelcome.jsp");
				}
				else {
					req.setAttribute("error", "Incorrect Username or Password");
					RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
					rd.forward(req, res);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		
	}

}
