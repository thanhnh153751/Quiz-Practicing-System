<%-- 
    Document   : register
    Created on : May 25, 2022, 12:28:19 AM
    Author     : PREDATOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <form action="signup" method="post">
            <div class="container-fluid main-form">
                <div class="form">
                    <h1>Register</h1>
                    <div class="input">
                        <label for="fullname">Full Name</label>
                        <input type="text" id="fullname" name="fullname">
                        <label for="email">Email</label>
                        <input type="text" id="email" name="email">
                        <label for="password">Password</label>
                        <input type="text" id="password" name="password">
                        <label for="gender">Gender</label>
                        <select name="" id="gender" name="gender">
                            <option value="">Please choose your gender</option>
                            <option value="">Male</option>
                            <option value="">Female</option>
                        </select>
                        <label for="mobile">Mobile</label>
                        <input type="text" id="mobile" name="mobile">

                    </div>
                    <button type="submit">Register</button> 
                    <a href="./login.jsp">You have an account? Login</a>
                    <a href="./forgot.html">Forgot password?</a>
                </div>
            </div>
        </form>
    </body>
</html>
