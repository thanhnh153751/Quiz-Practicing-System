<%-- 
    Document   : quizhandle
    Created on : Jun 14, 2022, 1:03:43 AM
    Author     : hongd
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link rel="stylesheet" href="../css/quizhandle.css">
        <link rel="stylesheet" href="../css/quizreview.css">

        <title>Quiz Handle</title>
    </head>
    <body>
        <jsp:include page="../common/header.jsp"></jsp:include>
            <div id="main">

                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <a href="#">My Registrations</a>
                    <a class="activenav" href="/Online_Quiz/common/practicesList">Practices List</a>
                    <a href="/Online_Quiz/public/listsubject">List Subject</a>

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
                                                        <li class="breadcrumb-item">Practices List</li>
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="http://localhost:8080/Online_Quiz/common/simulationexams">Simulation Exam</a>
                                                        </li>
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="#">Exam Detail</a>
                                                        </li>
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="#">Quiz Handle</a>
                                                        </li>
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="#">Quiz Review</a>
                                                        </li>
                                                    </ol>
                                                </nav>
                                            </div>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <div class="col-md-12">
                            <div class="quiz-timer d-flex justify-content-between ">
                                <div class="quiz-timer-left">
                                    <h5>Question ${questionIndex}/${numberOfQuestion}</h5>
                            </div>
                            <div class="quiz-timer-right">
                                <h5 id="timer"></h5>
                            </div>

                        </div>
                        <div class="quiz-form ">
                            <div class="quiz-header">
                                <h6>Question ${questionIndex}:</h6>
                            </div>
                            <div class="quiz-body">
                                <div class="quiz-content">
                                    <p><c:if test="${requestScope.questionInfo.question_content!=null}">${requestScope.questionInfo.question_content}</c:if></p>
                                    <c:if test="${requestScope.questionInfo.img_link!=null}">
                                        <img src="${requestScope.questionInfo.img_link}"
                                             alt="">
                                    </c:if>

                                </div>
                                <div class="quiz-answser col-md-12">
                                    <div class="row">
                                        <c:forEach items="${requestScope.answerList}" var="answer">
                                            <div class="answer-content col-md-6 ">
                                                <label class="input <c:if test="${answer.correct == true}">correct</c:if>"><input class="<c:if test="${answer.correct == true}">correct</c:if>" type="radio" name="choice" <c:if test="${answer.id == requestScope.quiz_take_details.answer_id}">checked</c:if>
                                                                                                                                  value="${answer.id}"><span><c:if test="${answer.correct == true}"><i class="icon icon-check fa-solid fa-circle-check"></i></c:if> &nbsp;${answer.answer}</span></label>
                                                </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div>
                                    <ul>
                                        <li style="color:#FFC300;"><i class="fa-solid fa-user-check"></i>&nbsp;Your choice</li>
                                        <li><i class="icon icon-check fa-solid fa-circle-check"></i>&nbsp;Correct choice</li>
                                    </ul>
                                </div>

                            </div>

                        </div>
                        <div class="quiz-footer d-flex justify-content-between ">
                            <div class="quiz-footer-left">
                                <!--<input type="button" id="btn-submit" value="Submit" >-->
                                <!-- <button>Submit</button> -->
                            </div>
                            <div class="quiz-footer-right">
                                <input type="button" name="nxtp" onclick="previousQuestion('${requestScope.questionIndex}', '${requestScope.quizId}', '${requestScope.quiz_take.id}')" id="btn-previous" value="Previous" class="<c:if test="${requestScope.questionIndex == 1}">btn-hide</c:if>">
                                <input type="button" name="nxtp" onclick="nextQuestion('${requestScope.questionIndex}', '${requestScope.quizId}', '${requestScope.quiz_take.id}')" id="btn-next" value="Next" class="<c:if test="${requestScope.questionIndex >= requestScope.numberOfQuestion}">btn-hide</c:if>">
                                    <!-- <button>Previous</button>
                                    <button>Next</button> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <br>
                <br>
                <br>
            <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
    </body>
    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <script src="../js/slick/slick.min.js"></script>
    <script src="../js/index.js"></script>
    <script src="../js/sidenav.js"></script>
    <script src="../js/quizreview.js"></script>
</html>
