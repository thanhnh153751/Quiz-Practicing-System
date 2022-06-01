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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/index.css">
        <link rel="stylesheet" href="../css/bloglist.css">
        <script src="../js/index.js"></script>
        <title>blogs
        </title>
    </head>

    <body class="d-flex flex-column min-vh-100">
        <jsp:include page="../common/header.jsp"></jsp:include> 
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="blog-list">
                        <h1 class="text-center">Blog list</h1>

                        <form action="blogsearch">
                            <input name="searchname" type="text" placeholder="Search blogs">

                            <select  id="">
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




        <footer class="footer text-center mt-auto">
            <p>@Copy right of ..</p>
        </footer>

    </body>

</html>
