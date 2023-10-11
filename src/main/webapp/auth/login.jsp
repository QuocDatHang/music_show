<%--
  Created by IntelliJ IDEA.
  User: MSI GAMING
  Date: 29/09/2023
  Time: 10:58 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/auth/assets/css/style.css"></link>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/login.css"/>
    <style>
        .error-message {
            display: none;
            color: red;
            margin-top: 5px;
            font-style: italic;
            font-size: 14px;
        }
    </style>
</head>
<body style="background-image: url(/images/anhlogin.jpg); background-position: left bottom; ">
<h2>Đăng nhập</h2>
<c:if test="${message != null}">
    <h6 class="d-none" id="message">${message}</h6>
</c:if>
<div class="container" id="container">
    <div class="container sign-up-container">
        <form action="/auth?action=register" method="POST" onsubmit="return validateForm()">
            <h1>TẠO TÀI KHOẢN</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span></span>
            <input type="text" placeholder="userName" name="userName" id="address" required/>
            <div id="addressError" class="error-message" style="display: none;"></div>
            <input type="email" placeholder="Email" name="email" id="email"  required/>
            <div id="emailError" class="error-message" style="display: none;"></div>
            <input type="text" placeholder="Name"  name="name" id="name" required/>
            <div id="nameError" class="error-message" style="display: none;"></div>
            <input type="text" placeholder="Phone number" name="phoneNumber" id="phone" required/>
            <div id="phoneError" class="error-message" style="display: none;"></div>

<%--            <input type="text" placeholder="Address" name="name" id="address" required/>--%>
<%--            <div id="addressError" class="error-message" style="display: none;"></div>--%>

            <input type="password" placeholder="Password" id="re_password" name="password"  required>
            <div id="passwordError" class="error-message" style="display: none;"></div>
            <input type="password" placeholder="Re_Password" id="password" name="re_password" onblur="checkPassword()" required />
            <div id="passwordMatchError" class="error-message">Mật khẩu không trùng khớp</div>
            <button type="submit" > Đăng ký </button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="/auth" method="POST" >
            <h1> Đăng ký </h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>Tên người dùng</span>
            <input type="text" placeholder="userName" name="userName" required/>
            <input type="password" placeholder="Password" name="password" required/>

<%--            <a href="/auth/ForgotPassword.jsp">Forgot your password?</a>--%>


            <button>Đăng nhập</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay" style="background-image: url(/images/sky.jpg); background-position: left bottom; ">
            <div class="overlay-panel overlay-left">
                <h1>Welcome Back!</h1>
                <p>Để duy trì kết nối với chúng tôi vui lòng đăng nhập bằng thông tin cá nhân của bạn</p>
                <button class="ghost" id="signIn">Đăng nhập</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Chào mừng Quý khách hàng!</h1>
                <p>Nhập thông tin cá nhân của bạn và bắt đầu hành trình với Mây Lang Thang!</p>
                <button class="ghost" id="signUp">Đăng Ký</button>
            </div>
        </div>
    </div>
