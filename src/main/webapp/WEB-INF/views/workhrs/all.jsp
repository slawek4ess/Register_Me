<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Workhours</title>
</head>
<body>
<table border="1" style="text-align: center">

    <thead>
    <th>ID</th>
    <th>Employee</th>
    <th>Weekday</th>
    <th>Start time</th>
    <th>End time</th>
    <th colspan="2">Actions</th>
    </thead>

    <tbody>
    <c:forEach items="${workHrss}" var="workHrs">
        <tr>
            <td>${workHrs.id}</td>
            <td>${workHrs.employee.lastName}</td>
            <td>${workHrs.weekday.name}</td>
            <td>${workHrs.startTime}</td>
            <td>${workHrs.endTime}</td>
            <td><a href="/workhrs/edit/${workHrs.id}">Edit</a></td>
            <td><a href="/workhrs/delete/${workHrs.id}" onclick="return confirm('Are you sure you want to delete this employee?');">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="/workhrs/addweek">Add all week workHrs</a>
<br><a href="/workhrs/add">Add day workHrs</a>
<h4><a href="/">Home page</a></h4>
</body>
</html>
