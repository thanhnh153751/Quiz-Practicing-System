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

                        </div>
                        <div class="quiz-form ">
                            <h1>${message}!</h1>
                        <c:if test="${status == true}">
                            <h3>Total: ${score}/100</h3>
                            
                            <input onclick="Redirect('${quiz_take}','${quiz_id}')" type="button" id="v-details" value="Click here to view details">
                            
                        </c:if>

                    </div>
                    <div class="quiz-footer d-flex justify-content-between ">
                        <div class="quiz-footer-left">
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
    <script src="../js/quizfinish.js"></script>
</html>
