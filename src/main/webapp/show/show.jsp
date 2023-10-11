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
    <title>Trang quản lý show</title>
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
            <li><a href="./location">Địa điểm</a></li>
            <li><a href="#">Doanh thu</a></li>
            <li><a href="./singer">Ca sĩ</a></li>
            <li><a href="#">Hóa đơn</a></li>
        </ul>
        <div class="top-misc-layout"></div>
    </div>
</nav>

<main>

    <div class="card container px-6" style="height: 250vh; width: 100%">
        <c:if test="${message != null}">
            <h6 class="d-none" id="message">${message}</h6>
        </c:if>

        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <div>
                    <a class="btn btn-outline-secondary" href="/admin">Quay lại</a>
                    <a class="btn btn-outline-warning" href="/show?action=showCreate">Tạo show mới</a>
                </div>
                <form class="d-flex" action="/show?page=${pageShow.currentPage}">
                    <input class="form-control me-2" style="width: 300px" type="text" id="searchShow"
                           value="${searchShow}"
                           name="searchShow" placeholder="Tìm tên show" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Tìm kiếm</button>
                </form>
            </div>
        </nav>

        <table class="table table-striped" style="width: 100%">
            <tr>
                <td>
                    Id
                </td>
                <td>
                    Tên show
                </td>
                <td>
                    Thời gian bắt đầu
                </td>
                <td>
                    Thời gian kết thúc
                </td>
                <td>
                    Địa điểm
                </td>
                <td>
                    Ca sĩ
                </td>
                <td style="width: 153px">
                    Thông tin vé
                </td>
                <td>
                    Ảnh bìa
                </td>
                <td>
                    Ảnh quảng cáo
                </td>
                <td style="text-align: center">
                    Chọn
                </td>
            </tr>
            <c:forEach var="show" items="${pageShow.content}">
                <tr>
                    <td>
                            ${show.id}
                    </td>
                    <td>
                            ${show.showName}
                    </td>
                    <td>
                            ${show.timeStart}
                    </td>
                    <td>
                            ${show.timeEnd}
                    </td>
                    <td>
                            ${show.location.address}
                    </td>
                    <td>
                            ${show.singers}
                    </td>
                    <td>
                        Premium: ${show.ticketInfor.premium} <br>
                        Vip: ${show.ticketInfor.vip} <br>
                        Standard:${show.ticketInfor.standard}
                    </td>
                    <td>
                        <img src="../images/${show.poster}">
                    </td>
                    <td>
                        <img src="../images/${show.seatDiagramImage}">
                    </td>
                    <td style="text-align: center">
                        <a class="btn btn-info" href="/show?action=showEdit&id=${show.id}">
                            Sửa
                        </a>
                        <a class="btn btn-danger"
                           onclick="return confirm('Do you want remove ${show.showName} ?')"
                           href="/show?action=delete&id=${show.id}&page=${pageShow.currentPage}">
                            Xóa
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <nav aria-label="...">
            <c:set var="url" value="/show?page="/>
            <ul class="pagination" style="background: white;">
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
    </div>

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