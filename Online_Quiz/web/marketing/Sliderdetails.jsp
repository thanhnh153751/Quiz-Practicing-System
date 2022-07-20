<%-- 
    Document   : postdetails
    Created on : Jun 11, 2022, 6:41:06 PM
    Author     : PREDATOR
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="../css/slick/slick.css">
        <link rel="stylesheet" href="../css/index.css">
        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/sidenav.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../css/ManageListSubject.css">
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../common/header.jsp"></jsp:include>
            <div id="main">

                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <a class="activenav" href="/Online_Quiz/marketing/postdetails">List Of Post</a>

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
                                                        <li class="breadcrumb-item">List Of Post</li>
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="#">Post Details</a>
                                                        </li>

                                                    </ol>
                                                </nav>
                                            </div>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <form action="/Online_Quiz/marketing/sliderdetail" method="post">

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="container">
                                        <div class="card">
                                            <div class="row">
                                                <input type="hidden" name="id" class="btn btn-info" value="${id}">
                                            
                                                <aside class="col-sm-5 border-right">
                                                    <article class="gallery-wrap card-body p-20"> 
                                                        <div class="img-big-wrap">
                                                            <div class="img-responsive"><img src="${listD.image}"></a></div>
                                                    </div>                                                     
                                                </article> 
                                            </aside>
                                            <aside class="col-sm-7">
                                                <article class="card-body p-5">                                           
                                                    <br>
                                                    <br>
                                                    
                                                    <dl class="item-property">
                                                        <dt>Title</dt>
                                                        <dd><p>
                                                                ${listD.title}
                                                            </p></dd>
                                                    </dl>

                                                    <dl class="item-property">
                                                        <dt>Back Link</dt>
                                                        <dd>
                                                            <a href="${listD.backlink}">${listD.backlink}</a>
                                                            </dd>
                                                    </dl>

                                                    <dl class="item-property">
                                                        <dt>Status</dt>
                                                        <dd><p>
                                                                <c:if test="${listD.status == true }">
                                                            <td>Active</td>

                                                        </c:if>
                                                        <c:if test="${listD.status == false}">
                                                            <td>Inactive</td>

                                                        </c:if>
                                                        </p></dd>
                                                    </dl>
                                                    <dl class="item-property">
                                                        <dt>Note</dt>
                                                        <dd><p>
                                                                ${listD.note}
                                                            </p></dd>
                                                    </dl>
                                                    <hr>
                                                    
                                                </article> <!-- card-body.// -->
                                            </aside> <!-- col.// -->
                                        </div> <!-- row.// -->
                                    </div> <!-- card.// -->


                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

            <br>
            <br>
            <br>
            <br>
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
