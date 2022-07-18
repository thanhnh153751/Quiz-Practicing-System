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
                <div class="menu"><a href="http://localhost:8080/Online_Quiz/common/managersubjectlist">Subjects List </a></div>
                <div class="menu"><a class="activenav" href="http://localhost:8080/Online_Quiz/common/questionlist">Questions List </a></div>
                <div class="menu"><a href="http://localhost:8080/Online_Quiz/common/quizzeslist">Quizzes List </a></div>             
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
                                                        <li class="breadcrumb-item">Questions List</li>
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
 
                    <div class="col-sm-3 filter">
                        <div class="text-primary text-center h3">Filter</div>
                        <br>
                        <form action="/Online_Quiz/common/questionlist">
                            <div class="h6">Subject:</div>
                            <select class="select-css" name="sid" onchange="this.form.submit()">
                                <option value="-1">-------------------All Subject------------------</option>
                            <c:forEach items="${listbysubject}" var="D">
                                <option value="${D.id}" ${D.id == sid ?"selected":""}>${D.title}</option>
                            </c:forEach>
                        </select>

                        <div class="h6">Lession:</div>
                        <select class="select-css" name="lid" onchange="this.form.submit()">
                            <option value="all">--------------------All Lession-----------------</option>
                            <c:forEach items="${listLesson}" var="D">
                                <option value="${D.name}" ${D.name == lid ?"selected":""}>${D.name}</option>
                            </c:forEach>
                        </select>

                        <div class="h6">Dimension:</div>
                        <select class="select-css" name="sdid" onchange="this.form.submit()">
                            <option value="-1">--------------------All Dimension-----------------</option>
                            <c:forEach items="${listdimension}" var="D">
                                <option value="${D.sid}" ${D.sid == sdid ?"selected":""}>${D.name}</option>
                            </c:forEach>
                        </select>

                        <div class="h6">Level:</div>
                        <select class="select-css" name="lvid" onchange="this.form.submit()">
                            <option value="-1">--------------------All Level-----------------</option>
                            <c:forEach items="${listbylevel}" var="D">
                                <option value="${D.id}" ${D.id == lvid ?"selected":""}>${D.level}</option>
                            </c:forEach>
                        </select>

                        <div class="h6">Status:</div>
                        <select class="select-css" name="status" onchange="this.form.submit()">
                            <option value="-1"${-1 == status ?"selected":""}>--------------------All Status------------------</option>
                            <option value="1" ${1 == status ?"selected":""}>---------------------Active-----------------</option>
                            <option value="0" ${0 == status ?"selected":""}>---------------------Inactive----------------</option>
                        </select>

                        <div class="h6">Search by Content:</div>
                        <div class="input-group input-group-sm">
                            <input name="search" type="text" value="${ts}" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">

                            <div class="input-group-append">

                                <button type="submit" class="btn btn-secondary btn-number">

                                    <span class="glyphicon glyphicon-search">Search</span>
                                </button>
                            </div>
                        </div>

                    </form>
                </div>

                <div class="col-sm-9">

                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-9 text-primary">
                                    <h2>Questions <b>List</b></h2>
                                </div>
                                <div class="col-sm-3">
                                    <a href="#"  class="btn btn-success" data-toggle="modal"> <span>Questions Import</span></a>

                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Content</th>
                                    <th>Subject</th>
                                    <th>Dimension </th>
                                    <th>Lesson</th>
                                    <th>Level</th>
                                    <th>Status </th>
                                    <th style="width: 16%">Action</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listQ}" var="o">                                 
                                    <tr>
                                        <td>${o.id}</td>
                                        <td>${o.question_content}</td>
                                        <td>${o.sname}</td>
                                        <td>${o.dimenname}</td>
                                        <td>${o.lessionname} </td>
                                        <td>${o.level}</td>


                                        <c:if test="${o.status == true }">
                                            <td>Active</td>

                                        </c:if>
                                        <c:if test="${o.status == false}">
                                            <td>Inactive</td>

                                        </c:if>                                 
                                        <td><a href="#" class="btn btn-danger" data-toggle="modal"><span>Edit</span></a>
                                        
                                            <c:if test="${o.status == true }">
                                                <a class="btn btn-warning" href="questionlist?do=changing&id=${o.id}&status=${o.status}" 
                                                   data-bs-toggle="modal" data-bs-target="#exampleModalh${o.id}">Hide</a>
                                            </c:if>
                                            <c:if test="${o.status == false}">
                                                <a class="btn btn-warning" href="questionlist?do=changing&id=${o.id}&status=${o.status}" 
                                                   data-bs-toggle="modal" data-bs-target="#exampleModals${o.id}">Show</a>


                                            </c:if>
                                        </td>

                                    </tr>
                                <div class="modal fade" id="exampleModalh${o.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Acceptance</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Do You Want To Hide Question?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                                <a href="questionlist?do=changing&id=${o.id}&status=${o.status}"  type="button" class="btn btn-primary">Yes</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                
                                <div class="modal fade" id="exampleModals${o.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Acceptance</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Do You Want To Show Question?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                                <a href="questionlist?do=changing&id=${o.id}&status=${o.status}"  type="button" class="btn btn-primary">Yes</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </c:forEach>
                            </tbody>
                        </table>
                        <c:set var="index" value="${requestScope.index}"/>                
                        <ul class="pagination">
                            <c:forEach begin="1" end="${requestScope.num}" var="i">
                                <li class="page-item ${i==index?"active":""}"><a class="page-link" href="questionlist?index=${i}&sid=${sid}&lid=${lid}&sdid=${sdid}&lvid=${lvid}&status=${status}&search=${ts}">${i}</a></li>
                                </c:forEach>
                        </ul>





                    </div>

                </div>
                <!--            <a href="#"><button type="button" class="btn btn-primary">Back to home</button>-->
            </div>
                        </div>
                        <br>
                        <br>
                        
                        <div>
                        <jsp:include page="../common/footer.jsp"></jsp:include>
                        </div>
            </div>



    </body>
    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <script src="../js/slick/slick.min.js"></script>
    <script src="../js/index.js"></script>
    <script src="../js/sidenav.js"></script>




</html>
