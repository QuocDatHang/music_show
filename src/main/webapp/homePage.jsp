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
    <title>Mây Lang Thang</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="css/style.css">
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
        <image class="header-logo" src="images/MAYLANGTHANG_LOGO.png"></image>
        <div class="top-misc-layout"></div>
    </div>
</header>

<nav>
    <div class="d-flex justify-content-between" id="link">
        <div class="top-misc-layout"></div>
        <ul>
            <li><a href="#">Trang chủ</a></li>
            <li><a href="#">Đà lạt</a></li>
            <li><a href="#">Đà nẵng</a></li>
            <li><a href="#">Cần Thơ</a></li>
            <li><a href="#">Sài Gòn</a></li>
            <li><a href="#">Hà Nội</a></li>
        </ul>
        <div class="top-misc-layout"></div>
    </div>
</nav>

<main>
    <section class="d-flex flex-wrap" id="header">
        <!-- Phrase: about to happen -->
        <article id="phrase">
            <span>Sắp diễn ra</span>
        </article>
    </section>

    <!-- Main -->
    <section class="d-flex flex-wrap" id="content">
        <!-- parallax -->
        <article id="parallax">
            <div id="carouselExample" class="carousel slide">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./images/pic1.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="./images/pic2.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="./images/pic3.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </article>

        <!-- Search -->
        <article class="mt-2" id="search">
            <form action="" class="d-flex">
                <div class="p-2 flex-grow-1">
                    <input type="text" placeholder="Tìm kiếm theo show">
                </div>
                <div class="p-2 flex-grow-1">
                    <input type="text" placeholder="hoặc tìm kiếm theo ca sĩ">
                </div>
                <div class="p-2">
                    <button class="btn" type="submit">Tìm kiếm</button>
                </div>
            </form>
        </article>

        <!-- Sort -->
        <article id="sort">
            <div class="d-flex justify-content-between">
                <div class="p-2 d-flex flex-column sort">
                    <span class="sort-text mb-2">Chọn chi nhánh</span>
                    <select class="sort-select">
                        <option value="1" selected>Tất cả chi nhánh</option>
                        <option value="2">Đà lạt</option>
                        <option value="3">Đà Nẵng</option>
                        <option value="4">Cần Thơ</option>
                        <option value="5">Sài Gòn</option>
                        <option value="6">Hà Nội</option>
                    </select>
                </div>
                <div class="p-2"></div>
                <div class="p-2 d-flex flex-column sort">
                    <span class="sort-text mb-2">Chọn chi nhánh</span>
                    <select class="sort-select">
                        <option value="1" selected>Tất cả chi nhánh</option>
                        <option value="2">Đà lạt</option>
                        <option value="3">Đà Nẵng</option>
                        <option value="4">Cần Thơ</option>
                        <option value="5">Sài Gòn</option>
                        <option value="6">Hà Nội</option>
                    </select>
                </div>
            </div>
        </article>

        <!-- List event mucsic -->
        <article id="list">
            <div class="card" style="">
                <img src="./images/list-pic1.jpg" class="card-img-top" alt="...">
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
            <div class="card" style="width: 100%;">
                <img src="./images/list-pic2.jpg" class="card-img-top" alt="...">
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
                <img src="./images/list-pic3.jpg" class="card-img-top" alt="...">
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
                <img src="./images/list-pic4.jpg" class="card-img-top" alt="...">
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
                <img src="./images/list-pic5.jpg" class="card-img-top" alt="...">
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
                <img src="./images/list-pic6.jpg" class="card-img-top" alt="...">
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
    </section>

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

<script src="./js/bootstrap.min.js"></script>
<script src="./js/bootstrap.bundle.min.js"></script>
<script src="./js/script.js"></script>
</body>

</html>