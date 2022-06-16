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
        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/quizhandle.css">
        <title>Quiz Handle</title>
    </head>
    <body>
        <jsp:include page="../common/header.jsp"></jsp:include>


            <div class="container">
                <div class="row">
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
                                <%--<c:if test="${requestScope.questionInfo.img_link!=null}">--%>
                                <img src="${requestScope.questionInfo.img_link}"
                                     alt="">
                                <%--</c:if>--%>

                            </div>
                            <div class="quiz-answser col-md-12">
                                <div class="row">
                                        <c:forEach items="${requestScope.answerList}" var="answer">
                                            <div class="answer-content col-md-6 ">
                                                <label class="input"><input type="radio" name="choice" <c:if test="${answer.id == requestScope.quiz_take_details.answer_id}">checked</c:if>
                                                                            value="${answer.id}"><span>&nbsp;${answer.answer}</span></label>
                                            </div>
                                        </c:forEach>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="quiz-footer d-flex justify-content-between ">
                        <div class="quiz-footer-left">
                            <input type="button" id="btn-submit" value="Submit">
                            <!-- <button>Submit</button> -->
                        </div>
                        <div class="quiz-footer-right">
                            <input type="button" name="nxtp" onclick="previousQuestion('${requestScope.questionIndex}','${requestScope.quizId}','${requestScope.quiz_take.id}')" id="btn-previous" value="Previous" class="<c:if test="${requestScope.questionIndex == 1}">btn-hide</c:if>">
                            <input type="button" name="nxtp" onclick="nextQuestion('${requestScope.questionIndex}','${requestScope.quizId}','${requestScope.quiz_take.id}')" id="btn-next" value="Next" class="<c:if test="${requestScope.questionIndex >= requestScope.numberOfQuestion}">btn-hide</c:if>">
                            <!-- <button>Previous</button>
                            <button>Next</button> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <script src="../js/slick/slick.min.js"></script>
    <script src="../js/index.js"></script>
    <script src="../js/quizhandle.js"></script>
</html>
