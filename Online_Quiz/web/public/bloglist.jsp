<%-- 
    Document   : bloglist
    Created on : May 26, 2022, 11:32:18 AM
    Author     : hongd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="../css/slick/slick.css">
        <link rel="stylesheet" href="../css/index.css">
        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/sidenav.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../css/bloglist.css">

        <title>blogs
        </title>
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
                                                        <li class="breadcrumb-item">Blog list</li>
                                                        <li class="breadcrumb-item">
                                                            
                                                        </li>
                                                    </ol>
                                                </nav>
                                            </div>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>
                <div class="row">
                    <div class="col-md-12">
                        <div class="blog-list">
                            <h1 class="text-center text-primary"><b>Blog list</b></h1>

                            <form action="/Online_Quiz/public/blogsearch">
                                <input name="searchname" type="text" placeholder="Search blogs">

                                <select  id="" name="category">
                                    <option value="">Blog Category</option>
                                <c:forEach items="${listc}" var="lst">
                                    <option value="${lst.id}">${lst.name}</option>
                                </c:forEach>
                            </select>
                            <button>Search</button>
                        </form>

                        <c:forEach items="${post}" var="pst">
                            <div class="post-item">
                                <a href="<c:url value="/public/postdetails?id=${pst.id}"/>">
                                    <h1>${pst.post_title}</h1>
                                    <p>${pst.biref}</p>
                                </a>
                            </div>
                        </c:forEach>

                    </div>
                </div>
                <div class="col-md-12">
                    <nav aria-label="...">
                        <ul class="pagination">
                        <c:forEach begin="1" end="${lastP}" var="i">
                            <li class="page-item"><a class="page-link" href="<c:url value="/public/bloglist?indexP=${i}"/>">${i}</a></li>
                        </c:forEach>
<!--                            <li class="page-item disabled">
                                <span class="page-link">Previous</span>
                            </li>
                            
                            <li class="page-item active">
                                <span class="page-link">2</span>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>-->
                        </ul>
                    </nav>
                </div>

            </div>
        </div>
                </div>
<br>
                       
                        
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
