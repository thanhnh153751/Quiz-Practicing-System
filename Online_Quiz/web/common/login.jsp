<%-- 
    Document   : login
    Created on : May 16, 2022, 11:49:25 PM
    Author     : PREDATOR
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                crossorigin="anonymous"></script>
                <link rel="stylesheet" href="../css/login.css">
            <title>Document</title>
        </head>

        <body>
            <div class="container-fluid main-form">
                <form action="/Online_Quiz/common/login" method="post" class="form">
                    <h1>Login</h1>
                    <div class="input">
                        <label for="email">Email</label>
                        <input type="text" id="email" name="email">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password">
                    </div>
                    <p class="text-danger">${requestScope.mess}</p>
                    <input type="submit" value="Login" id="sm-btn">
                    <a href="<c:url value="/common/register"/>">Register new account</a>
                    <a href="<c:url value="/common/sendmail.jsp"/>">Forgot password?</a>

                </form>

            </div>
        </body>

        </html>