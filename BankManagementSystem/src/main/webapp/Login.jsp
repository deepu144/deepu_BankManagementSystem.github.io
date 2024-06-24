<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="Login.css">
    <script src="Login.js" defer></script>
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
                <h2>Sign in</h2>
            </div>
            <div class="incorrect-password">
                <% String error = (String)request.getAttribute("error"); %>
	                <%   if(error!=null){ %>
	                		<p class="errorr"> <%= error %> </p>
	                	<%  }  %>
            </div>
            <form action="signingin" method="post">
                <div class="sign-in-block-content">
                    <div class="username-block">
                        <label for="name">Username</label>
                        <input type="text" name="name" id="name" placeholder="abc@mybank.com" required="required">
                    </div>
                    <div class="password-block">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" placeholder="* * * * * * *" required="required">
                    </div>
                </div>
                <div class="remember-block">
                    <input type="checkbox" name="rememberme" id="rememberme">
                    <label for="remember">Remember Me</label>
                </div>
                <button class="sign-in-button">Sign in</button>
                <p class="reset">Trouble Signing in? Reset your Password</p>
            </form>
        </div>
        
    </div>
    
</body>
</html>