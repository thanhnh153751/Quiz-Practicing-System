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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="../css/nav.css">

        <link rel="stylesheet" href="../css/subjectDetail.css">
        <!--<script src="./js/index.js"></script>-->
        <title>JSP Page</title>
        <style>
            a:hover{
                color: black!important;
                text-decoration: none!important;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <jsp:include page="../common/header.jsp"></jsp:include>
            </div>
        <div class="container">


            <h1 class="center"><a href="#"></a></h1>


            <div class="row">
                <div class="col-10">
                    
                    <div class="row list-courses">

                        <c:set var="s" value="${requestScope.subject}"/>
                        <div class=" mb-4">
                            <article class="course-item grid-style p-3">
                                <a title="title name" href="#" class="wrap-course-itemDetail">
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
                                    </a>
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
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>
    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <script src="../js/slick/slick.min.js"></script>
    <script src="../js/index.js"></script>
    <script src="../js/subjectdetails.js"></script>
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
