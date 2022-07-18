<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUD Data </title>
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
                    <a class="activenav" href="http://localhost:8080/Online_Quiz/common/managersubjectlist">Subjects List </a>
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
                                                        <li class="breadcrumb-item">Subjects List</li>
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="#">Subjects Dimension</a>
                                                        </li>
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="#">Edit Dimension</a>

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
                        <form action="/Online_Quiz/common/editdimension" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Dimension</h4>
                                <!--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="id" class="btn btn-info" value="${id}">
                                <input type="hidden" name="sid" class="btn btn-info" value="${sid}">

                                <div class="form-group">
                                    <label>Type</label>
                                    <input value="${listD.dtype}" name="typemd" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${listD.dname}" name="namemd" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <input value="${listD.ddescription}" name="descriptionmd" type="text" class="form-control" required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="button" name="submit" id="edit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <div class="modal" id="editmd">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Successfully</h4>
                        
                    </div>

                    <!-- Modal body -->


                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <input type="hidden" id="sid" value="${requestScope.sid}">
                        <button type="button" class="btn btn-success" data-bs-dismiss="modal">Close</button>
                        
                    </div>

                </div>
            </div>
        </div>


        </div>
        
                        <br>
                        <br>
                        <br>
                        <br>
                        
                        
                        <jsp:include page="../common/footer.jsp"></jsp:include>
                        </div>
    </body>
    <script src="js/manager.js" type="text/javascript"></script>
    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <script src="../js/slick/slick.min.js"></script>
    <script src="../js/index.js"></script>
</html>