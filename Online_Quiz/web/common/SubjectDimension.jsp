<%-- 
    Document   : Listsubject
    Created on : Jun 10, 2022, 2:55:10 PM
    Author     : Viet Dung
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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


    </head>
    <body>           
        <jsp:include page="../common/header.jsp"></jsp:include>
            <div id="main">
                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <a href="#">Subjects List</a>
                    <a href="#">New Subject</a>
                    <a href="#">Subject Details</a>
                    <a href="#">Subject Dimension</a>
                    <a href="#">Price Package</a>
                    <a href="#">Subject Lessons</a>
                    <a href="#">Lesson Details</a>
                </div>
                <div class="container "style="padding-top: 50px">
                    <div class="row ">                    
                        <div class="col-sm-12">

                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-10 text-primary">
                                            <h2>Subjects <b>Dimension</b></h2>
                                        </div>
                                        <div class="col-sm-2">
                                            <!--<a href="#addEmployeeModal"class="btn btn-success" data-toggle="modal"> <span>Add New</span></a>-->
                                            <button id="open-add" type="button" class="btn btn-success">
                                                Add New
                                            </button>

                                        </div>
                                    </div>
                                </div>
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>

                                            <th>ID</th>
                                            <th>Type</th>
                                            <th>Name</th>
                                            <th>Description</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${listD}" var="o">

                                        <tr>
                                            <td>${o.did}</td>
                                            <td>${o.dtype}</td>
                                            <td>${o.dname}</td>
                                            <td>${o.ddescription}</td>                                      
                                            <td><a href="editdimension?id=${o.did}&sid=${o.id}"  class="btn btn-danger" data-toggle="modal"><span>Edit</span></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <input type="hidden" name="sid" value="${requestScope.sid}">     
                            <c:set var="index" value="${requestScope.index}"/>                
                            <ul class="pagination">
                                <c:forEach begin="1" end="${numpage}" var="i">
                                    <li class="page-item ${i==index?"active":""}"><a class="page-link" href="subdimension?index=${i}&sid=${requestScope.sid}">${i}</a></li>
                                    </c:forEach>
                            </ul>

                        </div>

                    </div>

                </div>
            </div>
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/Online_Quiz/common/loadadddimension" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">  Add New Dimension</h4>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label>Type</label>
                                    <input name="type" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="names" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <input name="description" type="text" class="form-control" required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-lg" data-bs-dismiss="modal">Close</button>
                                <input type="button" id="add" class="btn btn-success" value="Add">
                            </div>

                        </form>
                    </div>
                </div>
            </div>

            <!--        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    ...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>-->
            <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        
                        <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
        <!-- The Modal -->
        <div class="modal" id="addmd">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">ADD Successfully</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        ADD Successfully
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" id="close" data-bs-dismiss="modal">Close</button>
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
    <script src="../js/sidenav.js"></script>


</html>
