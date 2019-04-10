<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pracownicy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

<h1>Employee list</h1>

<table  class="w3-table-all">
    <thead>
    <tr>
    <th>ID</th>
    <th>First name</th>
    <th>Last name</th>
    <th>E-mail</th>
    <th>Mobile</th>
    <th colspan="2">Actions</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach items="${employees}" var="employee">
        <tr>
            <td>${employee.id}</td>
            <td>${employee.firstName}</td>
            <td>${employee.lastName}</td>
            <td>${employee.email}</td>
            <td>${employee.mobile}</td>
            <td><a href="/employee/edit/${employee.id}">Edit</a></td>
            <td><a href="/employee/delete/${employee.id}" onclick="return confirm('Are you sure you want to delete this employee?');">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<br>
<a href="${pageContext.request.contextPath}/employee/add"
   class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Dodaj pracownika</a>

<a href="${pageContext.request.contextPath}/admin/home"
   class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Panel administratora</a>
</body>
</html>
