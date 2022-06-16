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
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="../css/slick/slick.css">
        <link rel="stylesheet" href="../css/index.css">
        <link rel="stylesheet" href="../css/nav.css">



        <title>JSP Page</title>
    </head>
    <body class="d-flex flex-column min-vh-100">
        <jsp:include page="../common/header.jsp"></jsp:include>



            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="header">

                            <div id="slider_1" class="slider">
                            <c:forEach items="${requestScope.loadLatestPost}" var="p">
                                <div class="card slider-item col-md-3" style="width: 16rem;">
                                    <a href="">
                                        <img src="${p.thumbnail}"
                                             class="card-img-top img-responsive" alt="...">
                                        <div class="card-body slider-item-body">
                                            <h6 class="card-title">${p.post_title}</h6>
                                        </div>
                                    </a>
                                </div>

                            </c:forEach>
                            <c:forEach items="${requestScope.subjectLast}" var="p">
                                    <div class="card slider-item col-md-3" style="width: 16rem;">
                                        <a href="">
                                            <img src="${p.thumbnail}"
                                                 class="card-img-top img-responsive" alt="...">
                                            <div class="card-body slider-item-body">
                                                <h6 class="card-title">${p.title}</h6>
                                            </div>
                                        </a>
                                    </div>
                            </c:forEach>
                        </div> 
                    </div>
                    <!--static link-->    
                    <div class="so_si">
                        <jsp:include page="../common/social_sidebar.jsp"></jsp:include>  
                    </div>


                        <div class="row combo_head">

                            <div class="col-3 lastPost">
                                <h2>Latest Posts</h2>
                                <div class="overflow-auto">
                                <c:forEach items="${requestScope.loadLatestPost}" var="p">
                                    <div class="card slider-item col-md-3" style="width: 16rem;">
                                        <a href="">
                                            <img src="${p.thumbnail}"
                                                 class="card-img-top img-responsive" alt="...">
                                            <div class="card-body slider-item-body">
                                                <h6 class="card-title">${p.post_title}</h6>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="col-9">    
                            <h2>Hot Post</h2>
                            <div id="slider_2" class="slider_2">
                                <c:forEach items="${requestScope.loadHotPost}" var="p">
                                    <div class="card slider-item col-md-3" style="width: 16rem;">
                                        <a href="">
                                            <img src="${p.thumbnail}"
                                                 class="card-img-top img-responsive" alt="...">
                                            <div class="card-body slider-item-body">
                                                <h6 class="card-title">${p.post_title}</h6>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>

                            </div>

                            <h2>featured subjects</h2>
                            <div id="slider_2" class="slider_2">
                                <c:forEach items="${requestScope.subjectLast}" var="p">
                                    <div class="card slider-item col-md-3" style="width: 16rem;">
                                        <a href="">
                                            <img src="${p.thumbnail}"
                                                 class="card-img-top img-responsive" alt="...">
                                            <div class="card-body slider-item-body">
                                                <h6 class="card-title">${p.title}</h6>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>



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
                        <div class="card course-item" style="width: 18rem;">
                            <a href="">
                                <img src="${s.thumbnail}"
                                     class="card-img-top" alt="...">
                                <div class="course-card-body">
                                    <h6 class="card-title">${s.title}</h6>

                                </div>
                            </a>
                            <!--tag line-->      
                            <div class="card-body">
                                <div data-type="tagline">${s.tagline}</div>
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

        <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>

    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <script src="../js/slick/slick.min.js"></script>
    <script src="../js/index.js"></script>

</html>
