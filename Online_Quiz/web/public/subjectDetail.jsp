<%-- 
    Document   : subjectDetail
    Created on : May 31, 2022, 3:02:47 PM
    Author     : THANH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="../css/nav.css">

        <link rel="stylesheet" href="./css/subjectDetail.css">
        <!--<script src="./js/index.js"></script>-->
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../common/header.jsp"></jsp:include>

            <div class="container">


                <h1 class="center"><a href="#">Name Course</a></h1>


                <div class="row">
                    <div class="col-10">

                        <div class="row list-courses">

                        <c:set var="s" value="${requestScope.subject}"/>
                        <div class="col-xs-12 col-sm-6 col-lg-3 mb-4">
                            <article class="course-item grid-style">
                                <a title="title name" href="#" class="wrap-course-item">
                                    <div class="course-thumb ">
                                        <img class="img-fluid" src="${s.thumbnail}" alt="name courses">
                                    </div>

                                    <div class="view-content">
                                        <h3 class="course-title">${s.title}</h3>
                                        <p>${s.description}</p>
                                    </div>
                                    <hr>
                                    <div class="course-info">
                                        <span>${s.origin_price} $/Full</span>
                                        <span class="btn btn-outline-primary">Register</span>
                                    </div>
                                </a>
                            </article>
                        </div>



                    </div>

                </div>
                <div class="col-2 sticky">
                    <%@include file="/sider.jsp" %>
                </div>

            </div>

        </div>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>
    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <script src="../js/slick/slick.min.js"></script>
    <script src="../js/index.js"></script>
</html>
