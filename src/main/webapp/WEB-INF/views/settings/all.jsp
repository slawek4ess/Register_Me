<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Weekdays</title>
</head>
<body>
<table border="1" style="text-align: center">

    <thead>
    <th>ID</th>
    <th>Weekday</th>
    <th colspan="2">Actions</th>
    </thead>

    <tbody>
    <c:forEach items="${weekdays}" var="weekdays">
        <tr>
            <td>${weekdays.id}</td>
            <td>${weekdays.name}</td>
            <td><a href="/settings/edit/${weekdays.id}">Edit</a></td>
            <td><a href="/settings/delete/${weekdays.id}" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="/settings/add">Add new weekday</a>

<h4><a href="/">Home page</a></h4>
</body>
</html>
