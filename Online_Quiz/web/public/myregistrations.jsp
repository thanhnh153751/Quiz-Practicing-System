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
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <link href="../css/myregistrations.css" rel="stylesheet">
    </head>
    <body>

        <div class="card">
            <!--<form action="/Online_Quiz/public/myregistrations" method="post">-->
                <div class="row">
                    <div class="col-md-12 cart">
                        <div class="title">
                            <div class="row">
                                <div class="col-md-8"><h4><b>Registration</b></h4></div>
                                <div class="col-md-4 search-box"> 
                                <form action="/Online_Quiz/public/searchboxresgistration" method="get" class="form-inline my-2 my-lg-0">
                                    <div class="input-group input-group-sm">
                                        <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                                        <div class="input-group-append">
                                            <button type="submit">Search</button>
                                        </div>
                                    </div>
                                </form>
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

                                        <div class="back-to-shop"><a href="/Online_Quiz/public/listsubject">&leftarrow;</a><span class="text-muted">Back to Subject Register</span></div>

                    </div>



                    <!--                    <div class="col-md-4 summary">
                                            <div><h5><b>Summary</b></h5></div>
                                            <hr>
                                            <div class="row">
                                                <div class="col" style="padding-left:0;">ITEMS 3</div>
                                                <div class="col text-right">&dollar; 132.00</div>
                                            </div>
                                            <form>
                                                <p>SHIPPING</p>
                                                <select><option class="text-muted">Standard-Delivery- &euro;5.00</option></select>
                                                <p>GIVE CODE</p>
                                                <input id="code" placeholder="Enter your code">
                                            </form>
                                            <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                                                <div class="col">TOTAL PRICE</div>
                                                <div class="col text-right">&dollar; 137.00</div>
                                            </div>
                                            <button class="btn">CHECKOUT</button>
                                        </div>-->
                </div>
            <!--</form>-->
        </div>
                                        <div class="so_si">
                        <jsp:include page="../common/social_sidebar.jsp"></jsp:include>  
                    </div>


    </body>
</html>

