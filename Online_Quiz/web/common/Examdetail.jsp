<%-- 
    Document   : Listsubject
    Created on : Jun 10, 2022, 2:55:10 PM
    Author     : Viet Dung
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="../css/slick/slick.css">
        <link rel="stylesheet" href="../css/index.css">
        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/sidenav.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../css/ManageListSubject.css">


    </head>
    <body>
        <jsp:include page="../common/header.jsp"></jsp:include>
        <div id="main">
            
                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <a href="#">My Registrations</a>
                    <a class="activenav" href="/Online_Quiz/common/practicesList">Practices List</a>
                    <a href="/Online_Quiz/public/listsubject">List Subject</a>

                </div>
                <div class="container"style="padding-top: 50px">
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
                                                        <li class="breadcrumb-item">Practices List</li>
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="http://localhost:8080/Online_Quiz/common/simulationexams">Simulation Exam</a>
                                                        </li>
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="#">Exam Detail</a>
                                                        </li>
                                                    </ol>
                                                </nav>
                                            </div>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>
                <div class="row">                   
                    <div class="col-sm-12">

                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-10">
                                        <h2>Exam <b>Detail</b></h2>
                                    </div>

                                </div>
                            </div>
                            <table class="table table-striped table-hover">
                                <thead>


                                    <tr>

                                        <th>ID</th>
                                        <th>Subject</th>
                                        <th>Simulation exam</th>
                                        <th>Level</th>
                                        <th>#Question</th>
                                        <th>Duration</th>
                                        <th>Pass rate</th>
                                        <th>Take Exam</th>
                                    </tr>

                                </thead>
                                <tbody>

                                <c:forEach items="${listS}" var="o">
                                    <tr>
                                        <td>${o.lid}</td>
                                        <td>${o.title}</td>
                                        <td>${o.simulation}</td>
                                        <td>${o.level} </td>
                                        <td>${o.numoffquess} </td>
                                        <td>${o.ducation}p </td>
                                        <td>${o.passrate}%</td>
                                        <td><a href="/Online_Quiz/learning/quiztake?quiz_id=4" class="btn btn-danger" data-toggle="modal"><span>Go Quiz Handle</span></a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>                                                            
                    </div>

                </div>

            </div>
        </div>
                </div>
            <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <jsp:include page="../common/footer.jsp"></jsp:include>
                        </div>
                        
            <script src="../js/jquery/jquery.js"></script>
            <script src="../js/jquery/jquery-migrate.js"></script>
            <script src="../js/boostrap/bootstrap.min.js"></script>
            <script src="../js/slick/slick.min.js"></script>
            <script src="../js/index.js"></script>
            <script src="../js/sidenav.js"></script>



    </body>


</html>
