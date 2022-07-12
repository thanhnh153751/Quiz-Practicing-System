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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="../js/boostrap/bootstrap.bundle.min.js"/>
        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/ManageListSubject.css">


    </head>
    <body>
        <jsp:useBean id="a" class="DAO.DAO" scope="request"></jsp:useBean>
            <div class="header">
            <jsp:include page="../common/header.jsp"></jsp:include>
            </div>
            <div class="container "style="padding-top: 50px">
                <div class="row">
                    <div class="col-sm-3 filter">
                        <div class="text-primary text-center h3">Filter</div>
                        <br>
                        <form action="/Online_Quiz/common/managersubjectlist">
                            <div class="h6">Category:</div>
                            <select class="select-css" name="did" onchange="this.form.submit()">
                                <option value="-1">-------------------Category------------------</option>
                            <c:forEach items="${listCategory}" var="D">
                                <option value="${D.id}" ${D.id == did ?"selected":""}>${D.name}</option>
                            </c:forEach>
                        </select>
                        <div class="h6">Sub_Category:</div>
                        <select class="select-css" name="cid" onchange="this.form.submit()">
                            <option value="-1">----------------Sub_Category--------------</option>
                            <c:forEach items="${listSubCategory}" var="D">
                                <option value="${D.id}" ${D.id == cid ?"selected":""}>${D.name}</option>
                            </c:forEach>
                        </select>

                        <div class="h6">Status:</div>
                        <select class="select-css" name="status" onchange="this.form.submit()">
                            <option value="-1"${-1 == status ?"selected":""}>--------------------Status------------------</option>
                            <option value="1" ${1 == status ?"selected":""}>---------------------Enable-----------------</option>
                            <option value="0" ${0 == status ?"selected":""}>---------------------Disable----------------</option>
                        </select>

                        <br>
                        <div class="h6">Search by Name:</div>
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

                <div class="col-sm-9"

                     <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-9 text-primary">
                                    <h2>Subjects <b>List</b></h2>
                                </div>
                                <div class="col-sm-3">
                                    <a href="/Online_Quiz/courseContent/newsuject"  class="btn btn-success" data-toggle="modal"> <span>Add New Course</span></a>

                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>

                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Sub_Category</th>
                                    <th>Number Of Lessons</th>
                                    <th>Owner</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${listS}" var="o">
                                    <tr>
                                        <td>${o.id}</td>
                                        <td>${o.title}</td>
                                        <td>${o.cname}</td>
                                        <td>${o.csname}</td>
                                        <td>${o.numoflesson} </td>
                                        <td>${o.contact} </td>
                                        <c:if test="${o.status==1}">
                                            <td>Enable </td>
                                        </c:if>
                                        <c:if test="${o.status==0}">
                                            <td>Disable </td>
                                        </c:if>
                                        <td><a href="/Online_Quiz/courseContent/subjectdetailmanager?sid=${o.id}" class="btn btn-danger" data-toggle="modal"><span>Edit</span></a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <c:set var="index" value="${requestScope.index}"/>                


                        <ul class="pagination">
                            <c:forEach begin="1" end="${numpage}" var="i">
                                <li class="page-item ${i==index?"active":""}"><a class="page-link" href="managersubjectlist?index=${i}&status=${status}&did=${did}&cid=${cid}&search=${ts}">${i}</a></li>
                                </c:forEach>
                        </ul>





                    </div>

                </div>
                <!--            <a href="#"><button type="button" class="btn btn-primary">Back to home</button>-->
            </div>


    </body>


</html>
