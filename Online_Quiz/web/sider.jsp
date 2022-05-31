<%-- 
    Document   : sider
    Created on : May 31, 2022, 1:56:25 PM
    Author     : THANH
--%>

<%@page import="java.util.List"%>
<%@page import="Model.SubjectCategory"%>
<%@page import="Model.SubjectCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/listSubject.css">
        <script src="./js/index.js"></script>
    </head>
    <body>
        
                    <div class="search-box">
                        <div class=" col-12 jc-r mb-4">
                            <form action="searchboxsubjectlist" class="" role="search" id="search-bar">
                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="name" value="${requestScope.key}">


                                <br>

                                <!--check box categori-->
                                <div>
                                    <%
                                        int[] clist = (int[]) request.getAttribute("cidF");

                                        boolean pos = false;
                                        if (clist != null) {
                                            pos = true;
                                        }

                                        List<SubjectCategory> calist = (List<SubjectCategory>) request.getAttribute("categorySubject");
                                        int index = 0;
                                    %>
                                    <h5 class="sub_fiter">Category</h5>
                                    <c:forEach items="${requestScope.categorySubject}" var="c">
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
                                        <input type="checkbox" name="cid_checkbox" value="${c.id}" <c:if test="<%= pos && status%>">checked</c:if>/>${c.name}<br/>
                                        <%
                                            index++;
                                        %>
                                    </c:forEach>

                                </div>
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
                                <!-- featured subjects -->
                                <input type="checkbox" name="featured" value="Begin" <c:if test="<%= b %>">checked</c:if> class="btn-check" id="btn-check-outlined" autocomplete="off">
                                <label class="btn btn-outline-primary" for="btn-check-outlined">Begin</label><br>
                                <br>
                                <input type="checkbox" name="featured" value="Advanced" <c:if test="<%= a %>">checked</c:if>  class="btn-check" id="btn-check-2-outlined" autocomplete="off">
                                <label class="btn btn-outline-primary" for="btn-check-2-outlined">Advanced</label><br>
                                <br>
                                <button class ="btn btn-outline-success" type="submit">Search</button>
                                <!--cần xem lại nếu cần type="submit"  onclick="document.getElementById('search-bar').submit()" -->
                            </form>
                        </div>

                    </div>  
                
    </body>
</html>
