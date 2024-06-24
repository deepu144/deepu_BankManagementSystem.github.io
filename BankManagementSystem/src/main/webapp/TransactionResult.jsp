<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Result</title>
    <link rel="stylesheet" href="TransactionResult.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="TransactionResult.js" defer></script>
</head>

<body>
    <main>
    	<% response.addHeader("Cache-control", "no-cache, no-store, must-revalidate"); %>
    	<% String name = (String) session.getAttribute("name"); %>
    	<%
    		if(name == null){
    			response.sendRedirect("WelcomePage.html");
    		}
    	%>
    	<% String isTransactionSuccess = (String)request.getAttribute("isTransactionSuccess"); %>
    	<% String isLowBalance = (String)request.getAttribute("isLowBalance"); %>
    	<% if(isLowBalance!=null){ %>
    		<img src="/BankManagementSystem/images/wrong-image.png" alt="WrongSymbol">
	        <p>Oops!,You have Low Balance in your Account</p>
	    <% }else if(isTransactionSuccess!=null) { %>
	        <img src="/BankManagementSystem/images/tick-image.png" alt="TickSymbol">
	        <p>Transaction Successfull😇</p>
	    <% }else{ %>
	    	<img src="/BankManagementSystem/images/wrong-image.png" alt="WrongSymbol">
	        <p>Transaction Failure😞</p>
	    <% } %>
        <button id="back">
            <span class="material-symbols-outlined">
                arrow_left_alt
            </span>Back to Home
        </button>
    </main>
</body>

</html>