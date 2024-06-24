package com.bankmanagement.deepu.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.bankmanagement.deepu.dao.RequestDao;

@WebServlet("/requestresult")
public class ClientRequestServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result = request.getParameter("requestResult");
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("requestedClient");
		session.setAttribute("requestedClient", null);
		
		try {
			RequestDao rd = new RequestDao(name);
			if(result.equals("accept")) {
				if(rd.addToClientTable()) {
					if(rd.addToAccounttable()) {
						rd.removeRequest();
						response.sendRedirect("ClientRequest.jsp");
					}
				}
			}
			else {
				if(rd.removeRequest()) {
					response.sendRedirect("ClientRequest.jsp");
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
