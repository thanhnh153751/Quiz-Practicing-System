<%-- 
    Document   : index2
    Created on : Jun 6, 2022, 8:55:29 PM
    Author     : hongd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>JSP Page</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="../css/index2.css">
        <link rel="stylesheet" href="../css/slick/slick.css">
        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/sidenav.css">
    </head>

    <body id="page-top">
        <!-- Navigation-->
        <jsp:include page="../common/header.jsp"></jsp:include>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Welcome To Quiz Online!</div>
                <div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
                <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>
            </div>
        </header>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">L???p tr??nh
                        l?? xu th??? c???a t????ng lai</h2>
                    <br>
                    <br>

                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Ph??t tri???n t?? duy s??ng t???o</h4>
                        <p class="text-muted">H???c c??ch vi???t code gi??p b???n trau d???i t?? duy logic v?? ????a b???n ?????n m???t c???p ????? gi???i quy???t v???n ????? ho??n to??n m???i.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">L??m quen th??? gi???i c??ng ngh???</h4>
                        <p class="text-muted">H???c l???p tr??nh gi??p b???n th??n thi???t h??n v???i th??? gi???i c??ng ngh???, th??ch nghi v???i cu???c s???ng th???i ?????i 4.0.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">M??? r???ng c?? h???i ngh??? nghi???p</h4>
                        <p class="text-muted">C??ng vi???c l???p tr??nh ??ang t??ng nhanh 50% so v???i th??? tr?????ng vi???c l??m n??i chung v???i m???c l????ng cao h??n trung b??nh 30%.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Nh???ng kh??a h???c c?? b???n </h2>
                    <br>
                    <br>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                                
                                <img class="img-fluid" src="../assets/img/portfolio/C.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">L???p tr??nh h?????ng ?????i t?????ng trong c++</div>
                                <br>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 2-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
                                
                                <img class="img-fluid" src="../assets/img/portfolio/Ca.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">C# c?? b???n</div>
                                <br>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 3-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
                                
                                <img class="img-fluid" src="../assets/img/portfolio/JS.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">JavaScript C?? b???n</div>
                                <br>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                        <!-- Portfolio item 4-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal4">
                                
                                <img class="img-fluid" src="../assets/img/portfolio/Python.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Phython c?? b???n</div>
                                <br>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                        <!-- Portfolio item 5-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal5">
                                
                                <img class="img-fluid" src="../assets/img/portfolio/Java.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Java c?? b???n</div>
                                <br>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <!-- Portfolio item 6-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal6">
                                
                                <img class="img-fluid" src="../assets/img/portfolio/SQL.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">L??m quen v???i SQL</div>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About-->
        <section class="page-section" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">H???c vi??n n??i g?? v??? Quiz Online</h2>
                    <br>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="../assets/img/about/1.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Nguy???n ????ng Quang</h4>
                                <h4 class="subheading">L???p tr??nh vi??n</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">???Em ho??n to??n kh??ng bi???t m??nh n??n b???t ?????u t??? ????u khi b???t ?????u h???c l???p tr??nh t??? con s??? 0. Quiz Online ???? gi??p em v???ch r?? l??? tr??nh, khi???n vi???c h???c c???a em d??? d??ng h??n r???t nhi???u.???</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="../assets/img/about/2.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Gia Minh</h4>
                                <h4 class="subheading">H???c Sinh - 11 tu???i</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">???Ch??u r???t th??ch h???c t???i Quiz Online . Kh??ng ch??? c?? nhi???u kh??a h???c ph?? h???p v???i ch??u, c??c b??i t???p c??ng ??a d???ng, ph???n b??i gi???i m???u c??ng r???t chi ti???t. Ch??u c???m th???y m??nh ???? ti???n b??? r???t nhi???u v?? mong mu???n trong t????ng lai c?? th??? tr??? th??nh m???t l???p tr??nh vi??n gi???i!???</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="../assets/img/about/3.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>V?? Ho??ng B???o Trung </h4>
                                <h4 class="subheading">L???p Tr??nh Vi??n</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">???Quiz Online ???? gi??p t??i h???c code hi???u qu??? h??n. B??n c???nh c??c kh??a h???c v?? b??i t???p ph?? h???p, QuizOnline c??n x??y d???ng m???t c???ng ?????ng nh???ng ng?????i h???c l???p tr??nh ????? ch??ng t??i c?? th??? c??ng h???c, c??ng ti???n b???.???</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="../assets/img/about/4.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Nguy???n ????ng Giang</h4>
                                <h4 class="subheading">Sinh Vi??n C??ng Ngh???</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">???T??i ho??n to??n kh??ng bi???t m??nh n??n b???t ?????u t??? ????u khi b???t ?????u h???c l???p tr??nh t??? con s??? 0,Quiz Online ???? gi??p t??i h???c code hi???u qu??? h??n.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>
                                Be Part
                                <br />
                                Of Our
                                <br />
                                Story!
                            </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <!-- Team-->
        <section class="page-section bg-light" id="team">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Th??nh vi??n trong nh??m</h2>
                    <br>
                    <br>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="../assets/img/team/1.jpg" alt="..." />
                            <h4>Parveen Anand</h4>
                            <p class="text-muted">Lead Designer</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand Twitter Profile"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand Facebook Profile"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="../assets/img/team/2.jpg" alt="..." />
                            <h4>Diana Petersen</h4>
                            <p class="text-muted">Lead Marketer</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Diana Petersen Twitter Profile"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Diana Petersen Facebook Profile"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Diana Petersen LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="../assets/img/team/3.jpg" alt="..." />
                            <h4>Larry Parker</h4>
                            <p class="text-muted">Lead Developer</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker Twitter Profile"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker Facebook Profile"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p></div>
                </div>
            </div>
        </section>
        <!-- Clients-->
        <div class="py-5">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="../assets/img/logos/microsoft.svg" alt="..." aria-label="Microsoft Logo" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="../assets/img/logos/google.svg" alt="..." aria-label="Google Logo" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="../assets/img/logos/facebook.svg" alt="..." aria-label="Facebook Logo" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="../assets/img/logos/ibm.svg" alt="..." aria-label="IBM Logo" /></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact-->
        <section id="footer-banner" class="landing-section" style="color: white; text-align: center; background-image: url(../assets/img/footer-banner-bg.png)">
            <div class="container">
                <h2 class="title-section">KH??I D???Y ??AM M?? <span style="color:#FAD93C">L???P TR??NH</span>!</h2>
                <h4>????ng k?? t??i kho???n v?? tham gia ngay h??m nay!</h4>
                <a class="btn btn-important" href="#frmSignup" title="B???t ?????u ngay!">B???t ?????u ngay!</a>
            </div>
        </section>
        <!-- Footer-->
        <jsp:include page="../common/footer.jsp"></jsp:include>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <script src="../js/jquery/jquery.js"></script>
        <script src="../js/jquery/jquery-migrate.js"></script>
        <script src="../js/boostrap/bootstrap.min.js"></script>
        <script src="../js/slick/slick.min.js"></script>
        <script src="../js/index.js"></script>
        <script src="../js/sidenav.js"></script>
    </body>
</html>
