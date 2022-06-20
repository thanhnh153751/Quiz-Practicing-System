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
            <div class="container">
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



    </body>


</html>
