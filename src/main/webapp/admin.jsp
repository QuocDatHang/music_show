<%--
  Created by IntelliJ IDEA.
  User: Quoc Dat Hang
  Date: 02/10/2023
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Admin</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://kit.fontawesome.com/4f6aa91745.js" crossorigin="anonymous"></script>

    <style>
        .background-div {
            background-image: url("./images/adminPage.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            width: 100%; /* Đảm bảo rằng div chiếm toàn bộ chiều ngang */
            height: 100vh; /* Đặt chiều cao của div bằng chiều cao của viewport */
        }
    </style>
</head>

<body>
<header>
    <div class="d-flex justify-content-between" id="logo">
        <div class="header-social d-flex align-self-center text-align-center">
            <a href="#" class="header-social-link" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="header-social-link" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="#" class="header-social-link" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
        <image class="header-logo" src="images/MAYLANGTHANG_LOGO.png"></image>
        <div class="top-misc-layout"></div>
    </div>
</header>

<nav>
    <div class="d-flex justify-content-between" id="link">
        <div class="top-misc-layout"></div>
        <ul>
            <li><a href="./homePage">Trang chủ</a></li>
            <li><a href="./show">Show</a></li>
            <li><a href="./location">Địa điểm</a></li>
            <li><a href="./revenue">Doanh thu</a></li>
            <li><a href="./singer">Ca sĩ</a></li>
            <li><a href="./bill">Hóa đơn</a></li>
        </ul>
        <div class="top-misc-layout"></div>
    </div>
</nav>

<div class="background-div"></div>

<footer id="footer">
    <div class="d-flex justify-content-center align-items-center footer-logo" id="footer-logo">
        <image class="footer-logo__img" src="images/MAYLANGTHANG_LOGO_WHITE.png"></image>
    </div>

    <div class="footer-copy">
        <p class="footer-copy__text">All Rights Reserved</p>
        <ul>
            <li>
                <a class="footer-copy__link" href="#">Về chúng tôi</a>
                <span>&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;</span>
            </li>
            <li>
                <a class="footer-copy__link" href="#"> Liên hệ</a>
                <span>&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;</span>
            </li>
            <li>
                <a class="footer-copy__link" href="#"> Diều khoản và chính sách</a>
            </li>
        </ul>
    </div>
</footer>

<script src="./js/bootstrap.min.js"></script>
<script src="./js/bootstrap.bundle.min.js"></script>
<script src="./js/script.js"></script>
</body>

</html>