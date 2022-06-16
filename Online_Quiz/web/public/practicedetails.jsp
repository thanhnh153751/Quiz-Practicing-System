<%-- 
    Document   : practicedetails
    Created on : Jun 11, 2022, 3:05:17 PM
    Author     : PREDATOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/practicedetails.css">
    </head>
    <body>
        <div class="container-fluid main-form">
            <form action="practicedetails" method="get" class="form">
                <h2>Practice Details</h2>
                <div class="form-group">
                    <label for="subject">Subject</label><br>
                    <select name="subject" id="subject">
                        
                        <c:forEach items="${categorySubject}" var="o">
                            <option value="${o.categorySubjectID}">${o.categorySubjectName}</option>
                        </c:forEach>
                    </select>
                </div><br>
                <div class="form-group">
                    <label for="number">Number of practicing questions</label>
                    <input type="number" class="form-control" id="number"
                           placeholder="Enter Number Question" name="number">
                </div><br>
                <div class="form-group">
                    <label for="question">Questions are selected by topic(s) or a specific dimension</label><br>
                    <select name="question" id="question">
                        <option value="1">By subject topic</option>
                        <option value="0">By subject specific dimension</option>
                    </select>
                </div><br>
                <div class="form-group">
                    <label for="group">Question group (choose one or all topic/dimension(s))</label><br>
                    <select name="group" id="group">
                        <option value="1">All</option>
                        <option value="1">one</option>
                    </select>
                </div>
                <br>
                <button id="practice-btn" type="submit" class="btn btn-primary">Practice</button>
            </form>
        </div>

    </body>
</html>
