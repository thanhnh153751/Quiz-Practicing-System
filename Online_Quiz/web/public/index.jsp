<%-- 
    Document   : index
    Created on : May 26, 2022, 1:17:17 AM
    Author     : THANH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../css/index.css">
        <title>Home Page</title>
    </head>
    <body class="d-flex flex-column min-vh-100">
        <jsp:include page="../common/header.jsp"></jsp:include>
        
            

            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="header">
                            <h2>Hot Post</h2>
                        </div>
                        <div class="slider">
                        <c:forEach items="${requestScope.loadLatestPost}" var="p">
                            <div class="card slider-item col-md-3" style="width: 16rem;">
                                <a href="">
                                    <img src="${p.thumbnail}"
                                         class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h6 class="card-title">${p.post_title}</h6>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- <h5 class="mt-2 fw-light">advances one slide at a time</h5> -->

            <!-- Course show -->
            <div class="row">
                <div class="col-md-12">
                    <h1>Course</h1>
                </div>
            </div>
            <div class="row">

                <!--                <div class="col-md-3">
                                    <div class="wrapper">
                                        <div class="img">
                                            <img class="img-responsive"
                                                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7S1meIBhm9Sl8CK8IWQkXc0jRu0ylN6lqLg&usqp=CAU"
                                                alt="">
                                        </div>
                                        <div class="course-title">
                                            <a href="listSubject.html"><h3>Course Name</h3></a>
                                        </div>
                                    </div>
                                </div>-->

                <c:forEach items="${requestScope.subjectList}" var="s">
                    <div class="col-md-3">
                        <div class="wrapper">
                            <div class="img">
                                <img class="img-responsive"
                                     src="${s.thumbnail}"
                                     alt="">
                            </div>
                            <div class="course-title">
                                <h3>${s.title}</h3>
                            </div>
                        </div>
                    </div>
                </c:forEach>




            </div>

            <a class="btn btn-outline-primary" href="<c:url value="/public/listsubject"/>" role="button">View More</a>

            <div class="row">
                <div class="col-md-12">
                    <h1>Blog</h1>
                </div>
            </div>
            <div class="row">



                <c:forEach items="${requestScope.loadAllPost}" var="p">
                    <div class="col-md-3">
                        <div class="wrapper hotpost">
                            <div class="img">
                                <img class="img-responsive"
                                     src="${p.thumbnail}"
                                     alt="">
                            </div>
                            <a href="<c:url value="/postdetails?id=${p.id}"/>">
                                <div class="title">
                                    <h2>${p.post_title}</h2>
                                    <br/>
                                    <p class="datePost" style="float: right; margin-top: -11px; font-size:12px; ">${p.dateFormat}</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <a class="btn btn-outline-primary" href="<c:url value="/public/bloglist"/>" role="button">View More</a>

        </div>



    </div>
</div>
<!--view more hiển thị listSubject-->


<!--blog show-->

<!--view more hiển thị listBlogs-->

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
<script src="../js/index.js"></script>
</html>
