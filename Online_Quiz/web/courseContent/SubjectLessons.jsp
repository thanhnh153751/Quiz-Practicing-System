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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />


        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/ManageListSubject.css">




    </head>
    <body>
        <jsp:useBean id="a" class="DAO.DAO" scope="request"></jsp:useBean>
            <div class="header">
            <jsp:include page="../common/header.jsp"></jsp:include>
            </div>
            <div class="container"style="padding-top: 50px">
                <div class="row">                    
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-10 text-primary">
                                    <h2>Subject<b>Lessons</b></h2>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-success" href="#">Add New Lesson</a>

                                </div>

                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover table-sm table-bordered">
                        <thead class="table-success" >
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

                                <td><a href="#"><i class="fas fa-eye"></i>View</a>
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
                                        <a href="subjectlesson?do=changing&id=${o.id}&status=${o.status}"  type="button" class="btn btn-primary">Yes</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <% num++;%>
                    </c:forEach>
                    </tbody>
                </table>


                <c:set var="index" value="${requestScope.index}"/>                

                <ul class="pagination">
                    <c:forEach begin="1" end="${requestScope.num}" var="i">
                        <li class="page-item ${i==index?"active":""}"><a class="page-link" href="subjectlesson?index=${i}">${i}</a></li>
                        </c:forEach>
                </ul>




            </div>
            <!--            <a href="#"><button type="button" class="btn btn-primary">Back to home</button>-->
        </div>


    </body>
    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>

</html>
