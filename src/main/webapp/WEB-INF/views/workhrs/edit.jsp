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
        <td>${empTemplate.id}</td>
        <td>${empTemplate.employee.lastName}</td>
        <td>${empTemplate.weekday.name}</td>
        <td>${empTemplate.startTime}</td>
        <td>${empTemplate.endTime}</td>
    </tr>
    </tbody>
</table>

<h1>New values:</h1>
<%--@elvariable id="empTemplate" type="javax"--%>
<form:form method="post" action="/workhrs/edit" modelAttribute="empTemplate">
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
            <td><form:select path="startTime">
                <form:options itemValue="id" itemLabel="startTime" items="${visithours}"/>
            </form:select>
            </td>
            <td><form:errors path="startTime" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td>End time</td>
            <td><form:select path="endTime">
                <form:options itemValue="id" itemLabel="endTime" items="${visithours}"/>
            </form:select>
            </td>
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
