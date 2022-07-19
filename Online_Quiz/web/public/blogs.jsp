<%-- 
    Document   : blog
    Created on : May 26, 2022, 11:31:01 AM
    Author     : hongd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../css/slick/slick.css">
<!--    <link rel="stylesheet" href="../css/index.css">-->
    <link rel="stylesheet" href="../css/nav.css">
    <link rel="stylesheet" href="../css/sidenav.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
          integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/blogs.css">
    <!--<script src="../js/index.js"></script>-->
    <title>Blogs</title>
</head>

<body class="d-flex flex-column min-vh-100">
    <jsp:include page="../common/header.jsp"></jsp:include>
        <div id="main">

            <div id="mySidenav" class="sidenav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <a class="activenav" href="/Online_Quiz/public/bloglist">Blog list</a>


            </div>
            <div class="container"style="padding-top: 50px">
                <div class="row">

                    <header id="page-header" class="row" style="margin-top: -15px; padding-left: -30px">
                        <div class="col-12 pt-3 pb-3" >
                            <div class="card ">
                                <div class="card-body " style="margin-left: 20px">
                                    <div class="d-flex">
                                        <div class="mr-auto">
                                            <div class="page-context-header"><div class="page-header-headings "><h1 style="color: rgb(35, 35, 201)">Quiz<b> Online</b></h1></div></div>
                                        </div>                                       
                                    </div>
                                    <div class="d-flex flex-wrap">
                                        <div id="page-navbar">
                                            <nav role="navigation" aria-label="Breadcrumb trail">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item">
                                                        <a style="text-decoration: none" href="http://localhost:8080/Online_Quiz/public/home">Home</a>
                                                    </li>
                                                    <li class="breadcrumb-item">
                                                        <a style="text-decoration: none" href="http://localhost:8080/Online_Quiz/public/bloglist">Blog list</a>
                                                        </li>
                                                    <li class="breadcrumb-item">
                                                        <a style="text-decoration: none" href="#">Blog Details</a>

                                                    </li>
                                                </ol>
                                            </nav>
                                        </div>                                          
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <div class="blog-content">
                            <h1>${details.post_title}</h1>
                        <p>
                            ${details.details}
                        </p>
                    </div>
                </div>

                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">

                    <div class="blog-slider">
                        <h3 class="text-center">Maybe you know?</h3>
                        <form action="/Online_Quiz/public/blogsearch" class="navigation">
                            <div class="blog-category">
                                <select id="cars" name="category">
                                    <option  value="">Blog Category</option>
                                    <c:forEach items="${listc}" var="lst">
                                        <option value="${lst.id}">${lst.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="blog-search">
                                <input name="searchname" type="text" placeholder="Search blogs">
                            </div>
                            <button class="navigation-search" >Search</button>
                        </form>

                        <c:forEach items="${post}" var="list">
                            <div class="blog-item">
                                <a href="<c:url value="/public/postdetails?id=${list.id}"/>">
                                    <div class="blog-item-title">
                                        <h2>${list.post_title}</h2>
                                    </div>

                                    <div class="blog-item-img">
                                        <img class="img-responsive " src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXib_BZd2H19aew7ZhQcRU_eeOiWvstptgwg&usqp=CAU"
                                             alt="">
                                    </div>


                                    <div class="blog-item-biref">
                                        <p>${list.biref}</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>



                    </div>
                </div>
            </div>
        </div>



        <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>

    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <script src="../js/slick/slick.min.js"></script>
    <script src="../js/index.js"></script>
    <script src="../js/sidenav.js"></script>

</body>
</html>