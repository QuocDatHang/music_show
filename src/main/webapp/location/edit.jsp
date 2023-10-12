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
        <link rel="stylesheet" href="../css/styles.css" />
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
            <li><a href="#">SỬA ĐỊA ĐIỂM</a></li>
            <%--            <li><a href="#">Đà lạt</a></li>--%>
            <%--            <li><a href="#">Đà nẵng</a></li>--%>
            <%--            <li><a href="#">Cần Thơ</a></li>--%>
            <%--            <li><a href="#">Sài Gòn</a></li>--%>
            <%--            <li><a href="#">Hà Nội</a></li>--%>
        </ul>
        <div class="top-misc-layout"></div>
    </div>
</nav>
<div class="container" >
    <div class="card container px-6" style="max-height: 410vh">
        <%--        <h3 class="text-center">Location Management</h3>--%>
        <c:if test="${message != null}">
        <h6 class="d-none" id="message">${message}</h6>
        </c:if>
        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <div>
                    <a class="btn btn-outline-secondary" href="/location">Quay lại</a>

                </div>

            </div>
        </nav>
<div class="container">
    <form action="/location?action=edit&id=${location.id}" method="post">
        <div class="mb-3">
            <label for="cỉty" class="form-label" style="font-weight: bolder;">CITY</label>
            <input type="text" class="form-control" id="cỉty" name="city" value="${location.city}" required>
        </div>
        <div class="mb-3">
            <label for="address" class="form-label" style="font-weight: bolder;">ADDRESS</label>
            <input type="text" class="form-control" id="address" name="address" value="${location.address}" required>
        </div>
        <div class="mb-3">
            <label for="quantity" class="form-label" style="font-weight: bolder;">SEAT QUANTITY</label>
            <input type="number" class="form-control" id="quantity" name="quantity" value ="${seats.size()}" required>
<%--            <button type="button" class="btn btn-info" onclick="addSeat()">Show list</button>--%>
        </div>
        <%--        <div class="mb-3">--%>
        <%--            <label for="totalAmount" class="form-label">Tổng giá trị</label>--%>
        <%--            <input type="number" class="form-control" id="totalAmount" name="totalAmount" required>--%>
        <%--        </div>--%>
        <div class="row mb-3" style="background: #22326c; height: 50px; align-content: center; font-weight: bold; color: white">
            <div class="col-4" style=" flex-basis: calc(40% - 10px);
    padding-bottom: 5px;">
                Position
            </div>
            <div class="col-3" style=" flex-basis: calc(50% - 10px);
    padding-bottom: 5px;">
                Type
            </div>
<%--            <div class="col-2 d-flex justify-content-end">--%>
<%--                <button type="button" class="btn btn-info" onclick="addMore()">Add More</button>--%>
<%--            </div>--%>
        </div>
        <div id="product-import-detail"  style=" display: flex;
        align-items: center;
        margin-bottom: 10px;
        flex-wrap: wrap;">

            <c:forEach var="seat" items="${seats}">
                <div class="col-4"  class="row-item" style=" flex-basis: calc(40% - 10px);
    padding-bottom: 5px;">
                    <input type="text" style="width: 100px" class="form-control" name="position" value="${seat.position}" required>
                </div>
                <div class="col-3"  class="row-item" style=" flex-basis: calc(50% - 10px);
    padding-bottom: 5px;">
                 <select class="form-control" name="type" id="type">
                    <option value="PREMIUM" ${seat.type == 'PREMIUM' ? 'selected' : ''}>PREMIUM</option>
                    <option value="VIP" ${seat.type == 'VIP' ? 'selected' : ''}>VIP</option>
                    <option value="STANDARD" ${seat.type == 'STANDARD' ? 'selected' : ''}>STANDARD</option>
                 </select>
                </div>

            </c:forEach>

        </div>
        <button type="submit" class="btn btn-primary">submit</button>
    </form>
</div>
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

    function deleteRow(number) {
        const row = document.getElementById('product-import-' + number);
        productImportDetail.removeChild(row);
    }

    function addSeat() {
        let seatQuantity = document.getElementById('quantity').value;
        let seatList = '';
        for (let i = 1; i <= seatQuantity; i++) {
            seatList += `
            <div class="col-4">
                <input type="text" class="form-control" name="position" required>
            </div
            <div class="col-3">
                <input type="text" class="form-control" name="type" required>
            </div>
<!--            <div class="col-2 d-flex justify-content-end">-->
<!--                <button type="button" class="btn btn-danger" onclick="deleteRow(1)">Delete</button>-->
<!--            </div>-->
        `
        }
        document.getElementById('product-import-detail').innerHTML = seatList;
    }
</script>

</body>
</html>