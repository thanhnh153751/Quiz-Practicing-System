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
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="../css/slick/slick.css">
        <link rel="stylesheet" href="../css/index.css">
        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/sidenav.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../css/profile.css">
        
        <style>
            .image-upload>input {
                display: none;
            }

            .upload-icon {
                width: 115px;
                height: 115px;
                border: 2px solid #5642BE;
                border-style: dotted;
                border-radius: 18px;
                float: left;
            }


            .upload-icon .icon {
                width: 60px;
                height: 60px;
                margin: 19px;
                cursor: pointer;
            }

            .prev {
                display: none;
                width: 95px;
                height: 92px;
                margin: 2px;
                border-radius: 15px;
            }
        </style>

    </head>
    <body>
        <jsp:include page="../common/header.jsp"></jsp:include>
            <div id="main">

                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <a href="/Online_Quiz/public/myregistrations">My Registrations</a>
                    <a class="" href="/Online_Quiz/common/practicesList">Practices List</a>
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
                                                        <li class="breadcrumb-item">Profile</li>
                                                        <li class="breadcrumb-item">
                                                            
                                                        </li>
                                                    </ol>
                                                </nav>
                                            </div>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>
                <form action="profile" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-md-12">
                            <div id="content" class="content content-full-width">
                                <!-- begin profile -->
                                <div class="profile">
                                    <div class="profile-header">
                                        <!-- BEGIN profile-header-cover -->
                                        <div class="profile-header-cover"></div>
                                        <!-- END profile-header-cover -->
                                        <!-- BEGIN profile-header-content -->
                                        <div class="profile-header-content">
                                            <!-- BEGIN profile-header-img -->
                                            <div class="profile-header-img">
                                                <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

                                                <div class="image-upload">
                                                    <label for="file-input" id="thumbnail-image-label">
                                                        <div class="upload-icon">
                                                            <img class="icon" src="../img/insert-image.png">

                                                            <img class="prev" src="../img/insert-image.png">
                                                        </div>
                                                    </label>
                                                    <input id="file-input" type="file" name="file" onchange="loadFile(event)" />

                                                    <div id="cont">
                                                        <div id="rowdiv0" onchange="loadFile(event)">
                                                            <span><img src="${acc.avatar}" id="output0" width="200"></span>
                                                            <button id="btn" onclick="del()" style="cursor: pointer;" >x</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- END profile-header-img -->
                                            <!-- BEGIN profile-header-info -->
                                            <div class="profile-header-info">
                                                <h4 class="m-t-10 m-b-5">${acc.fullname}</h4> 
                                                <br>
                                                <br>
                                            <a href="editprofile.jsp"><button  type="button" class="profile-edit-btn" name="btnAddMore" value="Edit Profile" >Edit Profile</button></a><h5 style="color: red"> ${mess}</h5>

                                        </div>
                                        <!-- END profile-header-info -->
                                    </div>
                                    <!-- END profile-header-content -->
                                    <!-- BEGIN profile-header-tab -->
                                    <ul class="profile-header-tab nav nav-tabs">
                                        <li class="nav-item"><a>ABOUT</a></li>
                                    </ul>
                                    <!-- END profile-header-tab -->
                                </div>
                            </div>
                            <!-- end profile -->
                            <!-- begin profile-content -->
                            <div class="profile-content">
                                <!-- begin tab-content -->
                                <div class="tab-content p-0">

                                    <!-- begin #profile-about tab -->
                                    <div class="tab-pane fade in active show" id="profile-about">
                                        <!-- begin table -->
                                        <div class="table-responsive">
                                            <table class="table table-profile">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>
                                                            <h4>${acc.fullname} </h4>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="highlight">
                                                        <td class="field">Fullname: </td>
                                                        <td>${acc.fullname}</td>
                                                    </tr>
                                                    <tr class="divider">
                                                        <td colspan="2"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="field">Mobile: </td>
                                                        <td>${acc.phone}
                                                        </td>
                                                    </tr>
                                                    <tr class="divider">
                                                        <td colspan="2"></td>
                                                    </tr>
                                                    <tr class="highlight">
                                                        <td class="field">Email: </td>
                                                        <td>${acc.email}</td>
                                                    </tr>
                                                    <tr class="divider">
                                                        <td colspan="2"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="field">Gender: </td>
                                                        <td>
                                                            <c:if test="${acc.gender==true}">
                                                                Male

                                                            </c:if>
                                                            <c:if test="${acc.gender==false}">
                                                                Female

                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                    <tr class="divider">
                                                        <td colspan="2"></td>
                                                    </tr>
                                                    <!--                                                    <tr class="highlight">
                                                                                                            <td class="field">&nbsp;</td>
                                                                                                            <td class="p-t-10 p-b-10">
                                                                                                                <button type="submit"
                                                                                                                        class="btn btn-primary width-150">Update</button>
                                                                                                                <button type="submit"
                                                                                                                        class="btn btn-white btn-white-without-border width-150 m-l-5">Cancel</button>
                                                                                                            </td>
                                                                                                        </tr>-->
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- end table -->
                                    </div>
                                    <!-- end #profile-about tab -->
                                </div>
                                <!-- end tab-content -->
                            </div>
                            <!-- end profile-content -->
                        </div>
                    </div>
                </div>
            </form>
        </div>
                                                    </div>
        <br>
            <br>
            <br>
            
            <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>

        <script src="../js/jquery/jquery.js"></script>
        <script src="../js/jquery/jquery-migrate.js"></script>
        <script src="../js/boostrap/bootstrap.min.js"></script>
        <script src="../js/slick/slick.min.js"></script>
        <script src="../js/index.js"></script>
        <script src="../js/sidenav.js"></script>
    <script>
                                                                //dưới là dấu x
                                                                var loadFile = function (event) {
                                                                    var imgCont = document.getElementById("cont");
                                                                    imgCont.innerHTML = "";
                                                                    var label = document.getElementById('thumbnail-image-label')
                                                                    label.style = "display: none;"

                                                                    for (let i = 0; i < event.target.files.length; i++) {
                                                                        var divElm = document.createElement('div');
                                                                        divElm.id = "rowdiv" + i;



                                                                        var spanElm = document.createElement('span');
                                                                        var image = document.createElement('img');
                                                                        image.src = URL.createObjectURL(event.target.files[i]);
                                                                        image.id = "output" + i;
                                                                        image.width = "200";

                                                                        spanElm.appendChild(image);
                                                                        var deleteImg = document.createElement('button');
                                                                        deleteImg.innerHTML = "x";
                                                                        deleteImg.style = "cursor: pointer";

                                                                        deleteImg.onclick = function () {
                                                                            this.parentNode.remove();
                                                                            label.style = "";
                                                                            document.getElementById('file-input').value = null;
                                                                        };

                                                                        divElm.appendChild(spanElm);
                                                                        divElm.appendChild(deleteImg);
                                                                        imgCont.appendChild(divElm);
                                                                    }
                                                                };

                                                                function del() {
                                                                    document.getElementById('cont').innerHTML = "";
                                                                    var label = document.getElementById('thumbnail-image-label')
                                                                    label.style = "";
                                                                }
                                                                ;
                                                                
                                                                var something = (function () {
                                                                    var executed = false;
                                                                    return function () {
                                                                        if (!executed) {
                                                                            executed = true;
                                                                            // do something
                                                                            var label = document.getElementById('thumbnail-image-label')
                                                                            label.style = "display: none;"
                                                                            var del = function () {

                                                                            }

                                                                        }
                                                                    };
                                                                })();
                                                                something(); // "do something" happens
                                                                something();



    </script>

</html>
