<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Workhours</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<h1>Current values:</h1>

<table border="1" style="text-align: center">
    <thead>
    <th>ID</th>
    <th>Employee</th>
    <th>Weekday</th>
    <th>Start time</th>
    <th>End time</th>
    </thead>

    <tbody>
    <tr>
        <td>${workHrs.id}</td>
        <td>${workHrs.employee.lastName}</td>
        <td>${workHrs.weekday.name}</td>
        <td>${workHrs.startTime}</td>
        <td>${workHrs.endTime}</td>
    </tr>
    </tbody>
</table>

<h1>New values:</h1>
<form:form method="post" action="/workhrs/edit" modelAttribute="workHour">
    <table>
        <form:hidden path="id" value="${workHour.id}"/>
        <tr>
            <td>Employee</td>
            <td>
                <form:select path="employee">
                <form:options itemValue="id" itemLabel="lastName" items="${employees}"/>
                </form:select> </td>
            <td><form:errors path="employee" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td>Weekday</td>
            <td><form:select path="weekday">
                <form:options itemValue="id" itemLabel="name" items="${weekdays}"/>
                </form:select>
            </td>
            <td><form:errors path="weekday" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td>Start time</td>
            <td><form:input path="startTime"/></td>
            <td><form:errors path="startTime" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td>End time</td>
            <td><form:input path="endTime"/></td>
            <td><form:errors path="endTime" cssClass="error" element="div"/></td>
        </tr>

        <tr>
            <td><input type="submit" value="Save"></td>
        </tr>
    </table>
</form:form>

<h4><a href="/">Home page</a></h4>
</body>
</html>