</div>
<script >
    // const message = document.getElementById('message');
    // if (message !== null && message.innerHTML) {
    //     toastr.success(message.innerHTML);
    // }

    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add('right-panel-active');
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove('right-panel-active');
    });

    function checkPassword() {
        var password = document.getElementById('password').value;
        var rePassword = document.getElementById('re_password').value;
        var errorDiv = document.getElementById('passwordMatchError');

        if (rePassword !== password) {
            errorDiv.style.display = 'block';
        } else {
            errorDiv.style.display = 'none';
        }
    }
    // Kiểm tra tính hợp lệ của số điện thoại
    function validatePhone() {
        var phoneInput = document.getElementById("phone");
        var phonePattern = /^(07|02|03|09|08)\d{8}$/;
        var phoneError = document.getElementById("phoneError");

        if (!phonePattern.test(phoneInput.value)) {
            phoneInput.classList.add("invalid");
            phoneError.innerText = "Invalid phone number. Please enter a valid 10-digit phone number starting with 07, 02, 03, 09, or 08.";
            phoneError.style.display = "block";
            return false;
        } else {
            phoneInput.classList.remove("invalid");
            phoneError.style.display = "none";
            return true;
        }
    }

    // Xử lý sự kiện khi người dùng rời khỏi trường số điện thoại
    document.getElementById("phone").addEventListener("blur", validatePhone);

    function validateName() {
        var nameInput = document.getElementById("name");
        var namePattern =/^[\p{L}\s.'-]{10,}$/u;
        var nameError = document.getElementById("nameError");

        if (!namePattern.test(nameInput.value)) {
            nameInput.classList.add("invalid");
            nameError.innerText = "Invalid name. Please enter a valid name containing only letters and spaces.";
            nameError.style.display = "block";
            return false;
        } else {
            nameInput.classList.remove("invalid");
            nameError.style.display = "none";
            return true;
        }
    }

    // Xử lý sự kiện khi người dùng rời khỏi trường tên
    document.getElementById("name").addEventListener("blur", validateName);

    function validateEmail() {
        var emailInput = document.getElementById("email");
        var emailPattern = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
        var emailError = document.getElementById("emailError");

        if (!emailPattern.test(emailInput.value)) {
            emailInput.classList.add("invalid");
            emailError.innerText = "Invalid email address. Please enter a valid email.";
            emailError.style.display = "block";
            return false;
        } else {
            emailInput.classList.remove("invalid");
            emailError.style.display = "none";
            return true;
        }
    }

    // Xử lý sự kiện khi người dùng rời khỏi trường email
    document.getElementById("email").addEventListener("blur", validateEmail);
    // Kiểm tra tính hợp lệ của địa chỉ
    // function validateAddress() {
    //     var addressInput = document.getElementById("address");
    //     var addressError = document.getElementById("addressError");
    //
    //     if (addressInput.value.length < 12) {
    //         addressInput.classList.add("invalid");
    //         addressError.innerText = "Address must be at least 12 characters long.";
    //         addressError.style.display = "block";
    //         return false;
    //     } else {
    //         addressInput.classList.remove("invalid");
    //         addressError.style.display = "none";
    //         return true;
    //     }
    // }
    //
    // // Xử lý sự kiện khi người dùng rời khỏi trường địa chỉ
    // document.getElementById("address").addEventListener("blur", validateAddress);
    // // Kiểm tra tính hợp lệ của mật khẩu
    // function validatePassword() {
    //     var passwordInput = document.getElementById("re_password");
    //     var passwordError = document.getElementById("passwordError");
    //     var passwordPattern = /^\d{6,}$/;
    //
    //     if (!passwordPattern.test(passwordInput.value)) {
    //         passwordInput.classList.add("invalid");
    //         passwordError.innerText = "Password must contain at least 6 digits.";
    //         passwordError.style.display = "block";
    //         return false;
    //     } else {
    //         passwordInput.classList.remove("invalid");
    //         passwordError.style.display = "none";
    //         return true;
    //     }
    // }

    // Xử lý sự kiện khi người dùng rời khỏi trường mật khẩu
    document.getElementById("re_password").addEventListener("blur", validatePassword);

    function validateForm() {
        var nameError = document.getElementById('nameError');
        var emailError = document.getElementById('emailError');
        var phoneError = document.getElementById('phoneError');
        var addressError = document.getElementById('addressError');
        var passwordMatchError = document.getElementById('passwordMatchError');

        if (
            nameError.style.display !== 'none' ||
            emailError.style.display !== 'none' ||
            phoneError.style.display !== 'none' ||
            addressError.style.display !== 'none' ||
            passwordMatchError.style.display !== 'none'
        ) {
            return false;
        }

    }
</script>

</body>
</html>