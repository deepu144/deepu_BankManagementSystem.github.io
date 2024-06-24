package com.bankmanagement.deepu.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import com.bankmanagement.deepu.dao.RequestDao;

@WebServlet("/signingup")
public class SignUpServlets extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String name = req.getParameter("firstname");
		String userName = req.getParameter("Usnamee");
		String email = req.getParameter("email");
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = null ;
		try {
			 date = df.parse((String)req.getParameter("dob"));
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println(date);
		}
		
		Date dob = new Date(date.getTime());
		long number = Long.parseLong(req.getParameter("number"));
		long aadhar = Long.parseLong(req.getParameter("aadhar"));
		String gender = req.getParameter("gender");
		String address = req.getParameter("address");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		long zipCode = Long.parseLong(req.getParameter("pincode"));
		String accType = req.getParameter("acctype");
		String password1 = req.getParameter("password");
		String password2 = req.getParameter("password2");
		
		
		RequestDao rd = new RequestDao(userName, name, email, dob, number, aadhar, gender, address, city, state, zipCode, accType, password1, password2);
		
//		res.getWriter().println(userName + "  "+ name);
		String n = Long.toString(number);
		if( !password1.equals(password2) || (n.length()!= 10)) {
			RequestDispatcher rdd = req.getRequestDispatcher("SignUp.jsp");
			req.setAttribute("error", "error");
			rdd.forward(req, res);
		}
		try {
			if(rd.insertRequestToDb()) {
				res.sendRedirect("Login.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		res.getWriter().println(name + userName + email + dob + number + aadhar + "    "+gender+"    " + address + city + state +zipCode +"    "+accType+"    " +password1 + password2);
	}

}
