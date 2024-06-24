<%@page import="com.bankmanagement.deepu.dao.RequestDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client Request</title>
    <link rel="stylesheet" href="ClientRequest.css">
    <script src="ClientRequest.js" defer></script>
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
                <li id="clientDetails">Client Details</li>
                <li id="accountDetails">Account Details</li>
                <li class="highlight" id="request">Client Request</li>
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
            <h1>Client Request</h1>
            <p>Clients are Requested to Create account</p>
        </div>
        <% RequestDao rd = new RequestDao(); %>
        <% int i = 0 ; %>
        <% ArrayList<String> clientRequest = rd.getAllRequest(); %>
	        <div class="client-request-block">
	        <% for(String clientReq : clientRequest) { %>
        	<% RequestDao rd1 = new RequestDao(clientReq); %>
	            <div class="request-block">
	                <p class="sno"><%= ++i %></p>
	                <p class="name"><%= clientReq %></p>
	                <form action="RequestDetail.jsp" method="post">
	                	<button class="viewdetail" value="<%=clientReq%>" name="requestedName">View Detail</button>
	                </form>
	            </div>
	        <% } %>
	        </div>
    </div>
</body>
</html>