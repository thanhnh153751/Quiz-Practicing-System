<%-- 
    Document   : login
    Created on : May 24, 2022, 10:15:44 AM
    Author     : Viet Dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="css/changpasscss.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>

    <body>
        <form action="login" method="post">
            <div class="container-fluid main-form">
                <div class="form">
                    <h1>Login</h1>
                    <div class="input">
                        <label for="email">Email</label>
                        <input type="text" id="email" name="email">
                        <label for="password">Password</label>
                        <input type="text" id="password" name="password">
                        <p class="text-danger">${mess}</p>
                    </div>
                    <input type="submit" value="Login" id="sm-btn">
                    <a href="sendmail.jsp">Forgot password?</a>
                </div>
            </div>
        </form>
    </body>

</html>
