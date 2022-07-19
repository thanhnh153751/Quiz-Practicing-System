<%-- 
    Document   : subjectDetail
    Created on : May 31, 2022, 3:02:47 PM
    Author     : THANH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="../css/slick/slick.css">
        <!--<link rel="stylesheet" href="../css/index.css">-->  
        
        <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">-->       
        <link rel="stylesheet" href="../css/listSubject.css">
<!--        <link rel="stylesheet" href="../css/subjectDetail.css">-->
        <link href="../css/sidenav.css" rel="stylesheet" type="text/css"/>
        <link href="../css/nav.css" rel="stylesheet" type="text/css"/>
        <!--        <script src="./js/index.js"></script>-->

        <title>JSP Page</title>

    </head>
    <body>
        <jsp:include page="../common/header.jsp"></jsp:include>
            <div id="main">

                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    
                    <a class="activenav" href="/Online_Quiz/public/listsubject">List Subject</a>             
                </div>
                <div class="container-fluid "style="padding-top: 50px">
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
                                                        <li class="breadcrumb-item">List Subject</li>
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="#">Subject Detail</a>

                                                        </li>
                                                    </ol>
                                                </nav>
                                            </div>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>


                        <h1 class="center"><a href="#"></a></h1>


                        <div class="row">
                            <div class="col-10">

                                <div class="row list-courses">

                                <c:set var="s" value="${requestScope.subject}"/>
                                <div class=" mb-4">
                                    <article class="course-item grid-style p-3">
                                        
                                            <div class="course-thumb ">
                                                <img class="img-fluid" src="${s.thumbnail}" alt="name courses">
                                            </div>
                                            <input type="hidden" id="sid" value="${s.id}" >
                                            <div class="view-content">
                                                <h3 class="course-title">${s.title}</h3>

                                                <div class="taglineSbject">
                                                    <div class="tag" data-type="tagline">${s.tagline}</div>
                                                </div>
                                                <p>${s.description}</p>
                                                <h3 class="course-title">Lesson</h3>
                                                <div class="list-group">

                                                    <c:forEach items="${requestScope.lesson}" var="les">
                                                        <a href="#" class="list-group-item">${les.name}</a>  
                                                    </c:forEach>
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
                                                        <a id="myBtn" class="btn btn-outline-primary" onclick="loadData()"> Register</a>
                                                        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>-->

                                                        <!--<button >Open Modal</button>-->
                                                        <div class="sreg">
                                                        <jsp:include page="../common/subjectRegister.jsp"></jsp:include>
                                                        </div>

                                                    </div>
                                                </div>
                                            
                                        </article>
                                    </div>



                                </div>
                                <div class="so_si">
                                <jsp:include page="../common/social_sidebar.jsp"></jsp:include>  
                                </div>
                            </div>
                            <div class="col-2 sticky search-box-container">
                            <jsp:include page="../common/searchboxSubject.jsp"></jsp:include>
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
        <script src="../js/subjectdetails.js"></script>
    </body>

    <script>
                                                            $(document).ready(function () {//chuyển sid về sever
                                                                $('#myBtn').click(function () {
                                                                    var sid = document.getElementById('sid').value;
                                                                    $.ajax({
                                                                        url: "/Online_Quiz/public/subjectregister",
                                                                        type: "get", //send it through get method
                                                                        data: {
                                                                            ids: sid,

                                                                        },
                                                                        success: function (response) {
                                                                            $('#message').html(response);

                                                                            //Do Something
                                                                        },
                                                                        error: function (xhr) {
                                                                            //Do Something to handle error
                                                                        }
                                                                    })
                                                                });


                                                            });

                                                            //gửi trả lại từ pop-up
                                                            function getData() {
                                                                var a = $("input[type='radio'][name='package']:checked").val();

                                                                $.ajax({
                                                                    url: "/Online_Quiz/public/subjectregister",
                                                                    type: "get", //send it through get method
                                                                    data: {
                                                                        idpac: a,

                                                                    },
                                                                    success: function (response) {
                                                                        // document.getElementById("arler").innerHTML = response;
                                                                        if (a != null) {
                                                                            document.getElementById("arler").innerHTML = response;
                                                                            document.getElementById("message").style.display = "none";

                                                                        }

                                                                    },
                                                                    error: function (xhr) {
                                                                        //Do Something to handle error
                                                                    }
                                                                });
                                                            }





    </script>
</html>
