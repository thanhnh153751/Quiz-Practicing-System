<%-- 
    Document   : inputSubjectDimension
    Created on : Jun 26, 2022, 1:38:29 AM
    Author     : PREDATOR
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        
    <body>
        <div class="container">
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="pricepackage?do=add&filter=1" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Package</h4>
                                <a href="/Online_Quiz/courseContent/pricepackage"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> </a>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>Name</label>
                                    <input  name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Access Duration (in months)</label>
                                    <input  name="duration" type="number" min="0" class="form-control" required>
                                </div>
                                <div class="form-group ">
                                    <label>Status</label>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <input name="status"  type="radio" value="1" checked > Active

                                        </div>
                                        <div class="col-md-4">
<!--                                            <input name="status"  type="radio" value="0" > Inactive-->

                                        </div>
                                    </div>


                                </div>
                                <div class="form-group">
                                    <label>List Price</label>
                                    <input name="list_price" class="form-control" type="text" required>
                                </div>
                                <div class="form-group">
                                    <label>Sale Price</label>
                                    <input name="sale_price" class="form-control" type="text" required>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <input name="description" class="form-control" type="text" required>
                                </div>
                                <div class="form-group">
                                    <label>Subject</label>
                                    <select name="subject">
                                        <c:forEach items="${listS}" var="o">
                                            <option value="${o.id}">${o.title}</option>
                                        </c:forEach>
                                    </select>                               
                                </div>

                                <input type="hidden" value="${details.id}" name="id">
                            </div>
                            <div class="modal-footer">
                                <input name="submit" type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>