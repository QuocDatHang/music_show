<%--
  Created by IntelliJ IDEA.
  User: Quoc Dat Hang
  Date: 02/10/2023
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.music_show.model.enumeration.EType" %>
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
            <li><a href="#">Trang chủ</a></li>
            <li><a href="#">Đà lạt</a></li>
            <li><a href="#">Đà nẵng</a></li>
            <li><a href="#">Cần Thơ</a></li>
            <li><a href="#">Sài Gòn</a></li>
            <li><a href="#">Hà Nội</a></li>
        </ul>
        <div class="top-misc-layout"></div>
    </div>
</nav>

<main>
    <!-- Main -->
    <section>
        <article class="grid site-details">
            <div class="site-details__image">
                <image src="./images/list-pic1.jpg"></image>
            </div>
            <div class="site-details__info">
                <h2 class="site-details__singer">Bùi Lan Hương</h2>
                <h2 class="site-details__branch">Sài Gòn</h2>
                <p class="site-details__subsinger">Bùi Lan Hương</p>
                <div class="site-details__time">
                    <p>06/10/2023</p>
                    <p>17:00</p>
                </div>
                <h2 class="site-details__infoticket">Thông tin vé</h2>
                <table class="site-details__tbticket">
                    <tr>
                        <td>Premium</td>
                        <td>1.800.000 VND</td>
                    </tr>
                    <tr>
                        <td>Vip</td>
                        <td>1.300.000 VND</td>
                    </tr>
                    <tr>
                        <td>Standard 1</td>
                        <td>950.000 VND</td>
                    </tr>
                    <tr>
                        <td>Standard 2</td>
                        <td>650.000 VND</td>
                    </tr>
                </table>
                <h2 class="site-details__description">Mô tả</h2>
                <div class="site-details__phrasedesc">
                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Magnam minima ut voluptatibus
                        necessitatibus
                        nam tempore consequatur quam laudantium pariatur architecto sequi, molestias tempora officia
                        eius deserunt
                        fuga, explicabo totam incidunt.</p>
                    <p><strong>Lưu ý:</strong></p>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt quidem perferendis error aspernatur
                        unde
                        vitae a pariatur. </p>
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
                    <%--                <div class="container">--%>
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
                </div>
            </div>
            <div class="col-5" id="inputTicket">
                <ul id="selected-seats-list">

                </ul>

            </div>
        </div>

        <article>

        </article>

        <article>

        </article>

        <article>

        </article>
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
<script src="./js/scripts.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/bootstrap.bundle.min.js"></script>
<script src="./js/script.js"></script>
<script>
    const seatListJson = ${seatListJson};
    const showJSON = ${showJSON};
    let listSeat = [];

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

        console.log(listSeat);

        // Cập nhật danh sách ghế đã chọn trên giao diện
        selectedSeatsList.innerHTML = '';
        for (var i = 0; i < listSeat.length; i++) {
            var seatTemp = listSeat[i];
            var listItem = document.createElement('li');
            // if (seatTemp.type === "PREMIUM"){
            //     listItem.textContent = seatTemp.position + '       ' + seatTemp.type + '       ' + showJSON.ticketInfor.premium;
            // }
            // if (seatTemp.type === "VIP"){
            //     listItem.textContent = seatTemp.position + '       ' + seatTemp.type + '       ' + showJSON.ticketInfor.vip;
            // }
            // if (seatTemp.type === "STANDARD"){
            //     listItem.textContent =  seatTemp.position + '       ' + seatTemp.type + '       ' + showJSON.ticketInfor.standard;
            // }


            if (seatTemp.type === "PREMIUM") {
                // console.log(seatTemp.position, seatTemp.type)
                listItem.innerHTML =
                    `<div class="seat-info">\${seatTemp.position}</div>
                        <div class="seat-info">\${seatTemp.type}</div>
                        <div class="seat-info">\${showJSON.ticketInfor.premium}</div>`
            }
            if (seatTemp.type === "VIP") {
                listItem.innerHTML =
                    `<div class="seat-info">\${seatTemp.position}</div>
                    <div class="seat-info">\${seatTemp.type}</div>
                    <div class="seat-info">\${showJSON.ticketInfor.vip}</div>`
            }
            if (seatTemp.type === "STANDARD") {
                listItem.innerHTML =
                    `<div class="seat-info">\${seatTemp.position}</div>
                        <div class="seat-info">\${seatTemp.type}</div>
                        <div class="seat-info">\${showJSON.ticketInfor.standard}</div>`

            }
            selectedSeatsList.appendChild(listItem);
        }
    }


</script>
</body>

</html>