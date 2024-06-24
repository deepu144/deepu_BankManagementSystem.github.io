<%@page import="java.util.ArrayList"%>
<%@page import="com.bankmanagement.deepu.dao.ClientDetailDao"%>
<%@page import="com.bankmanagement.deepu.dao.AccountdetailDao"%>
<%@page import="com.bankmanagement.deepu.dao.AdminSignInDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client Detail</title>
    <link rel="stylesheet" href="AllClients.css">
    <script src="AllClients.js" defer></script>
</head>
<body>
	<% response.addHeader("Cache-control", "no-cache, no-store, must-revalidate"); %>
	<% String name = (String)session.getAttribute("adminName"); %>
	<% if(name == null) {
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
                <li class="highlight" id="clientDetails">Client Details</li>
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
            <h1>Client Detail List</h1>
            <p>View all of your customer details and can edit them also get information about client</p>
        </div>
        <div class="client-detail-block">
            <table>
                <tr>
                    <th>Username</th>
                    <th>Account Number</th>
                    <th>E-Mail</th>
                    <th>Mobile</th>
                    <th>Register Date</th>
                    <th>status</th>
                    <th>Action</th>
                </tr>
                <% 
                	ClientDetailDao cd = new ClientDetailDao();
                	ArrayList<String> clients = cd.allClients();
                %>
                <% for(String client : clients) {%>
	                <% ClientDetailDao cd1 = new ClientDetailDao(client); %>
	                <% AccountdetailDao ad = new AccountdetailDao(client);%>
	                <tr>
	                    <td><%= client %></td>
	                    <td><%= ad.getAccNo() %></td>
	                    <td><%= cd1.getEmail() %></td>
	                    <td><%= cd1.getNumber() %></td>
	                    <td><%= ad.getOpeningDate() %></td>
	                    <td><%= ad.getStatus() %></td>
	                    <td class="editcell">
	                        <form action="AdminEditClient.jsp" method="post">
	                            <button value="<%= client%>" name="EditClientName">Edit</button>
	                        </form>
	                    </td>
	                </tr>
	         	<% } %>
            </table>
        </div>
    </div>
</body>
</html>