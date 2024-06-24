<%@page import="com.bankmanagement.deepu.dao.RequestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Deatil</title>
    <link rel="stylesheet" href="RequestDetail.css">
    <script src="RequestDetail.js" defer></script>
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
                <form action="">
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
            <div class="client-table">
            <% String name = request.getParameter("requestedName"); %>
            <% RequestDao rd = new RequestDao(name); %>
                <table>
                    <tr>
                        <th>User Name</th>
                        <td><%= name %></td>
                    </tr>
                    <tr>
                        <th>Account Holder Name</th>
                        <td><%=rd.getName() %></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><%= rd.getEmail() %></td>
                    </tr>
                    <tr>
                        <th>DOB</th>
                        <td><%= rd.getDob() %></td>
                    </tr>
                    <tr>
                        <th>Gender</th>
                        <td><%= rd.getGender() %></td>
                        
                    </tr>
                    <tr>
                        <th>Mobile Number</th>
                        <td><%= rd.getNumber() %></td>
                    </tr>
                    <tr>
                        <th>Aadhar No</th>
                        <td><%= rd.getAadhar() %></td>
                    </tr>
                    <tr>
                        <th>City</th>
                        <td><%= rd.getCity() %></td>
                    </tr>
                    <tr>
                        <th>State</th>
                        <td><%= rd.getState() %></td>
                    </tr>
                    <tr>
                        <th>Zip Code</th>
                        <td><%= rd.getZipCode() %></td>
                    </tr>
                    <tr class="addressRow">
                        <th>Address</th>
                        <td><%= rd.getAddress() %></td>
                    </tr>
                    <tr>
                        <th>Account Type</th>
                        <td><%= rd.getAccType() %></td>
                    </tr>
                    <tr>
                        <th>Account Password</th>
                        <td><%= "* ".repeat(rd.getPassword1().length()) %></td>
                    </tr>
                </table>
            </div>
            <div class="actionButton" >
                <form action="requestresult" method="post">
                	<% session.setAttribute("requestedClient", name); %>
                    <button value="decline" class="decline" name="requestResult">Decline</button>
                    <button value="accept" class="accept" name="requestResult">Accept</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>