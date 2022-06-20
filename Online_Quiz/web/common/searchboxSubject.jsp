<%-- 
    Document   : searchboxSubject
    Created on : Jun 13, 2022, 2:05:15 AM
    Author     : THANH
--%>

<%@page import="Model.SubSubjectCategory"%>
<%@page import="Model.SubjectCategory"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">-->
        <link rel="stylesheet" href="../css/listSubject.css">
        <link rel="stylesheet" href="../css/nav.css">
        <title>JSP Page</title>
        <style>
            .collapsible {
                background-color: #fff;
                color: black;
                cursor: pointer;
                padding: 18px;
                width: 100%;
                border: none;
                text-align: left;
                outline: none;
                font-size: 15px;
            }

            .active, .collapsible:hover {
                background-color: #f1f1f1;
            }

            .content {
                padding: 0 18px;
                display: none;
                overflow: hidden;
                background-color: #f1f1f1;

            }
            .content ul li{
                list-style: none;
            }
        </style>
    </head>
    <body>
        <div class="search-box">
            <div class=" col-12 jc-r mb-4">
                <form action="searchboxsubjectlist" class="" role="search" id="search-bar" method="post">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="name" value="${requestScope.key}">


                    <br>


                    

                    <!--test below-->  

                    
                    <c:forEach items="${requestScope.categorySubject}" var="c">
                        <%
                        int[] clist = (int[]) request.getAttribute("cidF");

                        boolean pos = false;
                        if (clist != null) {
                            pos = true;
                        }

                        List<SubSubjectCategory> calist = (List<SubSubjectCategory>) request.getAttribute("subCategorySubject");
                        int index = 0;
                    %>

                    <div class="drop_sub">
                        <button type="button" class="collapsible">${c.name}</button>


                        <c:set var="id" value="${c.id}"></c:set>


                            <div class="content">
                                <ul class="items">
                                    
                                    

                                <c:forEach items="${requestScope.subCategorySubject}" var="sub">

                                    <%
                                        boolean status = false;
                                        if (pos) {
                                            for (int i = 0; i < clist.length; i++) {
                                                if (clist[i] == calist.get(index).getId()) {
                                                    status = true;//chỉ cần true là có checked từ phiên trước
                                                }

                                            }
                                        }
                                    %>    


                                    <c:if test="${id==sub.cid}">
                                        <li><input type="checkbox" name="cid_checkbox" value="${sub.id}" <c:if test="<%= pos && status%>">checked</c:if>/>${sub.name} </li> 
                                    </c:if>
                                        <%
                                            index++;
                                        %>   

                                </c:forEach>    

                            </ul>

                        </div>
                    </div>

                    </c:forEach>

                    <script>
                        document.querySelectorAll('.drop_sub').forEach(d => {
                            var button = d.querySelector('button');
                            var content = d.querySelector('.content');
                            d.querySelectorAll('input[type="checkbox"]').forEach(i => {
                                if(i.checked){
                                    button.classList.add("active");
                                    content.style = "display: block";
                                }
                            });
                        });
                    </script>








                    <!--check box categori-->
                    
                    <!-- end check box categori-->    
                    <br>

                    <%
                        boolean b = false;
                        boolean a = false;
                        String[] color = (String[]) request.getAttribute("featured");
                        if (color != null) {
                            for (int i = 0; i < color.length; i++) {
                                if (color[i].equals("Begin")) {
                                    b = true;
                                }
                                if (color[i].equals("Advanced")) {
                                    a = true;
                                }

                            }
                        }
                    %>

                    <div style="display: flex;justify-content: space-between; margin-bottom: 2px;">
                        <input type="checkbox" name="featured" value="Begin" <c:if test="<%= b%>">checked</c:if> class="btn-check" id="btn-check-outlined" autocomplete="off">
                            <label class="btn btn-outline-primary" for="btn-check-outlined">Begin</label><br>

                            <input type="checkbox" name="featured" value="Advanced" <c:if test="<%= a%>">checked</c:if>  class="btn-check" id="btn-check-2-outlined" autocomplete="off">
                            <label style="" class="btn btn-outline-primary" for="btn-check-2-outlined">Advanced</label><br>
                        </div>


                        <button class ="btn btn-outline-success" type="submit">Search</button>
                        <input id="pageing" type="hidden" name="page" value="${requestScope.page}">
                    <!--cần xem lại nếu cần type="submit"  onclick="document.getElementById('search-bar').submit()" -->

                </form>
                <!-- featured subjects -->
                <h5 class="">featured subjects</h5>
                <div class="row">

                    <c:forEach items="${requestScope.featuredSubject}" var="s">
                        <div class="col-4">
                            <article class="course-item grid-style">
                                <a title="title name" href="subjectdetail?ids=${s.id}" class="wrap-course-item">
                                    <div class="course-thumb ">
                                        <img class="img-fluid" src="${s.thumbnail}" alt="name courses">
                                    </div>



                                </a>
                            </article>
                        </div>
                    </c:forEach> 

                </div>
                <!-- end featured subjects -->
            </div>

        </div> 
    </body>

    <script src="../js/jquery/jquery.js"></script>
    <script src="../js/jquery/jquery-migrate.js"></script>
    <script src="../js/boostrap/bootstrap.min.js"></script>
    <!--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>-->

    <script src="../js/slick/slick.min.js"></script>
   


    <script>
        var coll = document.getElementsByClassName("collapsible");
        var i;

        for (i = 0; i < coll.length; i++) {
            coll[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var content = this.nextElementSibling;
                if (content.style.display === "block") {
                    content.style.display = "none";
                } else {
                    content.style.display = "block";
                }
            });
        }
    </script> 

</html>
