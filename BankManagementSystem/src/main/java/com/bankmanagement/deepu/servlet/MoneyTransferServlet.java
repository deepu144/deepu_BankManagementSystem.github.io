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

import com.bankmanagement.deepu.dao.AccountdetailDao;

@WebServlet("/moneytransfer")
public class MoneyTransferServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String check = (String)session.getAttribute("Access");
		if(check.equalsIgnoreCase("yes")) {
			String name = req.getParameter("name");
			String description = req.getParameter("description");
			double amount = Double.parseDouble(req.getParameter("amount"));
			
			AccountdetailDao receiver ;
			AccountdetailDao sender ;
			try {
				receiver = new AccountdetailDao(name);
				sender = new AccountdetailDao((String)session.getAttribute("name"));
				if(receiver.isUserFound()) {
					if(sender.getBalance() >= amount) {
						if(receiver.doCredit(amount , sender)) {
							if(sender.doDebit(amount , description , receiver)) {
								RequestDispatcher rd = req.getRequestDispatcher("TransactionResult.jsp");
								req.setAttribute("isTransactionSuccess","yes" );
								rd.forward(req, res);
							}else {
								RequestDispatcher rd = req.getRequestDispatcher("TransactionResult.jsp");
								rd.forward(req, res);
							}
						}else {
							RequestDispatcher rd = req.getRequestDispatcher("TransactionResult.jsp");
							rd.forward(req, res);
						}
					}else {
						sender.doFailedUpdate(amount , description);
						RequestDispatcher rd = req.getRequestDispatcher("TransactionResult.jsp");
						req.setAttribute("isLowBalance", "yes");
						rd.forward(req, res);
					}
				}else {
					RequestDispatcher rd = req.getRequestDispatcher("TransferMoney.jsp");
					req.setAttribute("isUserFound", "no");
					rd.forward(req, res);
				}
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		else {
			res.sendRedirect("WelcomePage.html");
		}
	}

}
