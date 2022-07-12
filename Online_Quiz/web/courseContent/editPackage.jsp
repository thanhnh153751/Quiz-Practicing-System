<%-- 
    Document   : editSubjectDimension
    Created on : Jun 26, 2022, 1:50:06 AM
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
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="pricepackage?do=edit&sid=${sid}" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Package</h4>
                                <a href="/Online_Quiz/courseContent/pricepackage"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> </a>
                            </div>
                            <div class="modal-body">				
                                <input type="hidden" name="sid" value="${requestScope.sid}">

                                <input type="hidden" name="id" value="${details.id}">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input  name="name" type="text" value="${details.name}" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Access Duration (in months)</label>
                                    <input  name="duration" type="text" value="${details.duration}" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <c:if test="${details.status==1}">
                                        <input  name="status" type="text" value="Active" class="form-control" readonly>

                                    </c:if>
                                    <c:if test="${details.status==0}">
                                        <input  name="status" type="text" value="Inactive" class="form-control" readonly>

                                    </c:if>
                                </div>


                                <div class="form-group">
                                    <label>List Price</label>
                                    <input name="list_price" class="form-control" type="text" value="${details.list_price}" required></input>
                                </div>
                                <div class="form-group">
                                    <label>Sale Price</label>
                                    <input name="sale_price" class="form-control" type="text" value="${details.sale_price}" required></input>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <input name="description" class="form-control" type="text" value="${details.description}" required></input>
                                </div>

                            </div>
                            <div class="form-group">
                                <label>Subject</label>
                                <select name="subject">
                                    <c:forEach items="${listS}" var="o">
                                        <c:if test="${details.sid==o.id}">
                                            <option  value="${o.id}" selected>${o.title}</option>

                                        </c:if>
                                            <c:if test="${details.sid!=o.id}">
                                            <option  value="${o.id}" >${o.title}</option>

                                        </c:if>
                                            
                                    </c:forEach>
                                </select>                               
                            </div>
                            <div class="modal-footer">
                                <input name="submit" type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
