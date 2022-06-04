<%-- 
    Document   : header
    Created on : May 26, 2022, 2:27:08 AM
    Author     : hongd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar">
    <div class="brand"><a href="<c:url value="/public/home"/>">Quiz Online</a></div>
    <div class="search">
        <i class="fa-solid fa-magnifying-glass"></i>
        <input type="search" placeholder="Search anything...">
    </div>
    <c:if test="${sessionScope.acc == null}">
        <div class="auth">
            <a href="<c:url value="/common/login"/>">Login</a>
        </div>
    </c:if>
    <c:if test="${sessionScope.acc != null}">
        <div class="auth">
            <div><i class="fa-solid fa-user" class="dropbtn"></i> Hello, ${sessionScope.acc.fullname}</div>
            <div class="dropdown-content">
                <a href="<c:url value="/common/profile"/>">Profile</a>
                
                <a href="#changepass"data-toggle="modal"> <span>Change password</span></a>
                <a href="<c:url value="/public/logout"/>">Logout</a>
            </div>
        </div>
    </c:if>

</nav>
