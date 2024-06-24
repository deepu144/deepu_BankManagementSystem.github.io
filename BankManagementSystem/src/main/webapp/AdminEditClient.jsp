<%@page import="com.bankmanagement.deepu.dao.AccountdetailDao"%>
<%@page import="com.bankmanagement.deepu.dao.ClientDetailDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client Information</title>
    <link rel="stylesheet" href="AdminEditClient.css">
    <script src="AdminEditClient.js" defer></script>
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
            <h1>Client Detail List</h1>
            <p>Get the account details of any customer, credit and debit funds</p>
        </div>
        <div class="client-detail-block">
            <form action="savechanges" method="post">
                <div class="client-table">
                <% String name = request.getParameter("EditClientName"); %>
                <% ClientDetailDao cd = new ClientDetailDao(name); %>
                <% AccountdetailDao ad = new AccountdetailDao(name); %>
                    <table>
                        <tr>
                            <th>User Name</th>
                            <td>
                            <% session.setAttribute("update", name); %>
                                <textarea name="username" id="username" cols="90" rows="1"><%=name %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>Account Holder Name</th>
                            <td>
                                <textarea name="name" id="name" cols="90" rows="1"><%= cd.getName() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>E-Mail</th>
                            <td>
                                <textarea name="email" id="email" cols="90" rows="1"><%= cd.getEmail() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>DOB</th>
                            <td>
                                <textarea name="dob" id="dob" cols="90" rows="1"><%= cd.getDob() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>Gender</th>
                            <td>
                            	<%
                            		if(cd.getGender()==null){
                            			response.sendRedirect("AdminLogIn.jsp");
                            		}
                            	%>
                            	<% if(cd.getGender().equalsIgnoreCase("male")) {%>
	                                <select name="gender" id="gender">
	                                    <option value="male" selected>Male</option>
	                                    <option value="female">Female</option>
	                                    <option value="others">Others</option>
	                                </select>
                                <% }else if(cd.getGender().equalsIgnoreCase("female")) { %>
                                	<select name="gender" id="gender">
	                                    <option value="male">Male</option>
	                                    <option value="female" selected>Female</option>
	                                    <option value="others">Others</option>
	                                </select>
	                            <% }else { %>
	                            	<select name="gender" id="gender">
	                                    <option value="male">Male</option>
	                                    <option value="female">Female</option>
	                                    <option value="others" selected>Others</option>
	                                </select>
	                            <% } %>
                            </td>
                            
                        </tr>
                        <tr>
                            <th>Mobile Number</th>
                            <td>
                                <textarea name="mobile" id="mobile" cols="90" rows="1"><%=cd.getNumber() %></textarea>
                            </td>
                        <tr>
                            <th>City</th>
                            <td>
                                <textarea name="city" id="city" cols="90" rows="1"><%= cd.getCity() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>State</th>
                            <td>
                                <textarea name="state" id="state" cols="90" rows="1"><%= cd.getState() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>Zip Code</th>
                            <td>
                                <textarea name="zipcode" id="zipcode" cols="90" rows="1"><%= cd.getZipCode() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>Address</th>
                            <td>
                                <textarea name="address" id="address" cols="90" rows="7"><%= cd.getAddress() %></textarea>
                            </td>
                        </tr>
                        <tr class="historyrow">
                            <th>Transaction History</th>
                            <td class="history">
                                	<% session.setAttribute("clientName", name); %>
                                    <a href="AccountStatement.jsp">View Transaction History</a>
                            </td>
                        </tr>
                        <tr>
                            <th>Account Type</th>
                            <td>
                             	<% if(ad.getAccType().equalsIgnoreCase("saving")) {%>
	                                <select name="accType" id="accType">
	                                    <option value="Saving" selected>Saving</option>
	                                    <option value="Current">Current</option>
	                                </select>
                                <% }else { %>
                                	<select name="accType" id="accType">
	                                    <option value="Saving">Saving</option>
	                                    <option value="Current" selected>Current</option>
	                                </select>
	                            <% } %>
                            </td>
                        </tr>
                        <tr>
                            <th>Status</th>
                            <td>
                            	<% if(ad.getStatus().equalsIgnoreCase("active")) {%>
	                                <select name="accStatus" id="accStatus">
	                                    <option value="active" selected>Active</option>
	                                    <option value="deactive">Deactive</option>
	                                </select>
                                <% }else { %>
                                	<select name="accStatus" id="accStatus">
	                                    <option value="active">Active</option>
	                                    <option value="deactive" selected>Deactive</option>
	                                </select>
	                            <% } %>
                            </td> 
                        </tr>
                    </table>
                </div>
                <div class="actionButton" >
                    <div class="beforeEdit" id="beforeEditButton">
                        <a href="AllClients.jsp" class="button">Back</a>
                        <p class="button" id="edit">Edit</p>
                    </div>
                    <div class="afterEdit hideButton" id="afterEditButton">
                        <p class="button" id="cancelButton">Cancel</p>
                        <button class="button">Save</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>