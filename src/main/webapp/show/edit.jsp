<%@ page import="com.example.music_show.utils.DateTimeUtils" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
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
    <title>Sửa Show</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://kit.fontawesome.com/4f6aa91745.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/jquery.datetimepicker.css">
    <%--    multi-select-tag--%>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/habibmhamadi/multi-select-tag/dist/css/multi-select-tag.css">
</head>

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
        Sửa Show
    </div>
    <div class="container" style="width: 50%">
        <form action="/show?action=edit&showId=${showEdit.id}" method="post" enctype="multipart/form-data">
            <div class="mb-3" style="padding-top:10px;">
                <label for="showName" class="form-label">Tên show</label>
                <input type="text" class="form-control" id="showName" name="showName" value="${showEdit.showName}"
                       required>
            </div>
            <div class="mb-3">
                <label for="timeStart" class="form-label">Thời gian bắt đầu</label>
                <input type="text" class="form-control" id="timeStart" name="timeStart"
                       value="${showDtoEdit.timeStart}"
                       required>
            </div>
            <div class="mb-3">
                <label for="timeEnd" class="form-label">Thời gian kết thúc</label>
                <input type="text" class="form-control" id="timeEnd" name="timeEnd" value="${showDtoEdit.timeEnd}"
                       required>
            </div>
            <div class="col-12" style="padding-bottom: 10px;">
                <label for="location" class="form-label">Địa điểm</label>
                <select class="form-control" name="location" id="location" required>
                    <option style="text-align: center;" value="">- - - - - - - - - - - - - - - - - - - - - - - - - - - -
                        -Chọn địa điểm- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
                    </option>
                    <c:forEach var="location" items="${pageLocation.content}">
                        <option value="${location.id}"
                                <c:if test="${location.id == showEdit.location.id}">selected</c:if>
                        >${location.address}</option>
                    </c:forEach>
                </select>
            </div>

            <label for="singers" class="col-12 mb-2">Ca Sĩ</label>
            <div class="row">
                <div class="col-12 mb-3">
                    <select class="form-control" name="singerIds" id="singers" multiple required>
                        <c:forEach var="singer" items="${singers}">
                            <option value="${singer.id}"
                                    <c:forEach var="singerEdit" items="${singersEdit}">
                                        <c:if test="${singer.id == singerEdit.id}">selected</c:if>
                                    </c:forEach>
                            <c:if test="${singer.id == singersEdit[4].id}">selected</c:if>
                            >${singer.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <label class="form-label">Thông tin vé</label>
            <table class="table table-bordered" style="width:70%">
                <thead>
                <tr>
                    <td style="text-align: center;">Loại vé</td>
                    <td style="text-align: center;">Giá vé</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td style="text-align: center; vertical-align: middle;">PREMIUM</td>
                    <td class="input-group">
                        <input type="number" class="form-control" name="premium"
                               value="${showEdit.ticketInfor.premium}" required>
                        <span class="input-group-text">VND</span>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;vertical-align: middle;">VIP</td>
                    <td class="input-group">
                        <input type="number" class="form-control" name="vip"
                               value="${showEdit.ticketInfor.vip}" required>
                        <span class="input-group-text">VND</span>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;vertical-align: middle;">Standard</td>
                    <td class="input-group">
                        <input type="number" class="form-control" name="standard"
                               value="${showEdit.ticketInfor.standard}" required>
                        <span class="input-group-text">VND</span>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="mb-3">
                <label for="poster" class="form-label" style="padding-right: 10px;">Ảnh bìa</label>
                <input type="file" name="poster" id="poster" value="${showEdit.poster}" required>
            </div>
            <div class="mb-3">
                <label for="seatDiagramImage" class="form-label" style="padding-right: 10px;">Ảnh quảng cáo</label>
                <input type="file" name="seatDiagramImage" id="seatDiagramImage" value="${showEdit.seatDiagramImage}"
                       required>
            </div>
            <button type="submit" class="btn btn-primary mb-2">Xác nhận</button>
            <a href="/show" class="btn btn-success mb-2">Hủy</a>
        </form>
    </div>


    <%----------------------------------------FOOTER---------------------------------------------------%>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../js/jquery.datetimepicker.js"></script>

<script>
    $('#timeStart').datetimepicker({
        // options here
    });
    $('#timeEnd').datetimepicker({
        // options here
    });
</script>

<%--multi-select-tag--%>
<script src="https://cdn.jsdelivr.net/gh/habibmhamadi/multi-select-tag/dist/js/multi-select-tag.js"></script>
<script>
    new MultiSelectTag('singers')  // id
</script>

<%--<script>--%>
<%--    var showEditJSON = ${showEditJSON};--%>
<%--    window.addEventListener('DOMContentLoaded', function() {--%>
<%--        var posterInput = document.getElementById('poster');--%>
<%--        var defaultPoster = "${showEditJSON.poster}";--%>

<%--        // Set the default poster value--%>
<%--        if (defaultPoster) {--%>
<%--            var file = new File([], defaultPoster);--%>
<%--            var dataTransfer = new DataTransfer();--%>
<%--            dataTransfer.items.add(file);--%>
<%--            posterInput.files = dataTransfer.files;--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
</body>

</html>
