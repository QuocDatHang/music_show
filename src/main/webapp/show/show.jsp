<%--
  Created by IntelliJ IDEA.
  User: Quoc Dat Hang
  Date: 02/10/2023
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Management Page</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://kit.fontawesome.com/4f6aa91745.js" crossorigin="anonymous"></script>
</head>

<body>
<header>
    <div class="d-flex justify-content-between" id="logo">
        <div class="header-social d-flex align-self-center text-align-center">
            <a href="#" class="header-social-link" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="header-social-link" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="#" class="header-social-link" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
        <image class="header-logo" src="../images/MAYLANGTHANG_LOGO.png"></image>
        <div class="top-misc-layout"></div>
    </div>
</header>

<nav>
    <div class="d-flex justify-content-between" id="link">
        <div class="top-misc-layout"></div>
        <ul>
            <li><a href="./show">Show</a></li>
            <li><a href="#">Địa điểm</a></li>
            <li><a href="#">Doanh thu</a></li>
            <li><a href="./singer">Ca sĩ</a></li>
            <li><a href="#">Hóa đơn</a></li>
        </ul>
        <div class="top-misc-layout"></div>
    </div>
</nav>

<main>
    <div class="d-grid gap-2 col-2 mx-auto">
        <a class="btn btn-warning" href ="/show?action=showCreate">Create new show</a>
    </div>
    <!-- List event mucsic -->
    <article id="list">
        <c:forEach var="show" items="${paperShow.content}">

        <div class="card" style="width: 100%;">
            <img src="../images/list-pic1.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><a href="#">Bùi Lan Hương</a></h5>
                <div class="d-flex justify-content-between">
                    <div class="mp-stage-title">Chiều nhạc trên mây</div>
                    <div class="mp-time">06/10/2023 17:00</div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div class="mp-singer-name">Lương Bích Hữu - Vicky Nhung & Khách mời: Vũ Thịnh</div>
                    <div class="mp-branch-title"><a href="#">CN: Đà Lạt</a></div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div class="mp-price-title">Giá vé 100.000 VND</div>
                </div>
            </div>
        </div>

        </c:forEach>


        <div class="card" style="width: 100%;">
            <img src="../images/list-pic2.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><a href="#">Lê Hiếu</a></h5>
                <div class="d-flex justify-content-between">
                    <div class="mp-stage-title">Chiều nhạc trên mây</div>
                    <div class="mp-time">06/10/2023 17:00</div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div class="mp-singer-name">Lương Bích Hữu - Vicky Nhung & Khách mời: Vũ Thịnh</div>
                    <div class="mp-branch-title"><a href="#">CN: Đà Lạt</a></div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div class="mp-price-title">Giá vé 100.000 VND</div>
                </div>
            </div>
        </div>
        <div class="card" style="width: 100%;">
            <img src="../images/list-pic3.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><a href="#">Thanh Hà</a></h5>
                <div class="d-flex justify-content-between">
                    <div class="mp-stage-title">Chiều nhạc trên mây</div>
                    <div class="mp-time">06/10/2023 17:00</div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div class="mp-singer-name">Lương Bích Hữu - Vicky Nhung & Khách mời: Vũ Thịnh</div>
                    <div class="mp-branch-title"><a href="#">CN: Đà Lạt</a></div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div class="mp-price-title">Giá vé 100.000 VND</div>
                </div>
            </div>
        </div>
        <div class="card" style="width: 100%;">
            <img src="../images/list-pic4.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><a href="#">Thu Minh</a></h5>
                <div class="d-flex justify-content-between">
                    <div class="mp-stage-title">Chiều nhạc trên mây</div>
                    <div class="mp-time">06/10/2023 17:00</div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div class="mp-singer-name">Lương Bích Hữu - Vicky Nhung & Khách mời: Vũ Thịnh</div>
                    <div class="mp-branch-title"><a href="#">CN: Đà Lạt</a></div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div class="mp-price-title">Giá vé 100.000 VND</div>
                </div>
            </div>
        </div>
        <div class="card" style="width: 100%;">
            <img src="../images/list-pic5.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><a href="#">Mai Tiến Dũng & Thảo Trang</a></h5>
                <div class="d-flex justify-content-between">
                    <div class="mp-stage-title">Chiều nhạc trên mây</div>
                    <div class="mp-time">06/10/2023 17:00</div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div class="mp-singer-name">Lương Bích Hữu - Vicky Nhung & Khách mời: Vũ Thịnh</div>
                    <div class="mp-branch-title"><a href="#">CN: Đà Lạt</a></div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div class="mp-price-title">Giá vé 100.000 VND</div>
                </div>
            </div>
        </div>
        <div class="card" style="width: 100%;">
            <img src="../images/list-pic6.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><a href="#">Tăng Phúc</a></h5>
                <div class="d-flex justify-content-between">
                    <div class="mp-stage-title">Chiều nhạc trên mây</div>
                    <div class="mp-time">06/10/2023 17:00</div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div class="mp-singer-name">Lương Bích Hữu - Vicky Nhung & Khách mời: Vũ Thịnh</div>
                    <div class="mp-branch-title"><a href="#">CN: Đà Lạt</a></div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div class="mp-price-title">Giá vé 100.000 VND</div>
                </div>
            </div>
        </div>
    </article>

    <footer id="footer">
        <div class="d-flex justify-content-center align-items-center footer-logo" id="footer-logo">
            <image class="footer-logo__img" src="../images/MAYLANGTHANG_LOGO_WHITE.png"></image>
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