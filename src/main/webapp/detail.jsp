<%--
  Created by IntelliJ IDEA.
  User: Quoc Dat Hang
  Date: 02/10/2023
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.example.music_show.model.enumeration.EType" %>
<%@ page import="java.math.BigDecimal" %>
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
    <link rel="stylesheet" href="./css/styles.css"/>
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
        </ul>
        <div class="top-misc-layout"></div>
    </div>
</nav>

<main>
    <!-- Main -->
    <section>
        <article class="grid site-details">
            <div class="site-details__image">
                <image src="./images/${show.poster}"></image>
            </div>
            <div class="site-details__info">
                <h2 class="site-details__singer">${show.singers}</h2>
                <h2 class="site-details__branch">${show.showName}</h2>
                <div class="site-details__time">
                    <p>${show.timeStart}</p>
                    <p>${show.timeEnd}</p>
                </div>
                <h3 class="site-details__infoticket">Thông tin vé</h3>
                <table class="site-details__tbticket">
                    <tr>
                        <td style="padding-left: 20px">Premium</td>
                        <td><fmt:setLocale value="vi_VN"/>
                            <fmt:formatNumber value="${show.ticketInfor.premium}" pattern="#,##0 ¤"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px">Vip</td>
                        <td><fmt:setLocale value="vi_VN"/>
                            <fmt:formatNumber value="${show.ticketInfor.vip}" pattern="#,##0 ¤"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px">Standard</td>
                        <td><fmt:setLocale value="vi_VN"/>
                            <fmt:formatNumber value="${show.ticketInfor.standard}" pattern="#,##0 ¤"/>
                        </td>
                    </tr>
                </table>
                <h3 class="site-details__description" style="padding-top: 20px">Mô tả</h3>
                <div class="site-details__phrasedesc">
                    <p>
                        - Mua trên 5 vé để được giảm 5% <br>
                        - Mua trên 10 vé để được giảm 10%
                    </p>
                </div>
            </div>
        </article>
        <div class="progress-bar" role="progressbar"
             style="width: 100%; height: 50px; background: #22326c; color: white" aria-valuenow="100"
             aria-valuemin="0" aria-valuemax="100">SƠ ĐỒ CHÕ NGỒI
        </div>
        <div class="movie-container">
            <%--    <label> Select a movie:</label>--%>
            <div id="movie">
                <%--        <option value="220">Godzilla vs Kong (RS.220)</option>--%>
                <%--        <option value="320">Radhe (RS.320)</option>--%>
                <%--        <option value="250">RRR (RS.250)</option>--%>
                <%--        <option value="260">F9 (RS.260)</option>--%>
            </div>
        </div>
        <div class="diagram">
            <div class="col-7 square-container">
                <div class="screen"></div>
                <div class="container">
                    <div class="row mx-lg-auto">
                        <c:forEach var="seat" items="${seats}">
                            <c:if test="${(seat.position).contains('A')}">
                                <div class="seat" id="seat${seat.id}" value="${seat.type}"
                                     onclick="toggleSeat(${seat.id})"
                                     data-seat-id="seat${seat.id}"
                                        <c:choose>
                                            <c:when test="${seat.type == 'VIP'}">
                                                style="background-color: yellow;"
                                            </c:when>
                                            <c:when test="${seat.type == 'PREMIUM'}">
                                                style="background-color: pink;"
                                            </c:when>
                                            <c:when test="${seat.type == 'STANDARD'}">
                                                style="background-color: green;"
                                            </c:when>
                                        </c:choose>
                                >${seat.position}</div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="row mx-lg-auto">
                        <c:forEach var="seat" items="${seats}">
                            <c:if test="${(seat.position).contains('B')}">
                                <div class="seat" id="seat${seat.id}" value="${seat.type}"
                                     onclick="toggleSeat(${seat.id})"
                                     data-seat-id="seat${seat.id}"
                                        <c:choose>
                                            <c:when test="${seat.type == 'VIP'}">
                                                style="background-color: yellow;"
                                            </c:when>
                                            <c:when test="${seat.type == 'PREMIUM'}">
                                                style="background-color: pink;"
                                            </c:when>
                                            <c:when test="${seat.type == 'STANDARD'}">
                                                style="background-color: green;"
                                            </c:when>
                                        </c:choose>
                                >${seat.position}</div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <%--DÃY GHẾ B--%>
                    <div class="row mx-lg-auto">
                        <c:forEach var="seat" items="${seats}">
                            <c:if test="${(seat.position).contains('C')}">
                                <div class="seat" id="seat${seat.id}" value="${seat.type}"
                                     onclick="toggleSeat(${seat.id})"
                                     data-seat-id="seat${seat.id}"
                                        <c:choose>
                                            <c:when test="${seat.type == 'VIP'}">
                                                style="background-color: yellow;"
                                            </c:when>
                                            <c:when test="${seat.type == 'PREMIUM'}">
                                                style="background-color: pink;"
                                            </c:when>
                                            <c:when test="${seat.type == 'STANDARD'}">
                                                style="background-color: green;"
                                            </c:when>
                                        </c:choose>
                                >${seat.position}</div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <%--DÃY GHẾ C--%>
                    <div class="row mx-lg-auto">
                        <c:forEach var="seat" items="${seats}">
                            <c:if test="${(seat.position).contains('D')}">
                                <div class="seat" id="${seat.id}" value="${seat.type}"
                                     onclick="toggleSeat(${seat.id})"
                                     data-seat-id="seat${seat.id}"
                                        <c:choose>
                                            <c:when test="${seat.type == 'VIP'}">
                                                style="background-color: yellow;"
                                            </c:when>
                                            <c:when test="${seat.type == 'PREMIUM'}">
                                                style="background-color: pink;"
                                            </c:when>
                                            <c:when test="${seat.type == 'STANDARD'}">
                                                style="background-color: green;"
                                            </c:when>
                                        </c:choose>
                                >${seat.position}</div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <%--DÃY GHẾ D--%>
                </div>
            </div>
            <div class="col-5" id="inputTicket">
                <div id="selectedSeats" style="width: 100%">Các ghế đã đặt</div>
                <div id="inputTicket-in-list">
                    <ul id="selected-seats-list">

                    </ul>
                </div>
                <table class="tableBill" style="width: 100%; height: 150px">
                    <tr>
                        <td style="text-align: left; padding-left: 20px">Tổng tiền:</td>
                        <td>
                            <input readonly class="payment" id="totalBill">
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 20px">Giảm:</td>
                        <td>
                            <input readonly class="payment" id="discount">
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 20px">Thành tiền:</td>
                        <td>
                            <input readonly class="payment" id="payment">
                        </td>
                    </tr>
                </table>
                <div style="padding-top: 15px">
                    <label class="btn btn-danger mb-2" style="width: 100%" id="inputbill">Đặt chỗ</label>
                </div>

            </div>
        </div>
        <%--        <form action="/ticket?action=createBill&userId=${user.id}" method="post">--%>
        <%--            <div id="selected-seats-container">--%>

        <%--            </div>--%>
        <%--        </form>--%>
        <div class="card container px-6" style="height: 120vh; width: 45%; background-color: #eceeee; margin-top: 30px">
            <form action="/ticket?action=createBill&userId=${user.id}&showId=${show.id}" method="post"
                  style="padding: 20px; text-align: center">
                <h5>XÁC NHẬN THÔNG TIN</h5>
                <h7>THÔNG TIN KHÁCH HÀNG</h7>
                <table class="table table-bordered" style="width:100%; text-align: left">
                    <tr>
                        <td style="width: 35%">Tên</td>
                        <td>
                            ${user.name}
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%">Số điện thoại</td>
                        <td>
                            ${user.phoneNumber}
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%">Email</td>
                        <td>
                            ${user.email}
                        </td>
                    </tr>
                </table>

                <h7>THÔNG TIN VÉ</h7>
                <table class="table table-bordered" style="width:100%; text-align: left">
                    <tr>
                        <td style="width: 35%">PREMIUM</td>
                        <td>
                            <input readonly id="premiumSeats" name="premiumSeats" style="width: 100%; border: 0">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%">VIP</td>
                        <td>
                            <input readonly id="vipSeats" name="vipSeats" style="width: 100%; border: 0">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%">STANDARD</td>
                        <td>
                            <input readonly id="standardSeats" name="standardSeats" style="width: 100%; border: 0">
                        </td>
                    </tr>
                </table>

                <h7>THANH TOÁN</h7>
                <table class="table table-bordered" style="width:100%; text-align: left">
                    <tr>
                        <td style="width: 35%">THỜI GIAN ĐẶT VÉ</td>
                        <td>
                            <input readonly id="createAt" name="createAt" style="width: 100%; border: 0">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%">SỐ GHẾ</td>
                        <td>
                            <input readonly id="seatQuantities" name="seatQuantities" style="width: 100%; border: 0">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%">TỔNG</td>
                        <td>
                            <input readonly id="total" name="total" style="width: 100%; border: 0">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%">GIẢM GIÁ</td>
                        <td>
                            <input readonly id="discountBill" name="discountBill" style="width: 100%; border: 0">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%">TỔNG THANH TOÁN</td>
                        <td>
                            <input readonly id="totalPay" name="totalPay" style="width: 100%; border: 0">
                        </td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-primary mb-2">Đặt chỗ</button>
                <a href="/singer" class="btn btn-success mb-2">Huỷ</a>
            </form>
        </div>
    </section>


    <%--    ======================================FOOTER==================================================--%>
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
<script src="./js/scripts.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/bootstrap.bundle.min.js"></script>
<script src="./js/script.js"></script>
<script>
    const seatListJson = ${seatListJson};
    const showJSON = ${showJSON};
    let listSeat = [];
    const userJSON = ${userJSON};
    let discount = 0;

    function toggleSeat(id) {
        var seat;

        for (let i = 0; i < seatListJson.length; i++) {
            if (seatListJson[i].id === id) {
                seat = seatListJson[i];
                break;
            }
        }
        var selectedSeatsList = document.getElementById('selected-seats-list');
        var premiumSeats = "";
        var vipSeats = "";
        var standardSeats = "";

        var index = listSeat.indexOf(seat);
        if (index !== -1) {
            listSeat.splice(index, 1);
        } else {
            listSeat.push(seat);
        }

        selectedSeatsList.innerHTML = '';
        // premiumSeats.innerHTML = '';
        // vipSeats.innerHTML = '';
        // standardSeats.innerHTML = '';
        // seatQuantities.value = '';
        // total.value = '';
        // discountBill.value = '';
        // totalPay.value = '';
        let totalBill = 0;
        for (var i = 0; i < listSeat.length; i++) {
            var seatTemp = listSeat[i];
            if (seatTemp.type === "PREMIUM") {
                selectedSeatsList.innerHTML +=
                    `<li>
                            <input class="selectedPosition" name="selectedPosition" readonly value="\${seatTemp.position}">
                            <input class="selectedType" name="selectedType" readonly value="\${seatTemp.type}">
                            <input class="selectedPrice" name="selectedPrice" value="\${showJSON.ticketInfor.premium}">
                        <li>`
                totalBill += showJSON.ticketInfor.premium;
                premiumSeats += `\${seatTemp.position} `;
            }
            if (seatTemp.type === "VIP") {
                selectedSeatsList.innerHTML +=
                    `<li>
                            <input class="selectedPosition" name="selectedPosition" readonly value="\${seatTemp.position}">
                            <input class="selectedType" name="selectedType" readonly value="\${seatTemp.type}">
                            <input class="selectedPrice" name="selectedPrice" value="\${showJSON.ticketInfor.vip}">
                        <li>`
                totalBill += showJSON.ticketInfor.vip;
                vipSeats += `\${seatTemp.position} `;
            }
            if (seatTemp.type === "STANDARD") {
                selectedSeatsList.innerHTML +=
                    `<li>
                            <input class="selectedPosition" name="selectedPosition" readonly value="\${seatTemp.position}">
                            <input class="selectedType" name="selectedType" readonly value="\${seatTemp.type}">
                            <input class="selectedPrice" name="selectedPrice" readonly value="\${showJSON.ticketInfor.premium}">
                        <li>`
                totalBill += showJSON.ticketInfor.standard;
                standardSeats += `\${seatTemp.position} `;
            }
        }
        var totalSeatsElement = document.getElementById('selectedSeats');
        totalSeatsElement.innerHTML = "Các ghế đã đặt (" + listSeat.length + ")";
        document.getElementById("seatQuantities").value = `\${listSeat.length}`;

        if (listSeat.length >= 5 && listSeat.length < 10) {
            discount = totalBill * 0.05;
        } else if (listSeat.length >= 10) {
            discount = totalBill * 0.1;
        } else {
            discount = 0;
        }
        var totalBillFormat = parseFloat(totalBill);
        var formattedTotalBill = new Intl.NumberFormat("vi-VN", {
            style: "currency",
            currency: "VND"
        }).format(totalBillFormat);

        var discountFormat = parseFloat(discount);
        var formattedDiscount = new Intl.NumberFormat("vi-VN", {
            style: "currency",
            currency: "VND"
        }).format(discountFormat);

        var paymentFormat = parseFloat(totalBill - discount);
        var formattedPayment = new Intl.NumberFormat("vi-VN", {
            style: "currency",
            currency: "VND"
        }).format(paymentFormat);

        document.getElementById("totalBill").value = formattedTotalBill;
        document.getElementById("discount").value = formattedDiscount;
        document.getElementById("payment").value = formattedPayment;
        document.getElementById("premiumSeats").value = premiumSeats;
        document.getElementById("vipSeats").value = vipSeats;
        document.getElementById("standardSeats").value = standardSeats;
        document.getElementById('total').value = formattedTotalBill;
        document.getElementById('discountBill').value = formattedDiscount;
        document.getElementById('totalPay').value = formattedPayment;

        // Lấy giá trị số tiền khi không có chữ VNĐ
        // var numericValue = parseFloat(totalBillInput.value.replace(/[^0-9.-]+/g,""));
    }

    function deleteSeat(id) {
        var seat;

        for (let i = 0; i < seatListJson.length; i++) {
            if (seatListJson[i].id === id) {
                seat = seatListJson[i];
                break;
            }
        }

        var index = listSeat.indexOf(seat);
        if (index !== -1) {
            listSeat.splice(index, 1);
        }

        toggleSeat(); // Gọi lại hàm toggleSeat để tính lại giá sau khi xóa ghế
    }

    // LẤY THỜI GIAN TẠO BILL
    var inputBillLabel = document.getElementById("inputbill");

    function setTimeNow() {
        var current = new Date();

        var formattedTime = current.toISOString().substring(0, 19).replace('T', ' ');
        document.getElementById("createAt").value = formattedTime;
    }

    inputBillLabel.addEventListener("click", setTimeNow);


</script>
</body>

</html>