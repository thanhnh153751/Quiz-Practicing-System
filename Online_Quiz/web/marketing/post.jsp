<%-- 
    Document   : post
    Created on : Jun 14, 2022, 2:44:49 PM
    Author     : PREDATOR
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
        <link rel="stylesheet" href="../css/post.css"/>
        <script src="../js/post.js"></script>
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
                <a href="./login.html">Login</a>
                <a href="./register.html">Register</a>
            </div>
        </nav>

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="./admin.html">Dashboard</a>
            <a href="/Online_Quiz/marketing/postdetails">Post</a>
            <a href="#">Clients</a>
            <a href="#">Contact</a>
        </div>

        <!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
        <div id="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-11"> <h1>List of Post</h1>
                            </div>
                            <div class="col-md-1" style=""> <a href="/Online_Quiz/marketing/postdetails?do=add">Add New Post</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">#ID</th>
                                    <th scope="col">Post Title</th>
                                    <th scope="col">Brief Information</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Status</th>

                                    <th scope="col"> Action</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${listP}" var="o">
                                    <tr>
                                        <th scope="row">${o.id}</th>
                                        <td>${o.post_title}</td>
                                        <td>${o.biref}</td>
                                        <td>${o.author}</td>
                                        <c:if test="${o.status == 1 }">
                                            <td>Active</td>

                                        </c:if>
                                        <c:if test="${o.status == 0}">
                                            <td>Inactive</td>

                                        </c:if>

                                        <td><a href="/Online_Quiz/marketing/postdetails?do=details&id=${o.id}"><i class="fas fa-eye"></i></a> 
                                                <c:if test="${o.status == 1 }">
                                                <a href="/Online_Quiz/marketing/postdetails?do=changing&id=${o.id}&status=${o.status}"><i class="fas fa-flag" style="color: red"></i></a>


                                            </c:if>
                                            <c:if test="${o.status == 0}">
                                                <a href="/Online_Quiz/marketing/postdetails?do=changing&id=${o.id}&status=${o.status}"><i class="fas fa-flag" style="color: green"></i></a>


                                            </c:if>

                                        </td>


                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
<!--                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">

                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>-->
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
