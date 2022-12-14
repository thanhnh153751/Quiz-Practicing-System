<%-- 
    Document   : SubjectLessons
    Created on : Jun 26, 2022, 12:33:40 AM
    Author     : PREDATOR
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
            <br>
            <br>
            <div id="main">
            <c:set var="index" value="${requestScope.index}"/> 
            <div id="mySidenav" class="sidenav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <a class="activenav" href="http://localhost:8080/Online_Quiz/common/managersubjectlist">Subjects List </a>
                <a href="http://localhost:8080/Online_Quiz/common/questionlist">Questions List </a>
                <a href="http://localhost:8080/Online_Quiz/common/quizzeslist">Quizzes List </a>             
            </div>
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
                                                <a style="text-decoration: none" href="#">Subject Lessons</a>
                                            </li>
                                        </ol>
                                    </nav>
                                </div>                                          
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            
            <div class="container"style="padding-top: 50px">
                <c:set var="index" value="${requestScope.index}"/> 
                <div class="row">
                    <div>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a style="text-decoration: none" href="/Online_Quiz/courseContent/subjectdetailmanager?sid=${index}"><button class="nav-link " id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="false">Subject Detail</button></a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Lesson</button>
                            </li>
                            <li class="nav-item " role="presentation">
                                <a style="text-decoration: none" href="/Online_Quiz/common/subdimension?sid=${index}"><button class="nav-link " id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Dimention</button></a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a style="text-decoration: none" href="http://localhost:8080/Online_Quiz/courseContent/pricepackage?sid=${index}"><button class="nav-link " id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Price Package</button></a>
                            </li>
                        </ul>
                    </div>                       
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-10 text-primary">
                                    <h2>Subject<b> Lessons</b></h2>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-success" href="#">Add New Lesson</a>

                                </div>

                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover table-sm table-bordered">
                        <thead  >
                            <tr>

                                <th>ID</th>
                                <th>Lesson</th>
                                <th>Type</th>
                                <th>Status</th>
                                <th>Action</th>
                                <th>ChangeStatus</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%int num = 1;%>
                        <c:forEach items="${listl}" var="o">

                            <tr>
                                <td>${o.id}</td>
                                <td>${o.name}</td>
                                <td>${o.type} </td>

                                <c:if test="${o.status == 1 }">
                                    <td>Active</td>

                                </c:if>
                                <c:if test="${o.status == 0}">
                                    <td>Inactive</td>

                                </c:if>

                                <td><a href="#"><i class="fas fa-eye"></i></a>
                                    <a class="btn btn-danger" href="#">Edit</a> 
                                    

                                </td>
                                <td>
                                    <c:if test="${o.status == 1 }">
                                        <a class="btn btn-warning" href="subjectlesson?do=changing&id=${o.id}&status=${o.status}" 
                                           data-bs-toggle="modal" data-bs-target="#exampleModal${o.id}">Inactivate</a>


                                    </c:if>
                                    <c:if test="${o.status == 0}">
                                        <a class="btn btn-warning" href="subjectlesson?do=changing&id=${o.id}&status=${o.status}" 
                                           data-bs-toggle="modal" data-bs-target="#exampleModal${o.id}">Activate</a>


                                    </c:if>
                                </td>

                            </tr> 
                             
                        <div class="modal fade" id="exampleModal${o.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Acceptance</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Do You Want To Change Status?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                        <a href="subjectlesson?do=changing&id=${o.id}&status=${o.status}&sid=${index}"  type="button" class="btn btn-primary">Yes</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <% num++;%>
                    </c:forEach>
                    </tbody>
                </table>

                <input type="hidden" name="sid" value="${requestScope.sid}">
                              
                
                <ul class="pagination">
                    <c:forEach begin="1" end="${requestScope.num}" var="i">
                        <li class="page-item ${i==index?"active":""}"><a class="page-link" href="subjectlesson?index=${i}&sid=${requestScope.sid}">${i}</a></li>
                        </c:forEach>
                </ul>




            </div>
            <!--            <a href="#"><button type="button" class="btn btn-primary">Back to home</button>-->
        </div>

                            <br>
            <br>
            <br>
            <br>

            <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
    </body>
    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <script src="../js/slick/slick.min.js"></script>
    <script src="../js/index.js"></script>
    <script src="../js/sidenav.js"></script>
    

</html>
