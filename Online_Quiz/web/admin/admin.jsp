<%-- 
    Document   : admin
    Created on : Jun 1, 2022, 3:40:42 PM
    Author     : hongd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
    </script>
    <link rel="stylesheet" href="../css/admin.css">
    <script src="../js/admin.js"></script>
    <title>Document</title>
</head>

<body>
    <nav class="navbar">
        <div class="brand">Quiz Online
            <a href="#" onclick="openNav()"><i class="fa-solid fa-bars"></i></a>

        </div>
        <div class="search">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="search" placeholder="Search anything...">
        </div>
        <div class="auth">
            <a href="./login.html">Login</a>
            <a href="./register.html">Register</a>
        </div>
    </nav>

    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="./admin.html">Dashboard</a>
        <a href="./dashboard.html">Subject</a>
        <a href="#">Clients</a>
        <a href="#">Contact</a>
    </div>

    <!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
    <div id="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h1>Dashboard</h1>
                </div>

                <div class="col-md-3">
                    <div class="wrapper">
                        <div class="item text-center">
                            <h2>10</h2>
                            <p>Member Online</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="wrapper">
                        <div class="item text-center">
                            <h2>10</h2>
                            <p>Member Online</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="wrapper">
                        <div class="item text-center">
                            <h2>10</h2>
                            <p>Member Online</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="wrapper">
                        <div class="item text-center">
                            <h2>10</h2>
                            <p>Member Online</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 ">
                        <h3>Revenue </h3>
                        <canvas id="myChart" style="width: 100%; height: 350px;"></canvas>
                    </div>  
                    <div class="col-md-6 ">
                        <h3>Top sales course </h3>
                        <canvas id="myChart2" style="width: 100%; height: 350px;"></canvas>
                    </div>  
                </div>
                
            </div>
        </div>
    </div>
</body>
<script>
    const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: 'Revenue',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    const ctx2 = document.getElementById('myChart2').getContext('2d');
    const myChart2 = new Chart(ctx2, {
        type: 'doughnut',
        data: {
            labels: ['A', 'B', 'C', 'D', 'E', 'F'],
            datasets: [{
                label: 'Revenue',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

</html>
