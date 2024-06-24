package com.bankmanagement.deepu.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import com.bankmanagement.deepu.dao.AccountdetailDao;
import com.bankmanagement.deepu.dao.ClientDetailDao;

@WebServlet("/savechanges")
public class AdminChangesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			String userName = (String)session.getAttribute("update");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			Date dob = Date.valueOf(request.getParameter("dob"));
			String gender = request.getParameter("gender");
			long mobile = Long.parseLong(request.getParameter("mobile"));
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			int zipCode = Integer.parseInt(request.getParameter("zipcode"));
			String address = request.getParameter("address");
			String accType = request.getParameter("accType");
			String status = request.getParameter("accStatus");
			ClientDetailDao cdd = new ClientDetailDao();
			
			ClientDetailDao cd = new ClientDetailDao(userName, name, email, dob, mobile, gender, address, city, state, zipCode, accType);
			AccountdetailDao ad = new AccountdetailDao(userName);
			
			if(cd.doUpdate()) {
				if(ad.doUpdate(status, accType)) {
//					HttpSession session = request.getSession();
					session.setAttribute("changes", "saved");
					response.sendRedirect("AllClients.jsp");
				}
			}
			else {
				response.getWriter().println(userName + " " + name +" " + email+" "+ dob +" "+ mobile +" "+ gender +" "+address +"  " + city +" "+ state +" "+ zipCode +" "+ accType);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
