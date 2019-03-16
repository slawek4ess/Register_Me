<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Day hours</title>
</head>
<body>
<table border="1" style="text-align: center">

    <thead>
    <th>ID</th>
    <th>Start time</th>
    <th>End time</th>
    <th colspan="2">Actions</th>
    </thead>

    <tbody>
    <c:forEach items="${dayhours}" var="dayhours">
        <tr>
            <td>${dayhours.id}</td>
            <td>${dayhours.startTime}</td>
            <td>${dayhours.endTime}</td>
            <td><%--<a href="/settings/edithour/${dayhours.id}">Edit</a>--%></td>
            <td><a href="/settings/deletehour/${dayhours.id}" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="/settings/addhour">Add new item</a>

<h4><a href="/">Home page</a></h4>
</body>
</html>
