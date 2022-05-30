<%-- 
    Document   : profile
    Created on : May 27, 2022, 4:40:32 PM
    Author     : PREDATOR
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/profile.css" >
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

    </head>
    <body>
        <div class="container emp-profile">
            <form action="profile" method="post">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="https://scontent.fhan2-4.fna.fbcdn.net/v/t39.30808-6/280542463_3207477429491807_1132748264430479473_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=mGb-1JiMuh4AX912ha1&tn=Rld-t__glJM2lQwH&_nc_ht=scontent.fhan2-4.fna&oh=00_AT-Tt36avMHfgwUL5_sbPwFPHonEIpOww1UvkJcKaSRkvQ&oe=6299CA31" alt=""/>
                            <div class="file btn btn-lg btn-primary">
                                Change Photo
                                <input type="file" name="file"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                            <h5>
                                ${acc.fullname} <h5 style="color: blue"> ${mess}</h5>
                            </h5>

                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/>
                    </div>
                </div>

                <div class="row editedit">
                    <div class="col-md-4">

                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>Fullname</label>
                                    </div>
                                    <div class="col-md-10">
                                        <input name="fullname" placeholder="fullname" value="${acc.fullname}" >
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>Email</label>
                                    </div>
                                    <div class="col-md-10">
                                        <input name="gmail" placeholder="gmail" value="${acc.email}" readonly>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>Phone</label>
                                    </div>
                                    <div class="col-md-10">
                                        <input name="phone" placeholder="phone" value="${acc.phone}" >
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>Gender</label>
                                    </div>
                                    <div class="col-md-10">
                                        <c:if test="${acc.gender==true}">
                                            <input name="gender" placeholder="gender" value="Male" readonly>

                                        </c:if>
                                        <c:if test="${acc.gender==false}">
                                            <input name="gender" placeholder="gender" value="Female" readonly>

                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>   
        </div>



    </body>
</html>
