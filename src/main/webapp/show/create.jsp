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
    <title>Create Show</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://kit.fontawesome.com/4f6aa91745.js" crossorigin="anonymous"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.9/jquery.datetimepicker.css"
          integrity="sha512-bYPO5jmStZ9WI2602V2zaivdAnbAhtfzmxnEGh9RwtlI00I9s8ulGe4oBa5XxiC6tCITJH/QG70jswBhbLkxPw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
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
            <li><a href="#">Địa điểm</a></li>
            <li><a href="#">Doanh thu</a></li>
            <li><a href="./singer">Ca sĩ</a></li>
            <li><a href="#">Hóa đơn</a></li>
        </ul>
        <div class="top-misc-layout"></div>
    </div>
</nav>

<main>
    <div style="text-align: center; font-size: large; font-weight: bold; padding-top:10px;">
        Tạo Show
    </div>
    <div class="container">
        <form action="/show?action=create" method="post" enctype="multipart/form-data">
            <div class="mb-3" style="padding-top:10px;">
                <label for="showName" class="form-label">Tên show</label>
                <input type="text" class="form-control" id="showName" name="showName" required>
            </div>
            <div class="mb-3">
                <label for="timeStart" class="form-label">Thời gian bắt đầu</label>
                <input type="text" class="form-control" id="timeStart" name="timeStart" required>
            </div>
            <div class="mb-3">
                <label for="timeEnd" class="form-label">Thời gian kết thúc</label>
                <input type="text" class="form-control" id="timeEnd" name="timeEnd" required>
            </div>
            <div class="col-4" style="padding-bottom: 10px;">
                <label for="location" class="form-label">Địa điểm</label>
                <select class="form-control" name="location" id="location">
                    <option value="">----------------------------Chọn địa điểm-----------------------------</option>
                    <c:forEach var="location" items="${pageLocation.content}">
                        <option value="${location.id}">${location.address}</option>
                    </c:forEach>
                </select>
            </div>

            <label for="singer" class="col-4">Ca Sĩ</label>
            <div class="row mb-3" id="singer-1">
                <div class="col-6 mb-3">
                    <select class="form-control" name="singer" id="singer" multiple>
                        <c:forEach var="singer" items="${pageSinger.content}">
                            <option value="${singer.id}">${singer.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <label class="form-label">Thông tin vé</label>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <td style="text-align: center;">Loại vé</td>
                    <td style="text-align: center;">Giá vé</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td style="text-align: center; vertical-align: middle;">PREMIUM</td>
                    <td class="input-group"><input type="number" class="form-control" value="premium"><span
                            class="input-group-text">VND</span></td>
                </tr>
                <tr>
                    <td style="text-align: center;vertical-align: middle;">VIP</td>
                    <td class="input-group"><input type="number" class="form-control" value="vip"><span
                            class="input-group-text">VND</span></td>
                </tr>
                <tr>
                    <td style="text-align: center;vertical-align: middle;">Standard</td>
                    <td class="input-group"><input type="number" class="form-control" value="standard"><span
                            class="input-group-text">VND</span></td>
                </tr>
                </tbody>
            </table>
            <div class="mb-3">
                <label for="poster" class="form-label" style="padding-right: 10px;">Ảnh bìa</label>
                <input type="file" name="poster" id="poster" accept="image/*">
            </div>
            <div class="mb-3">
                <label for="seatDiagramImage" class="form-label" style="padding-right: 10px;">Sơ đồ chỗ ngồi</label>
                <input type="file" name="seatDiagramImage" id="seatDiagramImage" accept="image/*">
            </div>
            <button type="submit" class="btn btn-primary mb-2">Tạo show</button>
            <a href="/show" class="btn btn-success mb-2">Hủy</a>
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

<script>
    const singerId = document.getElementById('singer');
    const showDetail = document.getElementById('show-detail');
    const singers = ${singersJSON};
    let rowSingerImport = 1;

    function addMore() {
        let selectStr = '<select class="form-control" name="singer" id="singer">' +
            '<option value="">-------------------------------Chọn ca sĩ--------------------------------</option>';
        for (const singer of singers) {
            selectStr += `<option value=\${singer.id}>\${singer.name}</option>`;
        }

        selectStr += '</select>';
        const strRow = `<div class="row mb-3" id="singer-\${++rowSingerImport}">
            <div class="col-4">
                \${selectStr}
            </div>
            <div class="col-2 d-flex justify-content-end">
                <button class="btn btn-danger" onclick="deleteRow(\${rowSingerImport})">Delete</button>
            </div>
        </div>`
        document.querySelector('#show-detail').innerHTML += strRow;
    }

    function deleteRow(number) {
        const row = document.getElementById('singer-' + number);
        showDetail.removeChild(row);
    }
</script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://www.jqueryscript.net/demo/Clean-jQuery-Date-Time-Picker-Plugin-datetimepicker/jquery.datetimepicker.js"></script>


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
    new MultiSelectTag('singer')  // id
</script>
</body>

</html>
