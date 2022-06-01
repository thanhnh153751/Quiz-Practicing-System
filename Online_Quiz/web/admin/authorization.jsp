<%-- 
    Document   : authorization
    Created on : Jun 1, 2022, 2:58:28 PM
    Author     : hongd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
        </script>
        <link rel="stylesheet" href="../css/admin.css">
        <script src="../js/admin.js"></script>
        <title>Document</title>
    </head>

    <body>
        <nav class="navbar">
            <div class="brand">Quiz Online
                <a href="#" onclick="openNav()"><i class="fa-solid fa-bars"></i></a>

            </div>
            <div class="search">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="search" placeholder="Search anything...">
            </div>
            <div class="auth">
                <a href="<c:url value="/login"/>">Login</a>
                <a href="<c:url value="/register"/>">Register</a>
            </div>
        </nav>

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="./admin.html">Dashboard</a>
            <a href="./dashboard.html">Subject</a>
            <a href="#">Clients</a>
            <a href="#">Contact</a>
        </div>

        <!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
        <div id="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h1>Authorization</h1>
                    </div>
                    <div class="col-md-12 table-responsive">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Permissions</th>
                                        <c:forEach items="${requestScope.permissions}" var="per">
                                        <th scope="col"><input type="checkbox" value="${per.id}">&nbsp;${per.per_name}</th>
                                        </c:forEach>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${actions}" var="act">
                                    <tr>
                                        <th scope="row">${act.action_name}</th>
                                        <td><input type="checkbox" value="${act.action_code}"></td>
                                        <td><input type="checkbox" value="${act.action_code}"></td>
                                        <td><input type="checkbox" value="${act.action_code}"></td>
                                        <td><input type="checkbox" value="${act.action_code}"></td>
                                        <td><input type="checkbox" value="${act.action_code}"></td>
                                    </tr>
                                </c:forEach>


                            </tbody>
                        </table>
                        <div class="nav-controller fixed-bottom" id="nav-controller">
                            <input type="button" value="Save changes" onclick="saveChanges()">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>


</html>
