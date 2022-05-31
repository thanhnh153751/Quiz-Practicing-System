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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="./css/subjectDetail.css">
        <script src="./js/index.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">


            <h1 class="center"><a href="#">Name Course</a></h1>


            <div class="row">
                <div class="col-10">
                    
                    <div class="row list-courses">

                        <c:set var="s" value="${requestScope.subject}"/>
                            <div class="col-xs-12 col-sm-6 col-lg-3 mb-4">
                                <article class="course-item grid-style">
                                    <a title="title name" href="listLessions.html" class="wrap-course-item">
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
                <%@include file="sider.jsp" %>
                </div>

            </div>

        </div>
    </body>
</html>
