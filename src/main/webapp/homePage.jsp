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
            <li><a href="/homePage">Trang chủ</a></li>
            <li><a href="/homePage?action=findByCity&city=HA NOI">Hà Nội</a></li>
            <li><a href="/homePage?action=findByCity&city=HUE">Huế</a></li>
            <li><a href="/homePage?action=findByCity&city=DA NANG">Đà nẵng</a></li>
            <li><a href="/homePage?action=findByCity&city=DA LAT">Đà lạt</a></li>
            <li><a href="/homePage?action=findByCity&city=SAI GON">Sài Gòn</a></li>
            <c:if test="${user != null}">
                <li><a href="#">
                    <span class="padding_10"></span></a>
                    <div class="dropdown" >

                        <button  class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user" aria-hidden="true"></i>
                                ${user.userName}
                        </button>

                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="display: flex;flex-direction: column;">
                           <ul style="padding-left: 0">
                              <c:if test="${user.role == 'ADMIN'}">
                               <li ><a style="color: #1b1e21; position: relative;" class="dropdown-item" href="/admin">Trang Quản lý</a></li>
                              </c:if>
                                <li ><a style="color: #1b1e21; position: relative;" class="dropdown-item" href="/auth?action=logout&message=Logout Success!">Logout</a></li>
                            </ul>
                        </div>

                    </div>
                </li>
            </c:if>
            <c:if test="${user == null}">
                <li><a href="/auth">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    <span class="padding_10">Login/Register</span></a>
                </li>
            </c:if>
        </ul>
        <div class="top-misc-layout"></div>
    </div>
</nav>

