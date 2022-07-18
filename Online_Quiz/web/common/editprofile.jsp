<%-- 
    Document   : editprofile
    Created on : Jul 18, 2022, 2:05:24 AM
    Author     : PREDATOR
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/editprofile.css" rel="stylesheet">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
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
            <form id="contact" action="/common/editprofile" method="post">
                <h3>Edit Profile</h3>
                <input type="hidden" name="id" value="${acc.id}">
                <fieldset>
                    <label>Fullname</label>
                    <input placeholder="" type="text" value="${acc.fullname}" tabindex="1" required >
                </fieldset>
                <fieldset>
                    <label>Email</label>
                    <input placeholder="" type="email" value="${acc.email}"tabindex="2" required>
                </fieldset>
                <fieldset>
                    <label>Phone</label>
                    <input placeholder="" type="tel" value="${acc.phone}"tabindex="3" required>
                </fieldset>

                <fieldset>
                    <label>Gender</label>
                    <c:if test="${acc.gender==true}">
                        <input name="gender" placeholder="gender" value="Male"
                               readonly>

                    </c:if>
                    <c:if test="${acc.gender==false}">
                        <input name="gender" placeholder="gender" value="Female"
                               readonly>

                    </c:if>
                </fieldset>
                <fieldset>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

                    <label for="file-input" id="thumbnail-image-label">
                        <div class="upload-icon">
                            <img class="icon" src="../img/insert-image.png">

                            <img class="prev" src="../img/insert-image.png">
                        </div>
                    </label>
                    <input id="file-input" type="file" name="file" onchange="loadFile(event)" />

                    <div id="cont">

                    </div>
                </fieldset>
                <fieldset>
                    <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
                </fieldset>



            </form>
        </div>
                <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>
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
