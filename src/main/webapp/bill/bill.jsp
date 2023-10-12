<%--
  Created by IntelliJ IDEA.
  User: Quoc Dat Hang
  Date: 02/10/2023
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Quản Lý Bill</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://kit.fontawesome.com/4f6aa91745.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
            <li><a href="./bill">Hóa đơn</a></li>
        </ul>
        <div class="top-misc-layout"></div>
    </div>
</nav>

<main>
    <div class="card container px-6" style="height: 100vh; width: 60%">
        <c:if test="${message != null}">
            <h6 class="d-none" id="message">${message}</h6>
        </c:if>

        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <div>
                    <a class="btn btn-outline-secondary" href="/admin">Quay lại</a>
                </div>
                <form class="d-flex" action="/bill?page=${pageBill.currentPage}">
                    <input class="form-control me-2" style="width: 300px" type="text" id="searchSinger"
                           value="${searchBill}"
                           name="searchSinger" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Tìm kiếm</button>
                </form>
            </div>
        </nav>

        <table class="table table-striped">
            <tr>
                <td>
                    Id
                </td>
                <td>
                    Tên nguời dùng
                </td>
                <td>
                    Giảm giá
                </td>
                <td>
                    Thời gian tạo
                </td>
                <td>
                    Tổng hóa đơn
                </td>
            </tr>
            <c:forEach var="bill" items="${pageBill.content}">
                <tr>
                    <td>
                            ${bill.id}
                    </td>
                    <td>
                            ${bill.user.name}
                    </td>
                    <td>
                        <fmt:setLocale value="vi_VN"/>
                        <fmt:formatNumber value="${bill.discount}" pattern="#,##0 ¤"/>
                    </td>
                    <td>
                            ${bill.createAt.toString()}
                    </td>
                    <td>
                        <fmt:setLocale value="vi_VN"/>
                        <fmt:formatNumber value="${bill.total}" pattern="#,##0 ¤"/>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <nav aria-label="...">
            <c:set var="url" value="/bill?page="/>
            <ul class="pagination" style="background: white;">
                <li class="page-item <c:if test="${pageBill.currentPage == 1}" >disabled</c:if>"
                    style="line-height: 12px; margin: 0;">
                    <a class="page-link" href="${url}${(pageBill.currentPage - 1)}" tabindex="-1"
                       aria-disabled="true">Previous</a>
                </li>
                <c:forEach var="number" begin="1" end="${pageBill.totalPage}">
                    <c:if test="${number == pageBill.currentPage}">
                        <li class="page-item active" aria-current="page" style="line-height: 12px; margin: 0;">
                            <a class="page-link" href="${url}${number}">${number}</a>
                        </li>
                    </c:if>
                    <c:if test="${number != pageBill.currentPage}">
                        <li class="page-item" style="line-height: 12px; margin: 0;">
                            <a class="page-link" href="${url}${number}">${number}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <li class="page-item <c:if test="${pageBill.currentPage == pageBill.totalPage}">disabled</c:if>"
                    style="line-height: 12px; margin: 0;">
                    <a class="page-link" href="${url}${(pageBill.currentPage + 1)}">Next</a>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/script.js"></script>
<script>
    const message = document.getElementById('message');
    if (message !== null && message.innerHTML) {
        toastr.success(message.innerHTML);
    }
</script>
</body>

</html>