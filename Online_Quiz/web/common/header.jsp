<%-- 
    Document   : header
    Created on : May 26, 2022, 2:27:08 AM
    Author     : hongd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar">
    <div class="brand"><a style="text-decoration: none; color: black" href="<c:url value="/public/home"/>">Quiz Online</a>
    <a href="#" onclick="openNav()"><i class="fa-solid fa-bars"></i></a>
    </div>
    
    <c:if test="${sessionScope.acc == null}">
        <div class="auth">
            <input type="button" value="Login" id="nav-login">
        </div>
    </c:if>
    <c:if test="${sessionScope.acc != null}">
        <div class="auth">
            <div><i class="fa-solid fa-user" class="dropbtn"></i> Hello, ${sessionScope.acc.fullname}</div>
            
            <div class="dropdown-content">
                <a href="<c:url value="/common/profile"/>">Profile</a>              
                <a id="changepass-nav" data-toggle="modal"> Change password</a>
                <a href="<c:url value="/public/logout"/>">Logout</a>
            </div>
        </div>
    </c:if>

    <!-- <div class="auth">
       <i class="fa-solid fa-user" class="dropbtn"></i>
        <div class="dropdown-content">
            <a href="#">Hello Admin</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
        </div>
    </div> -->



</nav>
<div class="container">
    <div class="row">
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="login-tab" data-bs-toggle="tab"
                                        data-bs-target="#login" type="button" role="tab" aria-controls="login"
                                        aria-selected="true">Login</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="register-tab" data-bs-toggle="tab"
                                        data-bs-target="#register" type="button" role="tab" aria-controls="register"
                                        aria-selected="false">Register</button>
                            </li>
                        </ul>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="modal-body">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="login" role="tabpanel"
                                 aria-labelledby="login-tab">
                                <!--                                            <form action="">-->
                                <div class="form-group">
                                    <label for="login-email">Email:</label>
                                    <input type="email" class="form-control" id="login-email"
                                           placeholder="Enter email" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="pwd">Password:</label>
                                    <input type="password" class="form-control" id="login-pwd"
                                           placeholder="Enter password" name="pwd">
                                </div>
                                <div class="alert" role="alert" id="alert-login-modal">

                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="remember"> Remember me</label>
                                </div>
                                <!--                                <p>Forgot password? <a href="#" id="redirect-forgot">click here!</a></p>-->
                                <a href="<c:url value="/common/sendmail.jsp"/>">Forgot password?</a>
                                <button id="login-btn" type="submit" class="btn btn-primary">Login</button>
                                <!--                                            </form>-->
                            </div>
                            <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                                <!--                                <form action="">-->
                                <div class="form-group">
                                    <label for="name">Full Name</label>
                                    <input type="text" class="form-control" id="name"
                                           placeholder="Your Fullname" name="name">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <select name="gender" id="gender">
                                        <option value="">Please choose your gender</option>
                                        <option value="true">Male</option>
                                        <option value="false">Female</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="register-email">Email</label>
                                    <input type="email" class="form-control" id="register-email"
                                           placeholder="Enter email" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="text" class="form-control" id="phone"
                                           placeholder="Enter phone number" name="phone">
                                </div>
                                <div class="form-group">
                                    <label for="pass">Password</label>
                                    <input type="password" class="form-control" id="register-pass"
                                           placeholder="Enter password" name="pass">
                                </div>
                                <div class="alert" role="alert" id="alert-register-modal">

                                </div>
                                <button id="register-btn" type="submit" class="btn btn-primary">Register</button>
                                <!--                                </form>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="forgot-modal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">&nbsp;Forgot password!</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="">
                            <div class="form-group">
                                <label for="forgot-email">Email</label>
                                <input type="email" class="form-control" id="forgot-email" placeholder="Enter email"
                                       name="email">
                            </div>
                            <div class="alert" role="alert" id="alert-login-modal">

                            </div>
                            <button type="submit" class="btn btn-primary">Send</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="changepass-modal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">&nbsp;Change Password</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <label for="pass">Password</label>
                            <input type="password" class="form-control" id="pass"
                                   placeholder="Enter password" name="password">
                        </div>
                        <div class="form-group">
                            <label for="pass">New Password</label>
                            <input type="password" class="form-control" id="new-pass"
                                   placeholder="Enter New password" name="newpassword">
                        </div>
                        <div class="form-group">
                            <label for="pass">Confirm Password</label>
                            <input type="password" class="form-control" id="con-pass"
                                   placeholder="Enter Confirm password" name="connewpassword">
                        </div>
                        <div class="alert" role="alert" id="alert-changepass-modal">

                        </div>
                        <button id="changepass-btn" type="submit" class="btn btn-primary">Change password</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


