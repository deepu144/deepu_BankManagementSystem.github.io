<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection" %>
<%@page import="com.bankmanagement.deepu.dao.AccountdetailDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WelcomePage</title>
    <link rel="stylesheet" href="ClientWelcome.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="ClientWelcome.js" defer></script>
</head>
<body>
	<% response.addHeader("Cache-control", "no-cache, no-store, must-revalidate"); %>
    <div class="sidebar" id="sideBar">
        <div class="bank-name">
            <h2>MyBank</h2>
        </div>
        <div class="sidecontent">
            <ol>
                <li id="home">Home</li>
                <li id="account">Account</li>
                <li id="transfermoney">Transfer Money</li>
                <li id="history">Transaction History</li>
                <li id="help">Help</li>
                <li id="logout">Log Out</li>
            </ol>
        </div>
    </div>
    <div class="outer-logout hide-logout" id="logoutBlock">
        <div class="logout-block " >
            <div class="logout-question">
                <p>Are you sure , </p>
                <p>you want to logout ?</p>
            </div>
            <div class="logout-button">
                <button id="cancel">Cancel</button>
                <form action="logout">
                    <button id="logoutButton">Logout</button>
                </form>
            </div>
        </div>
    </div>
    <div class="main-block" id="mainBlock">
        <div class="content-block">
            <div class="intro-block">
            <% String name = (String)session.getAttribute("name"); %>
            <% if(name == null){
            	response.sendRedirect("WelcomePage.html");
            }
            %>
            <% AccountdetailDao ad = new AccountdetailDao(name); %>
                <h1>Welcome back, <% out.println(ad.getUserName()); %> !</h1>
                <p>View your profile</p>
            </div>
            <div class="amount-block">
                <div class="balance box">
                    <p><%= ad.getBalance() %></p>
                    <p>Total Balance</p>
                </div>
                <div class="saving box">
                    <p><%= ad.getBalance() %></p>
                    <p>Saving</p>
                </div>
                <div class="loans box">
                    <p>₹30000</p>
                    <p>Loans</p>
                </div>
            </div>
            <div class="account-information-block">
                <div class="acc-info">
                    <div class="inner-acc-info">
                        <p class="spl-clr">Current Account</p>
                        <p class="bold"><%= ad.getUserName() %>'s Account Number</p>
	                    <% String acNo = Long.toString((ad.getAccNo())); %>
	                    <% if(acNo!=null && acNo.length()>1) { %>
	                        <p class="spl-clr">●<%=acNo.substring(0, 4) %> ● <%= acNo.substring(4, 8) %> ● <%= acNo.substring(8, 12) %> ● <%= acNo.substring(12, 16) %></p>
	                    <% } %>
	                    
                    </div>
                    <div class="manage">
                        <p>manage</p>
                    </div>
                </div>
                <div class="card">
                    <img src="/BankManagementSystem/images/pixlr-image-generator-dfee4725-36d8-4598-98d8-3ff560248870-removebg-preview.png" alt="BankCard">
                </div>
            </div>
            <div class="recent-transaction-block">
                <div class="recent-header">
                    <p class="recent-head">Recent Transactions</p>
                </div>
                <div class="recent-body">
                
                	<% 
                		int i = 0 , j = 0 ;
	                	String url ="jdbc:mysql://localhost:3306/bankmanagement";
	        	        String userName = "root";
	        	        String passWord = "Password@123";
	        	        String query = "select * from alltransaction where username = ? order by transaction_date desc;" ;
	        	    	
	        	        Class.forName("com.mysql.jdbc.Driver");
	        	        Connection con = DriverManager.getConnection(url,userName,passWord);
	        	        PreparedStatement ps = con.prepareStatement(query);
	        	        ps.setString(1, ad.getUserName());
	        	        ResultSet rs = ps.executeQuery();
                	%>
                	<% while(rs.next()) { %>
                			<% if(i<3) { %>
                				<% i++; %>
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
			                        	
			                            <% if(rs.getString(7).equalsIgnoreCase("Failed")) {%>
			                            	<p class="fail"> <%= "Failed !" %></p>
			                            	<p><%= rs.getDouble(6) %></p>
			                            <% }else{ %>	    
				                            <p>
				                             	<% if(rs.getString(5).equalsIgnoreCase("debit")){ %>   
				                            		<%= "- " %>
				                            		<% }else{ %>
				                            		<%= "+ " %>
				                            		<% } %>
				                            		<%= "₹." %>
				                            	<%=rs.getDouble(6)%>
				                          	</p>
			                          	<% } %>
			                        </div>
	                    		</div>
	                    	<% }else{ %>
	                    		<% if(j==0){ %>
	                    			<div class="viewall">
                        				<a  href="TransactionHistory.jsp" id="viewAll">View All</a>
                    				</div>
                    			<% } %>
                    			<% j = 1; %>
                    		<% } %>
	                <% } %>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>