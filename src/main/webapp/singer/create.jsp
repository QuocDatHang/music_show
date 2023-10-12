<%--
  Created by IntelliJ IDEA.
  User: Quoc Dat Hang
  Date: 02/10/2023
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Ca Sĩ Mới</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://kit.fontawesome.com/4f6aa91745.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.9/jquery.datetimepicker.css" integrity="sha512-bYPO5jmStZ9WI2602V2zaivdAnbAhtfzmxnEGh9RwtlI00I9s8ulGe4oBa5XxiC6tCITJH/QG70jswBhbLkxPw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
s
<body>
<header style="padding: 0;">
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
            <li><a href="./show">Show</a></li>
            <li><a href="./location">Địa điểm</a></li>
            <li><a href="#">Doanh thu</a></li>
            <li><a href="./singer">Ca sĩ</a></li>
            <li><a href="./bill">Hóa đơn</a></li>
        </ul>
        <div class="top-misc-layout"></div>
    </div>
</nav>

<main>
    <div style="text-align: center; font-size: large; font-weight: bold; padding-top:10px;">
        THÊM CA SĨ MỚI
    </div>
    <div class="card container px-6" style="height: 100vh; width: 45%; background-color: #eceeee">
        <form action="/singer?action=create" method="post" style="padding: 0 20px">
            <div class=" row mb-3" style="padding-top:10px;">
                <label for="singerName" class="form-label">Tên ca sĩ:</label>
                <input type="text" class="form-control" id="singerName" name="singerName" required>
            </div>
            <div class="row mb-3" style="padding-top:10px;">
                <label for="salary" class="form-label">Cát xê:</label>
                <input type="number" class="form-control col-10" style="text-align: right" name="salary" id="salary" required>
                <span class="input-group-text col">VND</span>
            </div>
            <button type="submit" class="btn btn-primary mb-2">Xác nhận</button>
            <a href="/singer" class="btn btn-success mb-2">Huỷ</a>
        </form>
    </div>


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

</main>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/script.js"></script>

</body>

</html>