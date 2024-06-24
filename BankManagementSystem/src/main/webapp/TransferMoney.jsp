<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer Money</title>
    <link rel="stylesheet" href="TransferMoney.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="TransferMoney.js" defer></script>
</head>
<body>
    <header>
    <% response.addHeader("Cache-control", "no-cache, no-store, must-revalidate"); %>
    <% String name = (String)session.getAttribute("name"); %>
    <% if(name == null){
    		response.sendRedirect("WelcomePage.html");
    	}
    %>
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
                <p id="home">Home</p>
                <p id="transactionHistory">Transaction History</p>
                <p>Profile</p>
            </div>
            <div class="menu" id="menu">
                <span class="material-symbols-outlined">
                    menu
                </span>
            </div>
            <div class="dropdown hideDrop" id="dropdown">
                <div class="inner-drop">
                    <div id="home">Home</div>
                    <div id="transactionHistory">Transaction History</div>
                    <div>Profile</div>
                </div>
            </div>
        </div>
    </header>
    <div class="line">
        <hr>
    </div>
    <% String isUsernameFound = (String)request.getAttribute("isUserFound"); %>
    <% if(isUsernameFound != null) { %>
		    <div class="user-not-found-block">
		        <p>Oops! Username Not Found !!!</p>
		    </div>
	<% } %>
    <div class="transfer-body">
        <div class="transfer-heading">
            <h1>Transfer Money</h1>
            <p>Send money to friends and family. You can also use your bank account to pay for goods and services at thousands of merchants.</p>
        </div>
        <div class="transfer-info">
            <form action="moneytransfer" method="post">
                <input type="text" name="name" id="name" placeholder="Recipient's name,Account Number or phone number">
                <textarea name="description" id="description" cols="30" rows="12" placeholder="Add a note "></textarea>
                <p>Amount</p>
                <input type="text" name="amount" id="amount" placeholder="₹0.00">
                <button type="submit" id="submit">Confirm</button>
            </form>
        </div>
    </div>
</body>
</html>