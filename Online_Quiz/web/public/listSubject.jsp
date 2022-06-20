<%-- 
    Document   : listSubject
    Created on : May 26, 2022, 1:51:44 PM
    Author     : THANH
--%>

<%@page import="Model.SubjectCategory"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../css/listSubject.css">
        <link rel="stylesheet" href="../css/nav.css">

        
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header">
            <jsp:include page="../common/header.jsp"></jsp:include>
            </div>

            <div class="container">


                <h1 class="center"><a href="#">Name Course</a></h1>


                <div class="row">
                    <div class="col-10">
                        <div class="row list-courses">

                        <c:forEach items="${requestScope.listSubject}" var="s">
                            <div class=" col-xs-12 col-sm-6 col-lg-3 mb-4 courseInfor">
                                <article class="course-item grid-style p-2">
                                    <a title="title name" href="subjectdetail?ids=${s.id}" class="wrap-course-item">
                                        <div class="course-thumb ">
                                            <img class="img-fluid" src="${s.thumbnail}" alt="name courses">
                                        </div>

                                        <div class="view-content">
                                            <h3 class="course-title">${s.title}</h3>
                                            <div class="taglineSbject">
                                                <div class="tag" data-type="tagline">${s.tagline}</div>
                                            </div>



                                        </div>
                                        <hr>
                                        <div class="course-info d-flex justify-content-between">
                                            <div>
                                                <fmt:setLocale value = "en_US"/>
                                                <c:if test="${s.sale_price != 0}">
                                                    <span class="text-decoration-line-through"><fmt:formatNumber maxIntegerDigits = "4" value="${s.list_price}" type="currency" currencySymbol="$" /></span>
                                                    &nbsp;

                                                    <span style="color: red;"> 
                                                        <fmt:formatNumber value = "${s.sale_price}" type = "currency"/></span>
                                                    </c:if>
                                                    <c:if test="${s.sale_price == 0}"><span><fmt:formatNumber maxIntegerDigits = "4" value="${s.list_price}" type="currency" currencySymbol="$"/></span></c:if>
                                                </div>
                                                <div>
                                                    <span class="btn btn-outline-primary"  onclick="loadData()" >Register</span>
                                                </div>
                                            </div>
                                        </a>
                                    </article>
                                </div>
                        </c:forEach>              

                        <div class="so_si">
                            <jsp:include page="../common/social_sidebar.jsp"></jsp:include>  
                            </div>
                        </div>

                    </div>
                    <!--include search box-->
                    <div class="col-2 sticky search-box-container">
                    <jsp:include page="../common/searchboxSubject.jsp"></jsp:include>
                    </div>

                </div>

            </div>
            <br/>
            <div class="paginatedly">
            <c:set var="page" value="${requestScope.page}"/>
            <div class="pagination">





                <!--phân trang mới-->
                <ul class="pagination">
                    <c:if test="${requestScope.key == null && requestScope.cidF == null && requestScope.featured == null}">
                        <c:if test="${page > 1}">
                            <li class="page-item disabled"><a href="listsubject?index=${page -1}">Pre</a></li>
                            </c:if>
                            <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                            <a class="${i==page?"active":""}" href="listsubject?index=${i}">${i}</a>
                        </c:forEach>
                        <c:if test="${page < endPage}">
                            <li class="page-item disabled"><a href="listsubject?index=${page +1}">Next</a></li>
                            </c:if>
                        </c:if>   
                    <!--th2-->   
                    <c:if test="${requestScope.key != null || requestScope.cidF != null || requestScope.featured != null}">
                        <c:if test="${page > 1}">
                            <li class="page-item disabled"><a onclick="setPage(${page-1})">Pre</a></li>
                            </c:if>
                            <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                            <a class="${i==page?"active":""}" onclick="setPage(${i})">${i}</a>
                        </c:forEach>
                        <c:if test="${page < endPage}">
                            <li class="page-item disabled"><a onclick="setPage(${page+1})">Next</a></li>
                            </c:if>
                        </c:if>      

                </ul>
                <script>
                    function setPage(pageNumber) {
                        document.getElementById('pageing').value = pageNumber;
                        document.getElementById('search-bar').submit();

                    }
                </script>
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
