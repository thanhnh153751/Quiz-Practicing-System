<%-- 
    Document   : profile
    Created on : May 27, 2022, 4:40:32 PM
    Author     : PREDATOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/profile.css" >

    </head>
    <body>

        <form action="profile" method="post">
            <div class="card">
                <div class="card_img">
                    <img src="#" alt="">
                </div>
                <table>
                   
                    <tr>

                        <td>FullName</td>
                        <td><input name="fullname" placeholder="fullname" value="${acc.fullname}" ></td>
                    </tr>
                    <tr>
                        <td>Gmail</td>
                        <td><input name="gmail" placeholder="gmail" value="${acc.email}" readonly></td>
                    </tr>
                    <tr>
                        <td>gender</td>
                        <td><input name="gender" placeholder="gender" value="${acc.gender}" readonly></td>
                    </tr>
                    <tr>
                        <td>phone</td>
                        <td><input name="phone" placeholder="phone" value="${acc.phone}" ></td>
                    </tr>
                    <tr>
                        <td><button type="submit">Edit</button></td>
                                                <td><h3 style="color: red"> ${mess}</h3></td>

                    </tr>

                </table>
            </div>
        </form>


    </body>
</html>
