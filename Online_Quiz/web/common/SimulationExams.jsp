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
                                                        
                                                    </ol>
                                                </nav>
                                            </div>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <div class="col-sm-3 filter">
                            <div class="text-primary text-center h3">Filter</div>
                            <br>

                            <form action="/Online_Quiz/common/simulationexams">
                                <div class="h6">Subject:</div>
                                <select class="select-css" name="did" onchange="this.form.submit()">
                                    <option value="-1">------------------All Subject------------------</option>
                                <c:forEach items="${listbysubject}" var="D">
                                    <option value="${D.id}" ${D.id == did ?"selected":""}>${D.title}</option>
                                </c:forEach>
                            </select>
                            <div class="h6">Level:</div>

                            <select class="select-css" name="lid" onchange="this.form.submit()">
                                <option value="-1">-------------------All Level------------------</option>
                                <c:forEach items="${listbylevel}" var="D">
                                    <option value="${D.id}" ${D.id == lid ?"selected":""}>${D.level}</option>
                                </c:forEach>
                            </select>
                            <br>
                            <div class="h6">Search by ExamName: </div>


                            <div class="input-group input-group-sm" style="padding-right:14px">
                                <input name="search" type="text" value="${ts}" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">

                                <div class="input-group-append">

                                    <button type="submit" class="btn btn-secondary btn-number">

                                        <span class="glyphicon glyphicon-search">Search</span>
                                    </button>
                                </div>
                            </div>

                        </form>



                    </div>

                    <div class="col-sm-9"

                         <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-10 text-primary">
                                        <h2>Simulation<b>Exam</b></h2>
                                    </div>
                                    <div class="col-sm-2">


                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover table-sm  table-bordered">
                                <thead class="" >
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
                                            <td><a href="examdetail?id=${o.lid}" class="btn btn-danger" data-toggle="modal"><span>Take Exam</span></a></td>
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
