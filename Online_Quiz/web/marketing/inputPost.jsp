<%-- 
    Document   : inputPost
    Created on : Jun 12, 2022, 1:14:24 AM
    Author     : PREDATOR
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">      
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="../css/slick/slick.css">
        <link rel="stylesheet" href="../css/index.css">
        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/sidenav.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer"
              <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <jsp:include page="../common/header.jsp"></jsp:include>
            <div id="main">

                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <a class="" href="http://localhost:8080/Online_Quiz/common/managersubjectlist">Subjects List </a>
                    <a href="http://localhost:8080/Online_Quiz/common/questionlist">Questions List </a>
                    <a href="http://localhost:8080/Online_Quiz/common/quizzeslist">Quizzes List </a>             
                </div>
                <div class="container "style="padding-top: 50px">
                    <div class="row">
                        <header id="page-header" class="row" style="margin-top: -15px; padding-left: -30px">
                            <div class="col-12 pt-3 pb-3" >
                                <div class="card ">
                                    <div class="card-body " style="margin-left: 20px">
                                        <div class="d-flex">
                                            <div class="mr-auto">
                                                <div class="page-context-header"><div class="page-header-headings "><h1 style="color: rgb(35, 35, 201)">Quiz<b> Online</b></h1></div></div>
                                            </div>                                       
                                        </div>
                                        <div class="d-flex flex-wrap">
                                            <div id="page-navbar">
                                                <nav role="navigation" aria-label="Breadcrumb trail">
                                                    <ol class="breadcrumb">
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="http://localhost:8080/Online_Quiz/public/home">Home</a>
                                                        </li>
                                                        <li class="breadcrumb-item">List Of Post</li>
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="#">Post Details</a>
                                                        </li>
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="#">Add New Posts</a>
                                                        </li>
                                                    </ol>
                                                </nav>
                                            </div>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>
                        
                        <div id="editEmployeeModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="/Online_Quiz/marketing/postdetails?do=${do}&filter=1" method="post">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Add Post</h4>

                                    </div>
                                    <div class="modal-body">					


                                        <div class="form-group">
                                            <label>Post_title</label>
                                            <input  name="posttitle" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Brief</label>
                                            <input  name="biref" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Details</label>
                                            <textarea name="details" class="form-control" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Author</label>
                                            <input name="author" class="form-control" type="text" required></input>
                                        </div>
                                        <div class="form-group">
                                            <label>Contact</label>
                                            <input name="contact" class="form-control" type="email" required></input>
                                        </div>

                                        <div class="form-group">
                                            <label>Category Post</label>
                                            <select name="category" class="form-select" aria-label="Default select example">
                                                <c:forEach items="${listPC}" var="o">
                                                    <option value="${o.id}">${o.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Status</label>
                                            <select name="status" class="form-select" aria-label="Default select example">

                                                <option value="1">Active</option>

                                            </select>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-success" value="Add">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <br>
            <br>
            <br>

            <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>


        <script src="js/manager.js" type="text/javascript"></script>
        <script src="../js/jquery/jquery.js"></script>
        <script src="../js/jquery/jquery-migrate.js"></script>
        <script src="../js/boostrap/bootstrap.min.js"></script>
        <script src="../js/slick/slick.min.js"></script>
        <script src="../js/index.js"></script>
        <script src="../js/sidenav.js"></script>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>