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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/blogs.css">
    <script src="../js/index.js"></script>
    <title>blogs
    </title>
</head>

<body class="d-flex flex-column min-vh-100">
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div class="container">
        <div class="row">
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
                        
                        <div class="blog-search">
                            <input name="searchname" type="text" placeholder="Search blogs">
                        </div>
                        
                        <div class="blog-category">
                            <select name="category" id="cars">
                                <option value="">Blog Category</option>
                                <c:forEach items="${listc}" var="lst">
                                    <option value="${lst.id}">${lst.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button class="navigation-search">Search</button>
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



    <footer class="footer text-center mt-auto">
        <p>@Copy right of ..</p>
    </footer>

</body>

</html>