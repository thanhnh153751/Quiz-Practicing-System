<%-- 
    Document   : inputPost
    Created on : Jun 12, 2022, 1:14:24 AM
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
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Add <b>Post</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/Online_Quiz/public/postdetails?do=${do}&filter=1" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					

                               
                                <div class="form-group">
                                    <label>Post_title</label>
                                    <input  name="posttitle" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Brief</label>
                                    <input  name="biref" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Details</label>
                                    <textarea name="details" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Author</label>
                                    <input name="author" class="form-control" type="text" required></input>
                                </div>
                                <div class="form-group">
                                    <label>Contact</label>
                                    <input name="contact" class="form-control" type="email" required></input>
                                </div>
                                
                                <div class="form-group">
                                    <label>Category Post</label>
                                    <select name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listPC}" var="o">
                                            <option value="${o.id}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <select name="status" class="form-select" aria-label="Default select example">
                                        
                                            <option value="1">Active</option>
                                       
                                    </select>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
