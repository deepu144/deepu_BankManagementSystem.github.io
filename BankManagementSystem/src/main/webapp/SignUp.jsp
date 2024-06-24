<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="SignUp.css">
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

    <div class="sign-up-block">
        <div class="main-sign-up-block">
            <div class="sign-up-block-head">
                <h2>Register a new customer</h2>
                <% if(request.getAttribute("error")!=null) { %>
                	<p class="error">Invaild Details</p>
                <% } %>
            </div>
            <form action="signingup" method="post">
                <div class="sign-up-block-content">
                    
                    <div class="firstname-block">
                        <label for="firstname">Name</label>
                        <input type="text" name="firstname" id="firstname" placeholder="Enter Full Name" required="required">
                    </div>
                    <div class="lastname-block">
                        <label for="Usname">User Name</label>
                        <input type="text" name="Usnamee" id="Usname" placeholder="Enter Unique UserName" required="required">
                    </div>
                    <div class="email-block">
                        <label for="email">Email</label>
                        <input type="email" name="email" id="email" placeholder="Email" required="required">
                    </div>
                    <div class="dob">
                        <label for="dob">Date Of Birth</label>
                        <input type="date" name="dob" id="dob" placeholder="dd-mm-yyyy" required="required">
                    </div>
                    <div class="number">
                        <label for="number">Phone Number</label>
                        <input type="tel" name="number" id="number" placeholder="XXXX XXXX XX" required="required">
                    </div>
                    <div class="aadhar">
                        <label for="aadhar">Aadhar Number</label>
                        <input type="tel" name="aadhar" id="aadhar" placeholder="XXXX-XXXX-XXXX" required="required">
                    </div>
                    <div class="gender">
                        <label for="gender">Gender</label>
                        <select name="gender" id="gender" required="required">
                            <option value="male" >Male</option>
                            <option value="female" >Female</option>
                            <option value="other">Others</option>
                        </select>
                    </div>
                    <div class="address">
                        <label for="address">Address</label>
                        <textarea name="address" id="address" cols="30" rows="5" placeholder="Enter Address" required="required"></textarea>
                    </div>
                    <div class="city">
                        <label for="city">City</label>
                        <input type="text" name="city" id="city" placeholder="City" required="required">
                    </div>
                    <div class="state">
                        <label for="state">State</label>
                        <input type="text" name="state" id="state" placeholder="State" required="required">
                    </div>
                    <div class="pincode">
                        <label for="pincode">Zip Code</label>
                        <input type="tel" name="pincode" id="pincode" placeholder="Pincode" required="required">
                    </div>
                    <div class="acctype">
                        <label for="acctype">Account Type</label>
                        <select name="acctype" id="acctype" required="required">
                            <option value="current">Current</option>
                            <option value="savings" selected>Savings</option>
                        </select>
                    </div>
                    <div class="password">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" placeholder="Password" required="required">
                    </div>
                    <div class="password2">
                        <label for="password2">Confirm Password</label>
                        <input type="password" name="password2" id="password2" placeholder="Re-type Password" required="required">
                    </div>
                </div>
                <button class="request">Request</button>
            </form>
        </div>
    </div>
    
</body>
</html>