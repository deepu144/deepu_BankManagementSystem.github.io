<%@page import="com.bankmanagement.deepu.dao.AccountdetailDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="TransactionHistory.css">
    <script src="TransactionHistory.js" defer></script>
</head>
<body>
    <header>
    	<% response.addHeader("Cache-control", "no-cache, no-store, must-revalidate"); %>
        <div class="Bank-icon-section">
            <div class="icon">
                <img src="/BankManagementSystem/images/finance-logo-and-symbols-vector-concept-removebg-preview.png" alt="FinanceLogo">
            </div>
            <div class="bank-name">
                <h3>Finance</h3>
            </div>
        </div>
        <div class="nav">
            <div class="nav-div">
                <p id="goHome">Home</p>
                <p id="goTransferMoney">Transfer Money</p>
                <p>Profile</p>
            </div>
            <div class="menu" id="menu">
                <span class="material-symbols-outlined">
                    menu
                </span>
            </div>
            <div class="dropdown hideDrop" id="dropdown">
                <div class="inner-drop">
                    <div id="goHome">Home</div>
                    <div id="goTransferMoney">Transfer Money</div>
                    <div>Profile</div>
                </div>
            </div>
        </div>
    </header>
    <div class="line">
        <hr>
    </div>
    <section class="History-block">
        <div class="inner-history-block">
            <h2>Transactions</h2>
            <form action="TransactionHistory.jsp">
            	<select name="filter" id="filter">
	                <option value="all" selected>All</option>
	                <option value="debit">Debit</option>
	                <option value="credit">Credit</option>
	                <option value="success">Successfull</option>
	                <option value="failed">Failed</option>
            	</select>
            </form>
        </div>
        <div class="search-block">
            <span class="material-symbols-outlined searchlogo">
                search
            </span>
            <input type="search" name="search" id="search" placeholder="Search">
        </div>
        <div class="alltransactions">
          		<% 
          			String name = (String)session.getAttribute("name");
              		AccountdetailDao ad = new AccountdetailDao(name);
          			if(name==null){
          				response.sendRedirect("WelcomePage.html");
          			}
	               	String url ="jdbc:mysql://localhost:3306/bankmanagement";
	       	        String userName = "root";
	       	        String passWord = "Password@123";
	       	        String query = "select * from alltransaction where username = ? order by transaction_date desc ;" ;
	       	        Class.forName("com.mysql.jdbc.Driver");
	       	        Connection con = DriverManager.getConnection(url,userName,passWord);
	       	     	PreparedStatement ps = con.prepareStatement(query);
	       	        ps.setString(1, ad.getUserName());
	       	        ResultSet rs = ps.executeQuery();
              	%>
              	<% while(rs.next()) { %>
           				<div class="recentTransaction">
	                       <div class="transactionLogo">
	                       	<% if(rs.getString(5).equalsIgnoreCase("debit")) { %>
	                            <span class="material-symbols-outlined boldSymbol">
	                                call_made
	                            </span>
	                         <% }else { %>
	                         	<span class="material-symbols-outlined">
	                              		call_received
	                          		</span>
	                         <% } %>
	                       </div>
	                       <div class="transaction-name">
	                           <p class="boldname"><%= rs.getString(4) %></p>
	                           <p><%= rs.getDate(2) %></p>
	                       </div>
	                       <div class="transferAmount">
	                           <p> <% if(rs.getString(5).equalsIgnoreCase("debit")){ %>   
	                           		<%= "- " %>
	                           		<% }else{ %>
	                           		<%= "+ " %>
	                           		<% } %>
	                           		<%= "₹." %>
	                           	<%=rs.getDouble(6)%>
	                         </p>
	                       </div>
                		</div>
               	<% } %>
        </div>
    </section>
</body>
</html>