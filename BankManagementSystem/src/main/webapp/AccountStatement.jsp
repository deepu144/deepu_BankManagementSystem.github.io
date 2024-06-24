<%@page import="java.util.ArrayList"%>
<%@page import="com.bankmanagement.deepu.dao.TransactionDetailDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Statement</title>
    <link rel="stylesheet" href="AccountStatement.css">
    <script src="AccountStatement.js" defer></script>
</head>
<body>
	<% response.addHeader("Cache-control", "no-cache, no-store, must-revalidate"); %>
	<% String name1 = (String)session.getAttribute("adminName"); %>
	<% if(name1 == null) {
			response.sendRedirect("AdminLogIn.jsp");
		}
	%>
    <div class="image-block" id="img">
        <img src="/BankManagementSystem/images/Default_create_a_image_of_2048_x_1152_following_instructions_1.jpg" alt="">
    </div>
    <div class="sidebar" id="sideBar">
        <div class="bank-name">
            <h2>MyBank</h2>
        </div>
        <div class="sidecontent">
            <ol>
            	<li id="home">Home</li>
                <li id="clientDetails">Client Details</li>
                <li id="accountDetails">Account Details</li>
                <li id="request">Client Request</li>
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
                <form action="adminlogout" method="post">
                    <button id="logoutButton">Logout</button>
                </form>
            </div>
            
        </div>
    </div>
    <div class="content-block" id="mainBlock">
        <div class="content-block-head">
            <h1>Account Statement</h1>
            <p>View list of all Credit / Debit /fund transfer transaction summary by the client</p>
        </div>
        <div class="client-detail-block">
        <% 
        	String user = request.getParameter("clientName"); 
        	if(user==null){
        		user = (String)session.getAttribute("clientName");
        	}
        %>
            <div class="username-block">
                <p>User Name :&nbsp;</p>
                <p class="username"> <%=user %></p>
            </div>
            <table>
                <tr>
                    <th>Transaction Date</th>
                    <th>Reference No</th>
                    <th>Transaction Description</th>
                    <th>Transaction Type</th>
                    <th>Account</th>
                    <th>Status</th>
                </tr>
                
                <% TransactionDetailDao td = new TransactionDetailDao(user); %>
                <% ArrayList<String> transactions = td.getAllTransaction(); %>
                <% for(String transaction : transactions) { %>
                	<% TransactionDetailDao tdd = new TransactionDetailDao(user ,transaction); %>
	                <tr>
	                    <td><%= tdd.getTransactionDate() %></td>
	                    <td><%=transaction %></td>
	                    <td><%= tdd.getDescription() %></td>
	                    <td><%= tdd.getTransactionType() %></td>
	                    <td>₹.<%= tdd.getAmount() %></td>
	                    <td><%= tdd.getStatus()%></td>
	                </tr>
	            <% } %>
	            <% session.setAttribute("clientName", null); %>
            </table>
        </div>
    </div>
</body>
</html>