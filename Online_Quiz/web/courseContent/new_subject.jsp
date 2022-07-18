<%-- 
    Document   : new_subject
    Created on : Jun 26, 2022, 10:47:15 AM
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
        <link rel="stylesheet" href="../css/slick/slick.css">
        <link rel="stylesheet" href="../css/index.css">
        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/sidenav.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../css/ManageListSubject.css">
        <title>Add new Subject</title>
        <style>
            

            /* tbody, td, tfoot, th, thead, tr {
                padding: 10px;
            } */
            .table_1 td {
                padding: 30px 5px;

            }
            .table_1 tr td:nth-child(1){
                text-align: right;

            }
            .table_2 tr td:nth-child(1){
                padding: 1% 5%;
                text-align: right;

            }



            .table_2 {
                margin-top: 30px;
            }



            .description {
                padding-bottom: 225px;
            }

            /* below for upload img */

            .image-upload>input {
                display: none;
            }

            .upload-icon {
                width: 221px;
                height: 150px;
                border: 2px solid #5642BE;
                border-style: dotted;
                border-radius: 18px;
                float: left;
            }


            .upload-icon .icon {
                width: 170px;
                height: 110px;
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

            .body-main    {
            background-color: fff;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 66px;
        }
        </style>
    </head>

    <body>
        <jsp:include page="../common/header.jsp"></jsp:include>
        <br>
        <br>       
            <div id="main">
            
            <div id="mySidenav" class="sidenav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <a class="activenav" href="http://localhost:8080/Online_Quiz/common/managersubjectlist">Subjects List </a>
                <a href="http://localhost:8080/Online_Quiz/common/questionlist">Questions List </a>
                <a href="http://localhost:8080/Online_Quiz/common/quizzeslist">Quizzes List </a>             
            </div>
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
                                                        <li class="breadcrumb-item">Subjects List</li>
                                                        <li class="breadcrumb-item">
                                                            <a style="text-decoration: none" href="http://localhost:8080/Online_Quiz/courseContent/newsuject">Add new Course</a>
                                                        </li>
                                                    </ol>
                                                </nav>
                                            </div>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>
                
                
        <div class="container">
            <div class="row body-main">
                <h1 style="margin-top: 10px; color: rgb(35, 35, 201)" class="center text-center"><b>Add new Course</b></h1>
                <h3 class="text-center">Please enter the information of a course in the form</h3>
                <form class="d-flex" action="newsuject" method="post" enctype="multipart/form-data">
                <div class="col-6">
                    
                    <table class="table_1">

                        <tr>
                            <td>Title Course:</td>
                            <td><input class="input-text" type="text" name="title" placeholder="enter name,title of course"></td>
                        </tr>

                        <tr>
                            <td>Category Course:</td>
                            <td>
                                <select name="category" id="category" onchange="getData()">
                                    <option value="0">Slect Category:</option>
                                    <c:forEach items="${requestScope.category}" var="cate">
                                        <option value="${cate.id}">${cate.name}</option>   
                                    </c:forEach>
                                </select>


                                <select name="subcategory" id="subcategory">
                                    <option value="0">Slect Subcategory:</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Featured Flag:</td>
                            <td><input name="featured" type="checkbox"></td>
                        </tr>

                        <tr>
                            <td>Thumbnail Image:</td>
                            <td>

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

                                        </div>
                                    </div>


                            </td>
                        </tr>


                    </table>
                    
                </div>

                <div class="col-6">
                    <table class="table_2">
                        <tr>
                            <td>Owner:</td>
                            <td><input name="owner" class="input-text" type="text" placeholder="enter the name of the author or owner of the course"></td>
                        </tr>
                        <tr>
                            <td>Status:</td>
                            <td>
                                <select name="status" id="">                                   
                                    <option value="0">Unpublished:</option>
                                    <option value="1">Published:</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="description" style="padding-bottom: 225px;">Description:</td>
                            <td>
                                <textarea oninput="auto_grow(this)" style="width: 100%; min-height: 250px" name="paragraph_text" cols="50" rows="10" placeholder="Enter a description of the course,..."></textarea>
                            </td>

                        </tr>
                        <tr>
                            <td><button style="width: 134px;" type="submit">Add new course:</button></td>
                            <td style="float: right;"><button>back</button></td>

                        </tr>
                    </table>
                </div>

        </form>
                <p style="color: red">${requestScope.mess}</p>





            </div>
        </div>
            <br>
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



        //for text description
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

</html>
