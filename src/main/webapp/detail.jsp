<%--
  Created by IntelliJ IDEA.
  User: Quoc Dat Hang
  Date: 02/10/2023
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="./css/styles.css" />
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
        <div class="progress-bar" role="progressbar" style="width: 100%; height: 50px; background: #22326c; color: white" aria-valuenow="100"
             aria-valuemin="0"  aria-valuemax="100">SƠ ĐỒ CHÕ NGỒI
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
            <div class="square-container">
                <div class="container">
                    <div class="screen"></div>
                 
                    <div class="row">
                        <div class="seat">A01</div>
                        <div class="seat">A02</div>
                        <div class="seat">A03</div>
                        <div class="seat">A04</div>
                        <div class="seat">A05</div>
                        <div class="seat">A06</div>
                        <div class="seat">A07</div>
                        <div class="seat">A08</div>
                    </div>
                    <div class="row">
                        <div class="seat">B01</div>
                        <div class="seat">B02</div>
                        <div class="seat">B03</div>
                        <div class="seat occupied">B04</div>
                        <div class="seat occupied">B05</div>
                        <div class="seat">B06</div>
                        <div class="seat">B07</div>
                        <div class="seat">B08</div>
                    </div>
                    <div class="row">
                        <div class="seat">C01</div>
                        <div class="seat">C02</div>
                        <div class="seat">C03</div>
                        <div class="seat">C04</div>
                        <div class="seat">C05</div>
                        <div class="seat">C06</div>
                        <div class="seat occupied">C07</div>
                        <div class="seat occupied">C08</div>
                    </div>
                    <div class="row">
                        <div class="seat">D01</div>
                        <div class="seat">D02</div>
                        <div class="seat">D03</div>
                        <div class="seat">D04</div>
                        <div class="seat">D05</div>
                        <div class="seat">D06</div>
                        <div class="seat">D07</div>
                        <div class="seat">D08</div>
                    </div>
                    <div class="row">
                        <div class="seat">E01</div>
                        <div class="seat">E02</div>
                        <div class="seat">E03</div>
                        <div class="seat occupied">E04</div>
                        <div class="seat occupied">E05</div>
                        <div class="seat">E06</div>
                        <div class="seat">E07</div>
                        <div class="seat">E08</div>
                    </div>
                    <div class="row">
                        <div class="seat">F01</div>
                        <div class="seat">F02</div>
                        <div class="seat">F03</div>
                        <div class="seat">F04</div>
                        <div class="seat occupied">F05</div>
                        <div class="seat occupied">F06</div>
                        <div class="seat occupied">F07</div>
                        <div class="seat">F08</div>
                    </div>
                </div>
                <div>

                </div>
            </div>
            <div class="right-container">
                <div> Các ghế đặt
                </div>
                <div>
                    <input type="Textarea" style="width: 500px; height: 450px">
                </div>

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
    function addSeat() {
        let seatQuantity = document.getElementById('quantity').value;
        let seatList = '';
        for (let i = 1; i <= seatQuantity; i++) {
            seatList += `
           <div class="row">
                        <div class="seat">F01</div>
                        <div class="seat">F02</div>
                        <div class="seat">F03</div>
                        <div class="seat">F04</div>
                        <div class="seat occupied">F05</div>
                        <div class="seat occupied">F06</div>
                        <div class="seat occupied">F07</div>
                        <div class="seat">F08</div>
                    </div>
        `
        }
        document.getElementById('product-import-detail').innerHTML = seatList;
    }
</script>
</body>

</html>