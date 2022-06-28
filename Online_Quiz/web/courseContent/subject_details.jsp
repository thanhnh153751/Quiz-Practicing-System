<%-- 
    Document   : subject_details
    Created on : Jun 27, 2022, 4:44:16 PM
    Author     : THANH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <title>Document</title>
        <style>
            .center {
                background-color: #04AA6D;
            }

            /* .body-main {
                background-color: gainsboro;
                box-shadow: 0px 2px 14px #aaaaaa;
            } */
            .shadow-sm{
                background-color: gainsboro;
            }

            .table-search,
            th {
                border: 1px solid black!important;;
                text-align: center;
            }

            table.table-search td {
                border: 1px solid black;

            }

            .table-search {
                width: 100%;
            }

            .note-top-table {
                color: red;
            }


            /* edit thông tin chung */
            table.table_1 td {
                padding: 24px 5px;

            }
            .table_1 tr td:nth-child(1){
                text-align: right;

            }
            table.table_2 tr td:nth-child(1){
                padding: 1% 0%;
                text-align: right;
                padding-right: 10px;

            }

            table .table_1,th,td {
                border: none;

            }

            .table_2 {
                margin-top: 25px;
            }



            .description {
                padding-bottom: 225px;
            }



            /* below for upload img */

            .image-upload>input {
                display: none;
            }

            .upload-icon {
                width: 200px;
                height: 97px;
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
            .input-text{
                width: 100%;
            }
        </style>
    </head>

    <body>
        <h1 class="center">Course Details</h1>
        <div class="container">
            <div class="body-main">
                <div class="container ">
                    <div class="row shadow-sm rounded  py-4">
                        <div class="col-md-5 mx-auto">
                            <h3 class="text-center">Choose the assigned expert for this course</h3>
                            <div class="input-group">
                                <form class="d-flex w-100" action="subjectdetailmanager">
                                    <input class="form-control mr-sm-2" type="search" name="key" value="${requestScope.key}"
                                           placeholder="enter account name,email,phone want to become Expert" aria-label="Search">
                                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                                </form>
                            </div>

                        </div>
                        <div class="mt-3">
                            <p><i class="note-top-table">Note: If the account has a green tick in the Course Content column,
                                    they will become an expert for that course!</i></p>
                            <table class="table-search mt-3">
                                <tr>
                                    <th style="width: 5%;">Id</th>
                                    <th>Full name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th style="width: 5%;">Gender</th>
                                    <th style="width: 5%;">Status</th>
                                    <th style="width: 10%;">Course Content</th>
                                    <th style="width: 10%;">Set Role</th>
                                </tr>
                                <!--                            <tr>
                                                                <td>1</td>
                                                                <td>Nguyen Van A</td>
                                                                <td>Angvan@gmail.com</td>
                                                                <td>0987655321</td>
                                                                <td>male</td>
                                                                <td>active</td>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                            </tr>-->
                                <c:forEach items="${requestScope.listAcc}" var="ac">
                                    <input type="hidden" id="aid" value="${ac.id}" >
                                    <tr>
                                        <td>${ac.id}</td>
                                        <td>${ac.fullname}</td>
                                        <td>${ac.email}</td>
                                        <td>${ac.phone}</td>
                                        <td>
                                            <c:if test="${ac.gender == true}">Male</c:if>
                                            <c:if test="${ac.gender == false}">FeMale</c:if>
                                            </td>
                                            <td>
                                            <c:if test="${ac.status == 1}">active</c:if>
                                            <c:if test="${ac.status == 0}">inactive</c:if>
                                            </td>
                                            <td>
                                                <input onclick="return false;" type="checkbox">
                                            </td>
                                            <td>
                                                <button class="btn btn-outline-success btn-sm" onclick="doSet('${ac.id}','${ac.fullname}','${ac.email}')">set role</button>
                                        </td>
                                    </tr> 
                                </c:forEach>
                            </table>
                            <!--                        <div class="d-flex justify-content-center mt-3">
                                                        <button class="btn btn-outline-success" type="submit">Save</button>
                                                    </div>-->

                        </div>
                    </div>



                </div>    



                <div class="container">
                    <div class="row shadow-sm rounded py-4 mt-5">
                        <h3 class="text-center">Edit the general information of course</h3>
                        <c:set value="${requestScope.subject}" var="sub"></c:set>
                        <c:set value="${requestScope.subcategory}" var="subcate"></c:set>
                            <form action="subjectdetailmanager" method="post" class="row" enctype="multipart/form-data">
                                <div class="col-6">

                                    <table class="table_1" id="tb1">

                                        <tr>
                                            <td>Title Course</td>
                                            <td><input class="input-text" type="text" name="title" value="${sub.title}" placeholder="enter name,title of course"></td>
                                    </tr>

                                    <tr>
                                        <td>Category Course</td>
                                        <td>
                                            <select name="category" id="category" onchange="getData()">
                                                <option value="0">slect category</option>
                                                <c:forEach items="${requestScope.category}" var="cate">
                                                    <option  <c:if test="${cate.id == subcate.cid}">selected</c:if> value="${cate.id}">${cate.name}</option>   
                                                </c:forEach>
                                            </select>

                                            <select name="subcategory" id="subcategory">

                                                <c:forEach items="${requestScope.allsubcategory}" var="allsubcategory">
                                                    <option value="${allsubcategory.id}" <c:if test="${allsubcategory.id == sub.cid}">selected</c:if> >${allsubcategory.name}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>featured flag</td>
                                        <td><input type="checkbox"></td>
                                    </tr>

                                    <tr>
                                        <td>thumbnail image</td>
                                        <td>

                                            <script
                                            src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

                                            <div class="image-upload" >
                                                <label for="file-input" id="thumbnail-image-label">
                                                    <div class="upload-icon">
                                                        <img class="icon"
                                                             src="https://image.flaticon.com/icons/png/128/61/61112.png">
                                                        <img class="prev"
                                                             src="https://image.flaticon.com/icons/png/128/61/61112.png">
                                                    </div>
                                                </label>
                                                <input id="file-input" type="file" name="file" onchange="loadFile(event)"  />
                                                <input hidden="true" id="path" value="${sub.thumbnail}">
                                                <div id="cont">
                                                    <div id="rowdiv0" onchange="loadFile(event)">
                                                        <span><img src="${sub.thumbnail}" id="output0" width="200"></span>
                                                        <button id="btn" onclick="del()" style="cursor: pointer;" >x</button>
                                                    </div>
                                                </div>
                                            </div>



                                        </td>
                                    </tr>





                                </table>
                            </div>

                            <div class="col-6">
                                <table class="table_2">
                                    <tr>
                                        <td>owner</td>
                                        <td><input class="input-text" type="text" name="owner" value="${sub.contact}"
                                                   placeholder="enter the name of the author or owner of the course"></td>
                                    </tr>
                                    <tr>
                                        <td>status</td>
                                        <td>
                                            <select name="status" id="">
                                                <option value="0" <c:if test="${sub.status == 0}">checked</c:if> >Unpublished</option>
                                                <option value="1" <c:if test="${sub.status == 1}">checked</c:if> >Published</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="description" style="padding-bottom: 225px;">description</td>
                                            <td>
                                                <textarea oninput="auto_grow(this)" style="width: 100%; min-height: 250px"
                                                          name="paragraph_text"  cols="50" rows="10" 
                                                          placeholder="Enter a description of the course,...">${sub.description}</textarea>
                                        </td>

                                    </tr>

                                </table>


                            </div>
                            <div class="d-flex justify-content-center mt-3">
                                <button class="btn btn-outline-success mt-5" style="width: 134px;" type="submit">Save Edit</button>
                            </div>
                            <p style="color: red">${requestScope.mess}</p>
                        </form>     
                    </div>

                </div>

                <div class="container">
                    <div class="row shadow-sm rounded py-4 mt-5">
                        <h3 class="text-center mt-5">Edit advanced information of course</h3>
                        <!-- dimetion price package -->
                        <div class="d-flex justify-content-around mt-5">
                            <a href="#"><button type="button" class="btn btn-outline-success btn-lg">Lesson</button></a>
                            <a href="#"><button type="button" class="btn btn-outline-success btn-lg">Dimension</button></a>
                            <a href="#"><button type="button" class="btn btn-outline-success btn-lg">Price Package</button></a>
                        </div>
                    </div>
                </div>
            </div>
    </body>
    <script>
        function doSet(id,name,email) {
            if (confirm("Account ID : " + id 
                    + " \nName : "+name
                    + " \nEmail : "+email
                    +" \nwill become an Expert for this Course ?")) {
//                window.location = "delete?id=" + id;
            }
        }



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
        function auto_grow(element) {
            element.style.height = "5px";
            element.style.height = (element.scrollHeight) + "px";
        }

        //load data for category
        function getData() {

            var a = $('#category').find(":selected").val();


            $.ajax({
                url: "/Online_Quiz/courseContent/loadnewsubject",
                type: "get", //send it through get method
                data: {
                    idcate: a,

                },
                success: function (response) {
                    console.log(response);

                    document.getElementById("subcategory").innerHTML = response;


                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        }
    </script>
    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/0e3f31cc48.js" crossorigin="anonymous"></script>

</html>