<main>

    <section class="d-flex flex-wrap" id="header">
        <c:if test="${message != null}">
            <h6 class="d-none" id="message">${message}</h6>
        </c:if>
        <!-- Phrase: about to happen -->
        <article id="phrase">
            <span>SẮP DIỄN RA</span>
        </article>
    </section>

    <!-- Main -->
    <section class="d-flex flex-wrap" id="content">
        <!-- parallax -->
        <article id="parallax">
            <div id="carouselExample" class="carousel slide" data-bs-interval="3000">
                <div class="carousel-inner">
                    <c:forEach var="show" items="${shows}">
                        <div class="carousel-item active">
                            <img src="./images/${show.seatDiagramImage}" class="d-block w-100" alt="...">
                        </div>
                    </c:forEach>
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
        <article class="mt-2">
            <form class="d-flex" style="justify-content: center; margin: 15px 0 60px 0;"
                  action="/homePage?page=${pageSinger.currentPage}">
                <input class="form-control me-2" style="width: 86%;border-width: 1px;border-color: #7c7e80;" type="text"
                       id="searchShow" value="${searchShow}"
                       name="searchShow" placeholder="Tìm show hoặc ca sĩ" aria-label="Search">
                <button class="btn btn-secondary" type="submit">Tìm kiếm</button>
            </form>
        </article>


        <!-- List event music -->
        <article id="list">
            <c:forEach var="show" items="${pageShow.content}">
                <a class="card" href="/ticket?showId=${show.id}" style="text-decoration: none">
                    <img src="./images/${show.poster}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title" style="padding-bottom: 10px">
                            <span style="color: #030378; text-transform: uppercase;">${show.singers}</span>
                        </h5>
                        <div class="d-flex justify-content-between">
                            <div class="mp-stage-title">${show.showName}</div>
                            <div class="mp-time">${show.timeStart}</div>
                        </div>
                        <div class="d-flex justify-content-between mt-2">
                            <div class="mp-singer-name">${show.singers}</div>
                            <div class="mp-branch-title"><span>CN: ${show.location.city}</span></div>
                        </div>
                        <div class="d-flex justify-content-between mt-2">
                            <div class="mp-price-title">Giá chỉ từ ${show.ticketInfor.standard} VND</div>
                        </div>
                    </div>
                </a>
            </c:forEach>
            <c:forEach var="show" items="${pageShowsByCity.content}">
                <a href="/ticket?showId=${show.id}" class="card" style="width: 100%; text-decoration: none">
                    <img src="./images/${show.poster}" class="card-img-top" alt="...">
                    <div class="card-body ">
                        <h5 class="card-title" style="padding-bottom: 10px">
                            <span style="color: #030378; text-transform: uppercase">${show.singers}</span>
                        </h5>
                        <div class="d-flex justify-content-between">
                            <div class="mp-stage-title">${show.showName}</div>
                            <div class="mp-time">${show.timeStart}</div>
                        </div>
                        <div class="d-flex justify-content-between mt-2">
                            <div class="mp-singer-name">${show.singers}</div>
                            <div class="mp-branch-title"><span>CN: ${show.location.city}</span></div>
                        </div>
                        <div class="d-flex justify-content-between mt-2">
                            <div class="mp-price-title">Giá chỉ từ ${show.ticketInfor.standard} VND</div>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </article>


        <c:if test="${pageShow.content.size() != null}">
            <nav aria-label="...">
                <c:set var="url" value="/homePage?page="/>
                <ul class="pagination" style="background: white; display: flex; justify-content: center">
                    <li class="page-item <c:if test="${pageShow.currentPage == 1}" >disabled</c:if>"
                        style="line-height: 12px; margin: 0;">
                        <a class="page-link" href="${url}${(pageShow.currentPage - 1)}" tabindex="-1"
                           aria-disabled="true">Previous</a>
                    </li>
                    <c:forEach var="number" begin="1" end="${pageShow.totalPage}">
                        <c:if test="${number == pageShow.currentPage}">
                            <li class="page-item active" aria-current="page" style="line-height: 12px; margin: 0;">
                                <a class="page-link" href="${url}${number}">${number}</a>
                            </li>
                        </c:if>
                        <c:if test="${number != pageShow.currentPage}">
                            <li class="page-item" style="line-height: 12px; margin: 0;">
                                <a class="page-link" href="${url}${number}">${number}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <li class="page-item <c:if test="${pageShow.currentPage == pageShow.totalPage}">disabled</c:if>"
                        style="line-height: 12px; margin: 0;">
                        <a class="page-link" href="${url}${(pageShow.currentPage + 1)}">Next</a>
                    </li>
                </ul>
            </nav>
        </c:if>

        <c:if test="${pageShowsByCity.content.size() != null}">
            <nav aria-label="...">
                <c:set var="url" value="/homePage?page="/>
                <ul class="pagination" style="background: white; display: flex; justify-content: center">
                    <li class="page-item <c:if test="${pageShowsByCity.currentPage == 1}" >disabled</c:if>"
                        style="line-height: 12px; margin: 0;">
                        <a class="page-link" href="${url}${(pageShowsByCity.currentPage - 1)}" tabindex="-1"
                           aria-disabled="true">Previous</a>
                    </li>
                    <c:forEach var="number" begin="1" end="${pageShowsByCity.totalPage}">
                        <c:if test="${number == pageShowsByCity.currentPage}">
                            <li class="page-item active" aria-current="page" style="line-height: 12px; margin: 0;">
                                <a class="page-link" href="${url}${number}">${number}</a>
                            </li>
                        </c:if>
                        <c:if test="${number != pageShowsByCity.currentPage}">
                            <li class="page-item" style="line-height: 12px; margin: 0;">
                                <a class="page-link" href="${url}${number}">${number}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <li class="page-item <c:if test="${pageShowsByCity.currentPage == pageShowsByCity.totalPage}">disabled</c:if>"
                        style="line-height: 12px; margin: 0;">
                        <a class="page-link" href="${url}${(pageShowsByCity.currentPage + 1)}">Next</a>
                    </li>
                </ul>
            </nav>
        </c:if>

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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script>
    const message = document.getElementById('message');
    if (message !== null && message.innerHTML) {
        toastr.success(message.innerHTML);
    }
</script>
<script>

</script>
</body>

</html>