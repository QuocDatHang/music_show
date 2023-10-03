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
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="card container px-6" style="height: 100vh">
        <h3 class="text-center">Management Users</h3>
        <c:if test="${message != null}">
            <h6 class="d-none" id="message">${message}</h6>
        </c:if>
        <div >
            <div>
                <a href="/location?action=create" class="btn btn-primary mb-2">Create</a>
            </div>
            <form class="d-flex" action="/location?page=${page.currentPage}">
                <input id="search" name="search" value="${searchs}" class="form-control me-2" type="text" placeholder="Enter key words to search" aria-label="search">
                <button class="btn btn-outline-success" id="searchButton">Search</button>
            </form>
            <%--                       <form action="/user?page=${page.currentPage}">--%>
            <%--                         <input type="text" id="searchBook" value="${search}" name="search" class="form-control d-flex" style="width: 85%" placeholder="Search Book Title">--%>
            <%--                       <button id="searchButton" class="btn btn-primary">Search</button>--%>
            <%--                       </form>--%>
            <div class="col-6">
            </div>
        </div>
        <table class="table table-striped">
            <tr>
                <td>
                    Id
                </td>
                <td>
                    CITY
                </td>
                <td>
                    ADDRESS
                </td>
                <td>
                    AMOUNT SEATS
                </td>
                <td>
                    ACTION
                </td>
            </tr>
            <c:forEach var="location" items="${page.content}">
                <tr>
                    <td>
                            ${location.id}
                    </td>
                    <td>
                            ${location.city}
                    </td>
                    <td>
                            ${location.address}
                    </td>
                    <td>
                            ${location.seatList.size()}
                    </td>
                    <td>
                        <a class="btn btn-info" href="/location?action=edit&id=${user.id}">
                            Edit
                        </a>
                        <a class="btn btn-danger" onclick="return confirm('Do you want remove ${user.userName} ?')"
                           href="/user?action=delete&id=${user.id}">
                            Delete
                        </a>
                            <%--                        <a href="user?action=edit&id=${user.id}" class="btn btn-primary">Edit</a>--%>
                            <%--                        <a class="btn btn-danger" onclick="return confirm('Do you want remove ${user.userName} ?')" href="/user?action=delete&id=${user.id}">--%>
                            <%--                            Delete--%>
                            <%--                        </a>--%>
                    </td>
                </tr>
            </c:forEach>
        </table>
        </form>
        <nav aria-label="...">
            <c:set var="url" value="/location?page="/>
            <%--        <nav aria-label="...">--%>
            <ul class="pagination">
                <li class="page-item <c:if test="${page.currentPage == 1}">disabled</c:if>">
                    <a class="page-link"  href="${url}${(page.currentPage - 1)}" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
                <c:forEach var="number" begin="1" end="${page.totalPage}">
                    <c:if test="${number == page.currentPage}">
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="${url}${number}">${number}</a>
                        </li>
                    </c:if>
                    <c:if test="${number != page.currentPage}">
                        <li class="page-item">
                            <a class="page-link" href="${url}${number}">${number}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <li class="page-item <c:if test="${page.currentPage == page.totalPage}">disabled</c:if>">
                    <a class="page-link" href="${url}${(page.currentPage + 1)}">Next</a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script>
    const message = document.getElementById('message');
    if (message !== null && message.innerHTML) {
        toastr.success(message.innerHTML);
    }
    const selectAllCheckbox = document.getElementById('selectAllCheckbox');
    const checkboxes = document.getElementsByClassName('checkbox');
    let checked = true;
    selectAllCheckbox.addEventListener('click', function () {
        Array.from(checkboxes).forEach(function (checkbox) {
            checkbox.checked = checked;
        });
        checked = !checked;
    });
</script>
</body>
</html>