<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 9/27/2023
  Time: 9:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <form action="/location?action=edit&id=${location.id}" method="post">
        <div class="mb-3">
            <label for="cỉty" class="form-label">CITY</label>
            <input type="text" class="form-control" id="cỉty" name="city" value="${location.city}" required>
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">ADDRESS</label>
            <input type="text" class="form-control" id="address" name="address" value="${location.address}" required>
        </div>
        <div class="mb-3">
            <label for="quantity" class="form-label">SEAT QUANTITY</label>
            <input type="number" class="form-control" id="quantity" name="quantity" value ="${seats.size()}" required>
            <button type="button" class="btn btn-info" onclick="addSeat()">Show list</button>
        </div>
        <%--        <div class="mb-3">--%>
        <%--            <label for="totalAmount" class="form-label">Tổng giá trị</label>--%>
        <%--            <input type="number" class="form-control" id="totalAmount" name="totalAmount" required>--%>
        <%--        </div>--%>
        <div class="row mb-3">
            <div class="col-4">
                Position
            </div>
            <div class="col-3">
                Type
            </div>
            <div class="col-2 d-flex justify-content-end">
                <button type="button" class="btn btn-info" onclick="addMore()">Add More</button>
            </div>
        </div>
        <div id="product-import-detail">
            <c:forEach var="seat" items="${seats}">
                <div class="col-4">
                    <input type="text" class="form-control" name="position" value="${seat.position}" required>
                </div>
                <div class="col-3">
                 <select class="form-control" name="type" id="type">
                    <option value="PREMIUM" ${seat.type == 'PREMIUM' ? 'selected' : ''}>PREMIUM</option>
                    <option value="VIP" ${seat.type == 'VIP' ? 'selected' : ''}>VIP</option>
                    <option value="STANDARD" ${seat.type == 'STANDARD' ? 'selected' : ''}>STANDARD</option>
                 </select>
                </div>
                <div class="col-2 d-flex justify-content-end">
                    <button type="button" class="btn btn-danger" onclick="delesteRow(1)">Delete</button>
                </div>

            </c:forEach>
        </div>
        <button type="submit" class="btn btn-primary">submit</button>
    </form>
</div>

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
            <div class="col-2 d-flex justify-content-end">
                <button type="button" class="btn btn-danger" onclick="deleteRow(1)">Delete</button>
            </div>
        `
        }
        document.getElementById('product-import-detail').innerHTML = seatList;
    }
</script>
</body>
</html>