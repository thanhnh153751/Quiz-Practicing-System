<%-- 
    Document   : myregistrations
    Created on : Jun 15, 2022, 3:14:49 PM
    Author     : PREDATOR
--%>
<%@page import="Model.SubSubjectCategory"%>
<%@page import="java.util.List"%>
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
                <a class="activenav" href="/Online_Quiz/public/myregistrations">My Registrations</a>
                <a href="/Online_Quiz/common/practicesList">Practices List</a>            
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
                                                        <li class="breadcrumb-item">My Registrations</li>
                                                        <li class="breadcrumb-item">
                                                            
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
                   

                <div class="col-sm-12"

                     <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-10 text-primary">
                                    <h2>My<b> Registrations</b></h2>
                                </div>
                                <div class="col-sm-2">


                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover table-sm table-bordered">
                            <thead>
                                <tr>                        
                                    <th>Id</th>
                                    <th>Subject</th>
                                    <th>Registration Time</th>
                                    <th>Package</th>
                                    <th>Total Cost</th>
                                    <th>Status</th>
                                    <th>Valid From</th>
                                    <th>Valid To</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${listO}" var="o">
                                    <tr>
                                        <td>${o.id}</td>
                                        <td>${o.subject}</td>
                                        <td>${o.registration_time}</td>
                                        <td>${o.packagee} </td>
                                        <td>${o.total_cost}</td>
                                        <td>${o.status}</td>
                                        <td>${o.valid_from}</td>
                                        <td>${o.valid_to}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <c:set var="index" value="${requestScope.index}"/>                


                        <ul class="pagination">
                            <c:forEach begin="1" end="${numpage}" var="i">
                                <li class="page-item ${i==index?"active":""}"><a class="page-link" href="simulationexams?index=${i}&did=${did}&lid=${lid}&search=${ts}">${i}</a></li>
                                </c:forEach>
                        </ul>





                    </div>

                </div>
                <!--            <a href="#"><button type="button" class="btn btn-primary">Back to home</button>-->
            </div>
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

            <jsp:include page="../common/social_sidebar.jsp"></jsp:include>  




    </body>
</html>

