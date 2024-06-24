<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="AdminLogIn.css">
</head>
<body>
    <header>
        <div class="Bank-icon-section">
            <div class="icon">
                <img src="/BankManagementSystem/images/finance-logo-and-symbols-vector-concept-removebg-preview.png" alt="FinanceLogo">
            </div>
            <div class="bank-name">
                <h3>Finance</h3>
            </div>
        </div>
        <div class="nav">
            <p>Help</p>
        </div>
    </header>
    <div class="line">
        <hr>
    </div>

    <div class="sign-in-block">
        <div class="main-sign-in-block">
            <div class="sign-in-block-head">
                <h2>Admin Log In</h2>
            </div>
            <% String error = (String)session.getAttribute("error"); %>
            <% if(error != null) {%>
	            <div class="incorrect-password">
	                <p class="errorr">Incorrect Username or Password</p>
	            </div>
            <% } %>
            <form action="adminsignin" method="post">
                <div class="sign-in-block-content">
                    <div class="username-block">
                        <label for="name">Username</label>
                        <input type="text" name="name" id="name" placeholder="abc@mybank.com">
                    </div>
                    <div class="password-block">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" placeholder="* * * * * * *">
                    </div>
                </div>
                <div class="remember-block">
                    <input type="checkbox" name="rememberme" id="rememberme">
                    <label for="remember">Remember Me</label>
                </div>
                <button class="sign-in-button">Sign in</button>
            </form>
        </div>
        
    </div>
    
</body>
</html>