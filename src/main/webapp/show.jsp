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
    <title>Show Management Page</title>
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
            <li><a href="#">Show Management</a></li>
        </ul>
        <div class="top-misc-layout"></div>
    </div>
</nav>
private int id;
private String showName;
private Date timeStart;
private Date timeEnd;
private String poster;
private Location location;
private TicketInfor ticketInfor;
private String seatDiagramImage;

<main>
    <form action="/show?action=create" method="post">
        <div class="mb-3">
            <label for="showName" class="form-label">Show name:</label>
            <input type="text" class="form-control" id="showName" name="showName" required>
        </div>
        <div class="mb-3">
            <label for="timeStart" class="form-label">Time Start</label>
            <input type="datetime-local" class="form-control" id="timeStart" name="timeStart" required>
        </div>
        <div class="mb-3">
            <label for="timeEnd" class="form-label">Time End</label>
            <input type="datetime-local" class="form-control" id="timeEnd" name="timeEnd" required>
        </div>
        <div id="product-import-detail">
            <div class="row mb-3" id="product-import-1">
                <div class="col-4">
                    <select class="form-control" name="productIds" id="product">
                        <c:forEach var="product" items="${products}">
                            <option value="${product.id}">${product.productName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-3">
                    <input type="number" class="form-control" name="quantities" required>
                </div>
                <div class="col-3">
                    <input type="number" class="form-control" name="importPrice" required>
                </div>
                <div class="col-2 d-flex justify-content-end">
                    <button type="button" class="btn btn-danger" onclick="deleteRow(1)">Delete</button>
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Create</button>
    </form>


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