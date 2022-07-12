<%-- 
    Document   : Package
    Created on : Jun 26, 2022, 2:44:16 AM
    Author     : PREDATOR
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-10 text-primary">
                                    <h2>Price<b>Package</b></h2>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-success" href="pricepackage?do=add&sid=${requestScope.sid}">Add New Package</a>

                                </div>

                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover table-sm table-bordered">
                        <thead >
                            <tr>

                                <th>ID</th>
                                <th>Name</th>
                                <th>Access Duration (in months)</th>
                                <th>Status</th>
                                <th>List Price</th>
                                <th>Sale Price</th>
                                <th>Description</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        <%int num = 1;%>
                        <c:forEach items="${listPP}" var="o">

                            <tr>
                                <td>${o.id}</td>
                                <td>${o.name}</td>
                                <td>${o.duration} </td>

                                <c:if test="${o.status == 1 }">
                                    <td>Active</td>

                                </c:if>
                                <c:if test="${o.status == 0}">
                                    <td>Inactive</td>

                                </c:if>

                                <td>$${o.list_price} </td>
                                <td>$${o.sale_price} </td>
                                <td>${o.description} </td>
                                <td><a class="btn btn-danger" href="pricepackage?do=edit&id=${o.id}&sid=${requestScope.sid}">Edit</a> 
                                </td>

                            </tr>
                            <% num++;%>
                        </c:forEach>
                    </tbody>
                </table>
                        <input type="hidden" name="sid" value="${requestScope.sid}">
                <c:set var="index" value="${requestScope.index}"/>                

                <ul class="pagination">
                    <c:forEach begin="1" end="${requestScope.num}" var="i">
                        <li class="page-item ${i==index?"active":""}"><a class="page-link" href="pricepackage?index=${i}&sid=${requestScope.sid}">${i}</a></li>
                        </c:forEach>
                </ul>


            </div>
            <!--            <a href="#"><button type="button" class="btn btn-primary">Back to home</button>-->
        </div>


    </body>


</html>

