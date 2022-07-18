<%-- 
    Document   : index2
    Created on : Jun 6, 2022, 8:55:29 PM
    Author     : hongd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="../css/slick/slick.css">
        <link rel="stylesheet" href="../css/index.css">
        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/sidenav.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />




        <title>JSP Page</title>
    </head>
    <body class="d-flex flex-column min-vh-100">
        <jsp:include page="../common/header.jsp"></jsp:include>

            <div id="main">
                <div id="mySidenav" class="sidenav">
                <c:forEach items="${requestScope.listrole}" var="role">
                    <c:if test="${role.permission_id == 3 && role.licensed == true}">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <a href="#">My Registrations</a>
                    <a href="/Online_Quiz/common/practicesList">Practices List</a>
                        
                    </c:if>
                </c:forEach>

            </div>




            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="header">

                            <div id="slider_1" class="slider">
                            <c:forEach items="${requestScope.loadLatestPost}" var="p">
                                <div class="card slider-item-1 col-md-3" style="width: 16rem;">
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
                                    <div class="card slider-item-1 col-md-3" style="width: 16rem;">
                                        <a href="subjectdetail?ids=${p.id}">
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
                                <h3 class="">Latest Posts</h3>
                            <div class="overflow-auto tag-late" id="lapost">
                                <c:forEach items="${requestScope.loadLatestPost}" var="p">
                                    <div class="card card-late slider-item-latest col-md-3" style="width: 16.5rem; height: 15rem;">
                                        <a href="">
                                            <img src="${p.thumbnail}"
                                                 class="card-img-top img-responsive" alt="...">
                                            <div class="card-body slider-item-body-2">
                                                <h6 class="card-title">${p.post_title}</h6>
                                            </div>
                                        </a>
                                    </div>
                                            <br>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="col-9"> 
                            <div class="hotPost">
                            <h3>Hot Post</h3>
                            <div id="" class="slider_2 mb-5">
                                <c:forEach items="${requestScope.loadHotPost}" var="p">
                                    <div class="card slider-item col-md-3" style="width: 16rem; height: 15rem;">
                                        <a href="">
                                            <img src="${p.thumbnail}"
                                                 class="card-img-top img-responsive" alt="...">
                                            <div class="card-body slider-item-body-2">
                                                <h6 class="card-title">${p.post_title}</h6>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>

                            </div>
                            </div>
                            
                            <div class="" id="featured-subjects">
                            <h3>featured subjects</h3>
                            <div id="" class="slider_2">
                                <c:forEach items="${requestScope.subjectLast}" var="p">
                                    <div class="card slider-item col-md-3" style="width: 16rem;height: 15rem;">
                                        <a href="subjectdetail?ids=${p.id}">
                                            <img src="${p.thumbnail}"
                                                 class="card-img-top img-responsive" alt="...">
                                            <div class="card-body slider-item-body-2">
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
            </div>

            <div class="row">
<!--                <div class="col-md-12">
                    <div class="header">
                        <h2>Course</h2>
                    </div>
                </div>-->
                
                <h3 class="course-tag">Course</h3>
                <div class="row course-tag-home" >
                <c:forEach items="${requestScope.subjectList}" var="s">
                    
                    <div class="col-md-3">
                        <div class="card course-item" style="width: 18rem;">
                            <a href="subjectdetail?ids=${s.id}">
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
                
               
                <div class="col-md-12 d-flex justify-content-center show-more-btn mt-5">
                    <a href="<c:url value="/public/listsubject"/>" type="button" class="btn btn-outline-primary">Show more</a>
                </div>
            </div>


            <div class="row">
                
                <h3 class="course-tag">Blog</h3>
                <div class="row course-tag-home" >
                <c:forEach items="${requestScope.loadAllPost}" var="p">
                    <div class="col-md-3">
                        <div class="card blog-item" style="width: 18rem;" >
                            <a href="<c:url value="/public/postdetails?id=${p.id}"/>">
                                <div class="img-warper">
                                    <img src="${p.thumbnail}" class="card-img-top " alt="...">
                                </div>
                                <div class="blog-card-body ">
                                    <h6 class="card-title">${p.post_title}</h6>
                                  
                                    <p class="date-update">${p.update_date}</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
                </div>
                <div class="col-md-12 d-flex justify-content-center show-more-btn mt-5">
                    <a href="<c:url value="/public/bloglist"/>" type="button" class="btn btn-outline-primary">Show more</a>
                </div>
            </div>
        </div>
                <jsp:include page="../common/footer.jsp"></jsp:include>
            </div>

        
    </body>
    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <script src="../js/slick/slick.min.js"></script>
    <script src="../js/index.js"></script>
    <script src="../js/sidenav.js"></script>

</html>
