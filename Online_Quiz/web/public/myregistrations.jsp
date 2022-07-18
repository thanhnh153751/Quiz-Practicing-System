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

                        <br>

                        <form action="/Online_Quiz/public/searchboxresgistration" method="get" class="form-inline my-2 my-lg-0">

                            <div class="h6">Search by SubjectName: </div>


                            <div class="input-group input-group-sm">
                                <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit">Search</button>
                            </div>
                        </div>

                    </form>



                </div>

                <div class="col-sm-9"

                     <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-10 text-primary">
                                    <h2>My<b>Registrations</b></h2>
                                </div>
                                <div class="col-sm-2">


                                </div>
                            </div>
                        </div>
                        <table class="table table-hover">
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

            <jsp:include page="../common/social_sidebar.jsp"></jsp:include>  

            <jsp:include page="../common/footer.jsp"></jsp:include>



    </body>
</html>

