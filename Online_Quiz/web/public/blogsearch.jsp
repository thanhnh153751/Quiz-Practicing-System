<%-- 
    Document   : blogsearch
    Created on : May 29, 2022, 9:38:02 PM
    Author     : hongd
--%>

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
        <nav class="navbar">
            <div class="brand">Quiz Online</div>
            <div class="search">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="search" placeholder="Search anything...">
            </div>
            <div class="auth">
                <a href="./login.html">Login</a>
                <a href="./register.html">Register</a>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="blog-list">
                        <h1 class="text-center">Result</h1>

                        <form method="get" action="postsearch" class="search-box">
                            <input type="text" placeholder="Search blogs">
                            <button>Search</button>
                        </form>

                        <div class="post-item">
                            <a href="">
                                <h1>Post title</h1>
                                <p>biref</p>
                            </a>
                        </div>

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
    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <script src="../js/slick/slick.min.js"></script>
    <script src="../js/index.js"></script>
</html>
