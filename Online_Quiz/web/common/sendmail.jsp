<%-- 
    Document   : sendmail
    Created on : May 25, 2022, 8:41:49 PM
    Author     : Viet Dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.lineicons.com/2.0/LineIcons.css" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
        </script>
        <link rel="stylesheet" href="../css/sendmail.css">
        <title>JSP Page</title>
    </head>
    <body class="bg-info">

        <form action="reset" method="post">
            <div >

                <div class="container-fluid main-form">

                    <div class="form bg-light">
                        <h1 class="text-center font-weight-bold text-primary">Password Reset</h1>
                        <div class="alert alert-success text" role="alert" id="text">
                            Enter your email address and we'll send you an email with instructions to reset your password.
                        </div>                    
                        <div class="form-group">
                            <label for="email"><h6>Your email</h6></label>
                            <input type="email" class="form-control" name="email" id="email" placeholder="Email Address">
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary btn-lg btn-block" id="button">Reset Password</button>
                        </div>
                        <p class="text-danger">${mess}</p>

                        <a class="" href="https://procraft.studio">Login</a>
                    </div>

                </div>
            </div>



        </form>
    </body>
</html>
