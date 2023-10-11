<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 9/18/2023
  Time: 9:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

<%--    <title>Title</title>--%>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">--%>
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
            <li><a href="./show">Show</a></li>
            <li><a href="./location">Địa điểm</a></li>
            <li><a href="#">Doanh thu</a></li>
            <li><a href="./singer">Ca sĩ</a></li>
            <li><a href="#">Hóa đơn</a></li>
        </ul>
        <div class="top-misc-layout"></div>
    </div>
</nav>
<div class="container">
    <div class="card container px-6" style="height: 100vh">
<%--        <h3 class="text-center">Location Management</h3>--%>
        <c:if test="${message != null}">
            <h6 class="d-none" id="message">${message}</h6>
        </c:if>
    <nav class="navbar navbar-light bg-light">
        <div class="container-fluid">
            <div>
                <a class="btn btn-outline-secondary" href="/admin">Quay lại</a>
                <a class="btn btn-outline-warning" href="/location?action=create">Thêm địa chỉ mới</a>
            </div>
            <form class="d-flex" action="/location?page=${page.currentPage}">
                <input class="form-control me-2" style="width: 300px" type="text" id="searchSinger" value="${searchs}"
                       name="search" placeholder="Tìm địa chỉ" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Tìm kiếm</button>
            </form>
        </div>
    </nav>
<%--        <div >--%>


<%--                <div>--%>
<%--                    <a href="/location?action=create" class="btn btn-primary mb-2">Create</a>--%>
<%--                </div>--%>
<%--                <form class="d-flex" action="/location?page=${page.currentPage}">--%>
<%--                    <input id="search" name="search" value="${searchs}" class="form-control me-2" type="text" placeholder="Enter key words to search" aria-label="search">--%>
<%--                    <button class="btn btn-outline-success" id="searchButton">Search</button>--%>
<%--                </form>--%>

<%--                &lt;%&ndash;                       <form action="/user?page=${page.currentPage}">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                         <input type="text" id="searchBook" value="${search}" name="search" class="form-control d-flex" style="width: 85%" placeholder="Search Book Title">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                       <button id="searchButton" class="btn btn-primary">Search</button>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                       </form>&ndash;%&gt;--%>

<%--                <div class="col-6">--%>

<%--                </div>--%>
<%--        </div>--%>

<%-->>>>>>> main--%>
        <table class="table table-striped" style="width: 100%">
            <tr>
                <td style="font-weight: bolder;">
                    ID
                </td>
                <td style="font-weight: bolder;">
                    CITY
                </td>
                <td style="font-weight: bolder;">
                    ADDRESS
                </td>
                <td style="font-weight: bolder;">
                    QUANTITY
                </td>
                <td style="font-weight: bolder;">
                    ACTION
                </td>
            </tr>
            <c:forEach var="location" items="${page.content}">
                <tr>
                    <td>
                            ${location.id}
                    </td>
                    <td>
                            ${location.city}
                    </td>
                    <td>
                            ${location.address}
                    </td>
                    <td>
                            ${location.seatList.size()}
                    </td>
                    <td>

                            <a class="btn btn-info" href="/location?action=edit&id=${location.id}">
                                Edit
                            </a>
                            <a class="btn btn-danger" onclick="return confirm('Do you want remove ${location.city} ?')"
                               href="/location?action=delete&id=${location.id}">
                                Delete
                            </a>

                            <%--                        <a href="user?action=edit&id=${user.id}" class="btn btn-primary">Edit</a>--%>
                            <%--                        <a class="btn btn-danger" onclick="return confirm('Do you want remove ${user.userName} ?')" href="/user?action=delete&id=${user.id}">--%>
                            <%--                            Delete--%>
                            <%--                        </a>--%>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <nav aria-label="...">
            <c:set var="url" value="/location?page="/>
            <ul class="pagination" style="background: white;">
                <li class="page-item <c:if test="${page.currentPage == 1}">disabled</c:if>
                    " style="line-height: 12px; margin: 0;">
                    <a class="page-link"  href="${url}${(page.currentPage - 1)}" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
                <c:forEach var="number" begin="1" end="${page.totalPage}">
                    <c:if test="${number == page.currentPage}">
                        <li class="page-item active" aria-current="page" style="line-height: 12px; margin: 0;">
                            <a class="page-link" href="${url}${number}">${number}</a>
                        </li>
                    </c:if>
                    <c:if test="${number != page.currentPage}">
                        <li class="page-item">
                            <a class="page-link" href="${url}${number}">${number}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <li class="page-item <c:if test="${page.currentPage == page.totalPage}">disabled</c:if>" style="line-height: 12px; margin: 0;">
                    <a class="page-link" href="${url}${(page.currentPage + 1)}">Next</a>
                </li>
            </ul>
        </nav>
<%--    <nav aria-label="...">--%>
<%--        <c:set var="url" value="/location?page="/>--%>
<%--        <ul class="pagination" style="background: white;">--%>
<%--            <li class="page-item <c:if test="${pageShow.currentPage == 1}" >disabled</c:if>"--%>
<%--                style="line-height: 12px; margin: 0;">--%>
<%--                <a class="page-link" href="${url}${(pageShow.currentPage - 1)}" tabindex="-1"--%>
<%--                   aria-disabled="true">Previous</a>--%>
<%--            </li>--%>
<%--            <c:forEach var="number" begin="1" end="${pageShow.totalPage}">--%>
<%--                <c:if test="${number == pageShow.currentPage}">--%>
<%--                    <li class="page-item active" aria-current="page" style="line-height: 12px; margin: 0;">--%>
<%--                        <a class="page-link" href="${url}${number}">${number}</a>--%>
<%--                    </li>--%>
<%--                </c:if>--%>
<%--                <c:if test="${number != pageShow.currentPage}">--%>
<%--                    <li class="page-item" style="line-height: 12px; margin: 0;">--%>
<%--                        <a class="page-link" href="${url}${number}">${number}</a>--%>
<%--                    </li>--%>
<%--                </c:if>--%>
<%--            </c:forEach>--%>
<%--            <li class="page-item <c:if test="${pageShow.currentPage == pageShow.totalPage}">disabled</c:if>"--%>
<%--                style="line-height: 12px; margin: 0;">--%>
<%--                <a class="page-link" href="${url}${(pageShow.currentPage + 1)}">Next</a>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </nav>--%>
    </div>


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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script>

    // const message = document.getElementById('message');
    // if (message !== null && message.innerHTML) {
    //     toastr.success(message.innerHTML);
    // }
    // const selectAllCheckbox = document.getElementById('selectAllCheckbox');
    // const checkboxes = document.getElementsByClassName('checkbox');
    // let checked = true;
    // selectAllCheckbox.addEventListener('click', function () {
    //     Array.from(checkboxes).forEach(function (checkbox) {
    //         checkbox.checked = checked;
    //
    //     });
    //     checked = !checked;
    // });
</script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/bootstrap.bundle.min.js"></script>
<script src="./js/script.js"></script>
</body>
</html>