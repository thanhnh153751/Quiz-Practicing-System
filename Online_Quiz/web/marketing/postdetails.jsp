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
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="../css/postdetails.css" rel="stylesheet" type="text/css"/>
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
        <form action="/marketing/postdetails" method="post">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="container">
                            <div class="card">
                                <div class="row">
                                    <aside class="col-sm-5 border-right">
                                        <article class="gallery-wrap"> 
                                            <div class="img-big-wrap">
                                                <div><img src="${details.thumbnail}"></a></div>
                                            </div> <!-- slider-product.// -->
                                            <div class="img-small-wrap">
                                            </div> <!-- slider-nav.// -->
                                        </article> <!-- gallery-wrap .end// -->
                                    </aside>
                                    <aside class="col-sm-7">
                                        <article class="card-body p-5">
                                            <dl class="item-property">
                                                <dt>Title</dt>
                                                <dd><p>
                                                        ${details.post_title}
                                                    </p></dd>
                                            </dl>

                                            <dl class="item-property">
                                                <dt>Brief information</dt>
                                                <dd><p>
                                                        ${details.biref}
                                                    </p></dd>
                                            </dl>
                                            <dl class="item-property">
                                                <dt>Description</dt>
                                                <dd><p>
                                                        ${details.details}
                                                    </p></dd>
                                            </dl>
                                            <dl class="item-property">
                                                <dt>Status</dt>
                                                <dd><p>
                                                <c:if test="${details.status == 1 }">
                                                    <td>Active</td>

                                                </c:if>
                                                <c:if test="${details.status == 0}">
                                                    <td>Inactive</td>

                                                </c:if>
                                                </p></dd>
                                            </dl>
                                            <hr>
                                            <a href="/Online_Quiz/marketing/postdetails?do=add"> Input </a>
                                            <a href="/Online_Quiz/marketing/postdetails?do=edit&id=${details.id}"> Edit </a>
                                        </article> <!-- card-body.// -->
                                    </aside> <!-- col.// -->
                                </div> <!-- row.// -->
                            </div> <!-- card.// -->


                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
