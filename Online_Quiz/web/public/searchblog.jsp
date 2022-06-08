<%-- 
    Document   : searchblog
    Created on : May 31, 2022, 11:40:07 AM
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
        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/index.css">
        <link rel="stylesheet" href="../css/bloglist.css">
        <!--<script src="../js/index.js"></script>-->
        <title>blogs</title>
    </head>

    <body class="d-flex flex-column min-vh-100">
        <jsp:include page="../common/header.jsp"></jsp:include>

            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="blog-list">
                            <h1 class="text-center">Result</h1>

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
                        <c:if test="${!postlist.isEmpty()}">
                            <c:forEach items="${postlist}" var="pst">
                                <div class="post-item">
                                    <a href="<c:url value="/public/postdetails?id=${pst.id}"/>">
                                        <h1>${pst.post_title}</h1>
                                        <p>${pst.biref}</p>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${postlist.isEmpty()}">

                            <h2>Not Found</h2>

                        </c:if>


                    </div>
                </div>
                <div class="col-md-12">
                    <nav aria-label="...">
                        <ul class="pagination">
                            <li class="page-item disabled">
                                <span class="page-link">Previous</span>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active">
                                <span class="page-link">2</span>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
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