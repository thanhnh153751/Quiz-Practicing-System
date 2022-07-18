<%-- 
    Document   : post
    Created on : Jun 14, 2022, 2:44:49 PM
    Author     : PREDATOR
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
        </script>
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="../css/ManageListSubject.css">
        <link rel="stylesheet" href="../css/nav.css">
        <script src="../js/post.js"></script>
        <title>Document</title>
        
    </head>

    <body>


        <jsp:useBean id="a" class="DAO.DAO" scope="request"></jsp:useBean>
            <div class="header">
            <jsp:include page="../common/header.jsp"></jsp:include>
            </div>
            <div class="container "style="padding-top: 50px">
                <div class="row">


                    <div class="col-sm-12"

                         <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-9 text-primary">
                                        <h2>List <b>Of Post</b></h2>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="/Online_Quiz/marketing/postdetails?do=add"  class="btn btn-success" data-toggle="modal"> <span>Add New Course</span></a>

                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">#ID</th>
                                        <th scope="col">Post Title</th>
                                        <th scope="col">Brief Information</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Status</th>

                                        <th scope="col"> Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${listP}" var="o">
                                    <tr>
                                        <th scope="row">${o.id}</th>
                                        <td>${o.post_title}</td>
                                        <td>${o.biref}</td>
                                        <td>${o.author}</td>
                                        <c:if test="${o.status == 1 }">
                                            <td>Active</td>

                                        </c:if>
                                        <c:if test="${o.status == 0}">
                                            <td>Inactive</td>

                                        </c:if>

                                        <td><a href="/Online_Quiz/marketing/postdetails?do=details&id=${o.id}"><i class="fas fa-eye"></i></a> 
                                                <c:if test="${o.status == 1 }">
                                                <a href="/Online_Quiz/marketing/postdetails?do=changing&id=${o.id}&status=${o.status}" 
                                                   data-bs-toggle="modal" data-bs-target="#exampleModal${o.id}"><i class="fas fa-flag" style="color: red"></i></a>


                                            </c:if>
                                            <c:if test="${o.status == 0}">
                                                <a href="/Online_Quiz/marketing/postdetails?do=changing&id=${o.id}&status=${o.status}" 
                                                   data-bs-toggle="modal" data-bs-target="#exampleModal${o.id}"><i class="fas fa-flag" style="color: green"></i></a>


                                            </c:if>

                                        </td>


                                    </tr>
                                <div class="modal fade" id="exampleModal${o.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Acceptance</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Do You Want To Change Status?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                                <a href="/Online_Quiz/marketing/postdetails?do=changing&id=${o.id}&status=${o.status}"  type="button" class="btn btn-primary">Yes</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </c:forEach>
                            </tbody>
                        </table>
                        <c:set var="index" value="${requestScope.index}"/>                


                        <!--                        <ul class="pagination">
                        <c:forEach begin="1" end="${numpage}" var="i">
                            <li class="page-item ${i==index?"active":""}"><a class="page-link" href="managersubjectlist?index=${i}&status=${status}&did=${did}&cid=${cid}&search=${ts}">${i}</a></li>
                        </c:forEach>
                </ul>-->





                    </div>

                </div>
                <!--            <a href="#"><button type="button" class="btn btn-primary">Back to home</button>-->
            </div>


            <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>

</html>