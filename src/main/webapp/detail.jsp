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
                <h2 class="site-details__infoticket">Thông tin vé</h2>
                <table class="site-details__tbticket">
                    <tr>
                        <td>Premium</td>
                        <td><fmt:setLocale value="vi_VN"/>
                            <fmt:formatNumber value="${show.ticketInfor.premium}" pattern="#,##0 ¤"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Vip</td>
                        <td><fmt:setLocale value="vi_VN"/>
                            <fmt:formatNumber value="${show.ticketInfor.vip}" pattern="#,##0 ¤"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Standard</td>
                        <td><fmt:setLocale value="vi_VN"/>
                            <fmt:formatNumber value="${show.ticketInfor.standard}" pattern="#,##0 ¤"/>
                        </td>
                    </tr>
                </table>
                <h2 class="site-details__description">Mô tả</h2>
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
                <div style="width: 100%; height: 150px">
                    <input readonly class="payment" value="Tổng tiền:  $">
                    <input readonly class="payment" value="Giảm:  $">
                    <input readonly class="payment" value="Thành tiền:  $">
                </div>
                <div>
                    <label class="btn btn-danger mb-2" style="width: 100%" id="inputbill">Đặt chỗ</label>
                </div>

            </div>
        </div>
        <%--        <form action="/ticket?action=createBill&userId=${user.id}" method="post">--%>
        <%--            <div id="selected-seats-container">--%>

        <%--            </div>--%>
        <%--        </form>--%>
        <div class="card container px-6" style="height: 100vh; width: 45%; background-color: #eceeee; margin-top: 30px">
            <form action="/ticket?action=createBill&userId=${user.id}" method="post" style="padding: 0 20px">
                <h3>XÁC NHẬN THÔNG TIN</h3>
                <h5 class="site-details__infoticket">THÔNG TIN KHÁCH HÀNG</h5>
                <table class="site-details__tbticket">
                    <tr>
                        <td>Tên</td>
                        <td>
                            ${user.name}
                        </td>
                    </tr>
                    <tr>
                        <td>Số điện thoại</td>
                        <td>
                            ${user.phoneNumber}
                        </td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>
                            ${user.email}
                        </td>
                    </tr>
                </table>

                <h5 class="site-details__infoticket">THÔNG TIN VÉ</h5>
                <table class="site-details__tbticket">
                    <tr>
                        <td>PREMIUM</td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td>VIP</td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td>STANDARD</td>
                        <td>

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

        var index = listSeat.indexOf(seat);
        if (index !== -1) {
            listSeat.splice(index, 1);
        } else {
            listSeat.push(seat);
        }

        selectedSeatsList.innerHTML = '';
        let totalPayment = 0;
        for (var i = 0; i < listSeat.length; i++) {
            var seatTemp = listSeat[i];
            if (seatTemp.type === "PREMIUM") {
                selectedSeatsList.innerHTML +=
                    `<li>
                            <input class="selectedPosition" name="selectedPosition" readonly value="\${seatTemp.position}">
                            <input class="selectedType" name="selectedType" readonly value="\${seatTemp.type}">
                            <input class="selectedPrice" name="selectedPrice" value="\${showJSON.ticketInfor.premium}">
                        <li>`
                totalPayment += showJSON.ticketInfor.premium;
            }
            if (seatTemp.type === "VIP") {
                selectedSeatsList.innerHTML +=
                    `<li>
                            <input class="selectedPosition" name="selectedPosition" readonly value="\${seatTemp.position}">
                            <input class="selectedType" name="selectedType" readonly value="\${seatTemp.type}">
                            <input class="selectedPrice" name="selectedPrice" value="\${showJSON.ticketInfor.vip}">
                        <li>`
                totalPayment += showJSON.ticketInfor.vip;
            }
            if (seatTemp.type === "STANDARD") {
                selectedSeatsList.innerHTML +=
                    `<li>
                            <input class="selectedPosition" name="selectedPosition" readonly value="\${seatTemp.position}">
                            <input class="selectedType" name="selectedType" readonly value="\${seatTemp.type}">
                            <input class="selectedPrice" name="selectedPrice" readonly value="\${showJSON.ticketInfor.premium}">
                        <li>`
                totalPayment += showJSON.ticketInfor.standard;
            }
        }
        var totalSeatsElement = document.getElementById('selectedSeats');
        totalSeatsElement.innerHTML = "Các ghế đã đặt (" + listSeat.length +")";
    }



    // totalSeatsElement.textContent = 'Tổng số ghế đã chọn: ' + totalSeats;
    // totalSeatsElement.classList.add(totalSeats);
    // selectedSeatsList.appendChild(totalSeatsElement);

    // let totalPaymentElement = document.createElement('div');
    // totalPaymentElement.textContent = 'Total Payment: ' + totalPayment;
    // selectedSeatsList.appendChild(totalPaymentElement);
    //
    // if (totalSeats >= 5 && totalSeats <= 10) {
    //     discount = totalPayment * 0.95;
    // } else if (totalSeats >= 10) {
    //     discount = totalPayment * 0.9;
    // } else {
    //     discount = totalPayment;
    // }
    // // <input type="text" readonly class="form-control-plaintext" value="\${discountBill}" name="total">`;
    // var discountBill = document.createElement('p');
    // discountBill.textContent = 'discount: ' + discount;
    // selectedSeatsList.appendChild(discountBill);



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

    document.getElementById('inputbill').addEventListener('click', function () {
        var selectedSeatsList = document.getElementById('selected-seats-list');
        var selectedSeatsContainer = document.getElementById('selected-seats-container');

        // Xóa nội dung của selected-seats-container
        selectedSeatsContainer.innerHTML = '';


        // Lặp qua các ghế đã chọn trong danh sách
        // for (var i = 0; i < selectedSeatsList.children.length; i++) {
        // var listItem = selectedSeatsList.children[i];
        // var seatInfo = listItem.innerText.replace("\n", " ");
        for (var i = 0; i < listSeat.length; i++) {
            let seatTemp = listSeat[i];
            let seatInfo = seatTemp.position + seatTemp.type + "120000"

            // Tạo một phần tử div mới cho mỗi ghế và thêm vào selected-seats-container
            var seatElement = document.createElement('input');
            seatElement.value = seatInfo;
            selectedSeatsContainer.appendChild(seatElement);
        }

        // var totalSeats = selectedSeatsList.children.length;
        //
        // var totalSeatsElement = document.createElement('p');
        // totalSeatsElement.textContent = 'Tổng số ghế đã chọn: ' + totalSeats;
        // selectedSeatsContainer.appendChild(listSeat);
        //  selectedSeatsContainer.innerHTML =`
        //    <div class="">\${userJSON.name}</div>
        //      <div class="">\${userJSON.phoneNumber}</div>
        //   <div class="">\${userJSON.email}</div>
        //     `;

        // selectedSeatsContainer.innerHTML = `
        //     <div class="">\${userJSON.name}</div>
        //     <div class="">\${userJSON.phoneNumber}</div>
        //  <div class="">\${userJSON.email}</div>
        //   <div class="">\${seatTemp.position}</div>
        //             <div class="">\${seatTemp.type}</div>
        //             <div class="">\${showJSON.ticketInfor.vip}</div>`;

        selectedSeatsContainer.insertAdjacentHTML('beforeend', `
    <div class="">\${userJSON.name}</div>
    <div class="">\${userJSON.phoneNumber}</div>
    <div class="">\${userJSON.email}</div>
    <button type="submit" class="btn btn-primary">submit</button>
`);

        selectedSeatsContainer.insertAdjacentHTML('beforeend', `
    <div class="">\${seatTemp.position}</div>
    <div class="">\${seatTemp.type}</div>
    <div class="">\${showJSON.ticketInfor.vip}</div>
`);

        selectedSeatsContainer.appendChild(totalSeatsElement);
        selectedSeatsContainer.appendChild(totalPaymentElement);
        selectedSeatsContainer.appendChild(discountBill);

    });
</script>
</body>

</html>