<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AdminPage</title>
    <link rel="stylesheet" href="AdminMain.css">
    <script src="AdminMain.js" defer></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
                <li class="highlight" id="home">Home</li>
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
        <div class="welcome-admin">
            <h1>Bank Management System</h1>
            <h2>Admin Main Page</h2>
        </div>

        <div class="inner-content-block">
            <div class="account-info">
                <span class="material-symbols-outlined">
                    note_alt
                </span>
                <div class="inner-account-info">
                    <a href="AccountDetail.jsp">Account Information</a>
                    <p>Get the account details of any customer, credit and debit funds</p>
                </div>
            </div>
            <div class="client-info">
                <span class="material-symbols-outlined">
                    manage_accounts
                </span>
                <div class="inner-client-info">
                    <a href="AllClients.jsp">Client Information</a>
                    <p>View all of your customer details and can edit them also get information about client</p>
                </div>
            </div>
        </div>
        <div class="add-inner-content-block">
            <div class="request-info">
                <span class="material-symbols-outlined">
                    request_quote
                </span>
                <div class="inner-request-info">
                    <a href="ClientRequest.jsp">Client Request</a>
                    <p>View all of the client request that are wanted to register an new bank account </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>