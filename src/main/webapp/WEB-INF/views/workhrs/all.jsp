<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Harmonogramy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<h1>Harmonogramy</h1>

<table  class="w3-table-all">
    <thead>
    <tr>
    <th>ID</th>
    <th>Employee</th>
    <th>Weekday</th>
    <th>Start time</th>
    <th>End time</th>
    <th colspan="2">Actions</th>
    </tr>
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
<br>
<a href="${pageContext.request.contextPath}/workhrs/addweek"
   class="w3-button w3-large w3-border w3-border-blue w3-round-xxlarge">Dodaj wg szablonu</a>

<a href="${pageContext.request.contextPath}/workhrs/add"
   class="w3-button w3-large w3-border w3-border-blue w3-round-xxlarge">Dodaj 1 pozycję</a>
<hr>
<a href="${pageContext.request.contextPath}/admin/home"
   class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Panel administratora</a>
</body>
</html>
