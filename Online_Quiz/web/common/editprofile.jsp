<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="../css/profile.css">
        <link rel="stylesheet" href="../css/nav.css">
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
        <jsp:useBean id="a" class="DAO.DAO" scope="request"></jsp:useBean>
            <div class="header">
            <jsp:include page="../common/header.jsp"></jsp:include>
            </div>
            <div class="container">
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
                                                            <img class="icon" src="${acc.avatar}">

                                                            <img class="prev" src="${acc.avatar}">
                                                        </div>
                                                    </label>
                                                    <input id="file-input" type="file" name="file" onchange="loadFile(event)" />

                                                    <div id="cont">
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- END profile-header-img -->
                                            <!-- BEGIN profile-header-info -->
                                            <div class="profile-header-info">
                                                <h4 class="m-t-10 m-b-5">${acc.fullname}</h4> 
                                            <p class="m-b-10 ">UXUI + Frontend Developer</p>
                                            <input  type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile" /><h5 style="color: red"> ${mess}</h5>

                                        </div>
                                        <!-- END profile-header-info -->
                                    </div>
                                    <!-- END profile-header-content -->
                                    <!-- BEGIN profile-header-tab -->
                                    <ul class="profile-header-tab nav nav-tabs">
                                        <li class="nav-item"><a>No</a></li>
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
                                                        <td class="field">Fullname</td>
                                                        <td><input name="fullname" placeholder="fullname" value="${acc.fullname}" ></td>
                                                    </tr>
                                                    <tr class="divider">
                                                        <td colspan="2"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="field">Mobile</td>
                                                        <td><input name="phone" placeholder="phone" value="${acc.phone}" >
                                                        </td>
                                                    </tr>
                                                    <tr class="divider">
                                                        <td colspan="2"></td>
                                                    </tr>
                                                    <tr class="highlight">
                                                        <td class="field">Email</td>
                                                        <td><input name="gmail" placeholder="gmail" value="${acc.email}" readonly></td>
                                                    </tr>
                                                    <tr class="divider">
                                                        <td colspan="2"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="field">Gender</td>
                                                        <td>
                                                            <c:if test="${acc.gender==true}">
                                                                <input name="gender" placeholder="gender" value="Male"
                                                                       readonly>

                                                            </c:if>
                                                            <c:if test="${acc.gender==false}">
                                                                <input name="gender" placeholder="gender" value="Female"
                                                                       readonly >

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
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>
    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <script src="../js/slick/slick.min.js"></script>
    <script src="../js/index.js"></script>
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

                                                                



    </script>

</html>