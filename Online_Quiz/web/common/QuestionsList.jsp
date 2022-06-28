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
                            <option value="-1"${-1 == status ?"selected":""}>--------------------Status------------------</option>
                            <option value="1" ${1 == status ?"selected":""}>---------------------Enable-----------------</option>
                            <option value="0" ${0 == status ?"selected":""}>---------------------Disable----------------</option>
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
                                    <th>Action</th>
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
                                        <td>${o.status} </td>                                  
                                        <td><a href="#" class="btn btn-danger" data-toggle="modal"><span>Edit</span></a></td>
                                    </tr>
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
                        


    </body>



</html>
