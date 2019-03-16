<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: slawek
  Date: 22.02.19
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Weekday</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<h1>Current values:</h1>

<table border="1" style="text-align: center">
    <thead>
    <th>ID</th>
    <th>Dayname</th>
    </thead>

    <tbody>
    <tr>
        <td>${weekday.id}</td>
        <td>${weekday.name}</td>
    </tr>
    </tbody>
</table>

<h1>New values:</h1>
<%--@elvariable id="weekday" type="javax"--%>
<form:form method="post" action="/settings/edit" modelAttribute="weekday">
    <table>
        <form:hidden path="id" value="${weekday.id}"/>
        <tr>
            <td>E-mail</td>
            <td><form:input path="name"/></td>
            <td><form:errors path="name" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Update"></td>
        </tr>
    </table>
</form:form>

<h4><a href="/">Home page</a></h4>
</body>
</html>
