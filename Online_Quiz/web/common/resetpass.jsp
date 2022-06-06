<%-- 
    Document   : resetpass
    Created on : May 23, 2022, 10:22:02 PM
    Author     : Viet Dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.lineicons.com/2.0/LineIcons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
        </script>
        <link rel="stylesheet" href="../css/password.css">
        <script src="../js/changepass.js"></script>

        <title>Document</title>
    </head>

    <body class="bg-info">
        <form action="rechange" method="post" id="myForm1">

            <div class="light-blue">

                <div class="container-fluid main-form">

                    <div class="form bg-light">
                        <h1 class="text-center font-weight-bold text-primary">Change Password</h1>
                        <input type="hidden" name="email" value="${email}">
                        <input type="hidden" name="tok" value="${tok}">
                        <div class="form-group">
                            <label for="email"><h6>New Password</h6></label>
                            <input type="password" class="form-control" name="newpassword" id="password" placeholder="New Password" pattern="^[a-z]{1}[a-z0-9_]{3,13}$" required>
                            <div class="valid-feedback">Valid</div>
                            <div class="invalid-feedback">(a to z)(1 to 9)(3 to 13 long)</div>
                        </div>

                        <div class="form-group">
                            <label for="email"><h6>Confirm Password</h6></label>
                            <input type="password" class="form-control" name="connewpassword" id="repassword" placeholder="Confirm Password" pattern="^[a-z]{1}[a-z0-9_]{3,13}$" required>
                            <div id="cPwdValid" class="valid-feedback">Valid</div>
                            <div id="cPwdInvalid" class="invalid-feedback">(a to z)(1 to 9)(3 to 13 long)</div>
                        </div>
                        <span id="message"></span>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-lg btn-block" id="submitBtn">Change Password</button>
                        </div>

                    </div>
                </div>

            </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </form>
    </body>

</html>
