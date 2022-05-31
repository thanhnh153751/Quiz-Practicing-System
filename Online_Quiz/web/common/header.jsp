<%-- 
    Document   : header
    Created on : May 26, 2022, 2:27:08 AM
    Author     : hongd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar">
    <div class="brand"><a href="<c:url value="/home"/>">Quiz Online</a></div>
    <div class="search">
        <i class="fa-solid fa-magnifying-glass"></i>
        <input type="search" placeholder="Search anything...">
    </div>
    <div class="auth">
        <c:if test="${sessionScope.acc != null}">
            Hello ${sessionScope.acc.fullname}
            <a href="logout">Logout</a>
            <div class="dropdown-content">=
                <a href="<c:url value="/home"/>">Trang quản lí</a>
                <a href="<c:url value="/profile"/>">Thông tin tài khoản</a>
                <a href="<c:url value="/changepass"/>">Doi mat khau</a>
                <a href="<c:url value="/logout"/>">Đăng xuất</a>
            </div>
        </c:if>
        <c:if test="${sessionScope.acc == null}">
            <a href="<c:url value="/login"/>">Login</a>
        </c:if>


    </div>
</nav>
