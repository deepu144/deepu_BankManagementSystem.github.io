package com.bankmanagement.deepu.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.bankmanagement.deepu.dao.AdminSignInDao;

@WebServlet("/adminsignin")
public class AdminSignInServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		
		AdminSignInDao asd = new AdminSignInDao(name, password);
		HttpSession session = req.getSession();
		try {
			if(asd.isAdmin()) {
				session.setAttribute("adminName", name);
				res.sendRedirect("AdminMain.jsp");
			}
			else {
				session.setAttribute("error", "Error");
				res.sendRedirect("AdminLogIn.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
