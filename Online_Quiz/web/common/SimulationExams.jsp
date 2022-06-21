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
            <div class="container"style="padding-top: 50px">
                <div class="row">
                    <div class="col-sm-3 filter">
                        <div class="text-primary text-center h3">Filter</div>
                        <br>
                        <form action="/Online_Quiz/common/simulationexams">
                            <select name="did" onchange="this.form.submit()">
                                <option value="-1">----------------Subject-----------------</option>
                            <c:forEach items="${listbysubject}" var="D">
                                <option value="${D.id}" ${D.id == did ?"selected":""}>${D.title}</option>
                            </c:forEach>
                        </select>
                            
                        <select name="lid" onchange="this.form.submit()">
                            <option value="-1">------------------Level------------------</option>
                            <c:forEach items="${listbylevel}" var="D">
                                <option value="${D.id}" ${D.id == lid ?"selected":""}>${D.level}</option>
                            </c:forEach>
                        </select>
                        <br>


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
                        <table class="table table-striped table-hover table-sm table-bordered">
                            <thead class="table-success" >
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
                                <%int num = 1;%>
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
                                    <% num++;%>
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


    </body>


</html>
