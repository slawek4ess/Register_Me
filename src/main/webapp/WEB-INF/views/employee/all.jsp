<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employees</title>
</head>
<body>

<h1>Employee list</h1>

<table border="1" style="text-align: center">
    <thead>
    <th>ID</th>
    <th>First name</th>
    <th>Last name</th>
    <th>E-mail</th>
    <th>Mobile</th>
    <th colspan="2">Actions</th>
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

<a href="/employee/add">Add new employee</a>

<h4><a href="/">Home page</a></h4>

</body>
</html>
