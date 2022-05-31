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
        <link rel="stylesheet" href="./css/index.css">
        <title>Home Page</title>
    </head>
    <body class="d-flex flex-column min-vh-100">
        <nav class="navbar">
            <div class="brand">Quiz Online</div>
            <div class="search">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="search" placeholder="Search anything...">
            </div>
            <div class="auth">
                Hello ${sessionScope.acc.fullname}
                <c:if test="${sessionScope.acc != null}">
                    <a href="logout">Logout</a>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <a href="./login.jsp">Login</a>
                </c:if>
                <a href="./register.jsp">Register</a>
                <a href="./profile.jsp">Profile</a>
            </div>
        </nav>



        <!-- hot posts mới -->
        <div class="container text-center my-3">
            <h1 class="font-weight-light">hot posts</h1>


            <div class="row mx-auto my-auto justify-content-center">
                <div id="recipeCarousel" class="carousel slide" data-bs-ride="carousel">


                    <div class="carousel-inner" role="listbox">


                        <!-- thành phần -->
                        <div class="carousel-item active">
                            <div class="col-md-3">
                                <div class="wrapper">
                                    <div class="img">
                                        <img class="img-responsive"
                                             src="data:image/jpeg;base64,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"
                                             alt="">
                                    </div>
                                    <a href="./blogs.html">
                                        <div class="title">
                                            <h2>Blog Title</h2>
                                            <p class="blog-biref">Here is a biref</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <c:forEach items="${requestScope.loadLatestPost}" var="p"> 
                            <div class="carousel-item">
                                <div class="col-md-3">
                                    <div class="wrapper">
                                        <div class="img">
                                            <img class="img-responsive"
                                                 src="${p.thumbnail}"
                                                 alt="">
                                        </div>
                                        <a href="./blogs.html">
                                            <div class="title">
                                                <h2>${p.post_title}</h2>
                                                <p class="blog-biref">${p.biref}</p>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div> 
                        </c:forEach>







                    </div>
                    <a class="carousel-control-prev bg-transparent w-aut" href="#recipeCarousel" role="button" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    </a>
                    <a class="carousel-control-next bg-transparent w-aut" href="#recipeCarousel" role="button" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    </a>
                </div>
            </div>
            <!-- <h5 class="mt-2 fw-light">advances one slide at a time</h5> -->
        </div>






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
    </div>
</div>
<!--view more hiển thị listSubject-->
<a class="btn btn-outline-primary" href="listsubject" role="button">View More</a>

<!--blog show-->

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>Blog</h1>
        </div>
    </div>
    <div class="row">
<!--        <div class="col-md-3">
            <div class="wrapper">
                <div class="img">
                    <img class="img-responsive"
                         src="data:image/jpeg;base64,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"
                         alt="">
                </div>
                <a href="./blogs.html">
                    <div class="title">
                        <h2></h2>
                        <p class="blog-biref">Here is a biref</p>
                    </div>
                </a>
            </div>
        </div>-->



        <c:forEach items="${requestScope.loadAllPost}" var="p">
            <div class="col-md-3">
                <div class="wrapper">
                    <div class="img">
                        <img class="img-responsive"
                             src="${p.thumbnail}"
                             alt="">
                    </div>
                    <a href="./blogs.html">
                        <div class="title">
                            <h2>${p.post_title}</h2>
                            <p class="blog-biref">${p.biref}</p>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>

        
        
        <!--view more hiển thị listBlogs-->
        <a class="btn btn-outline-primary" href="#" role="button">View More</a>

        <footer class="footer text-center mt-auto"">
            <p>@Copy right of ..</p>
        </footer>
        </body>
        <script src="./js/index.js"></script>
        </html>
