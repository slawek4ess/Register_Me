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
    <title>Title</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<h1>Current values:</h1>

<table border="1" style="text-align: center">
    <thead>
    <th>ID</th>
    <th>F.name</th>
    <th>Last name</th>
    <th>E-mail</th>
    </thead>

    <tbody>
    <tr>
        <td>${employee.id}</td>
        <td>${employee.firstName}</td>
        <td>${employee.lastName}</td>
        <td>${employee.email}</td>
    </tr>
    </tbody>
</table>

<h1>New values:</h1>
<form:form method="post" action="/employee/edit" modelAttribute="employee">
    <table>
        <form:hidden path="id" value="${employee.id}"/>
        <tr>
            <td>First name</td>
            <td><form:input path="firstName"/></td>
            <td><form:errors path="firstName" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td>Last name</td>
            <td><form:input path="lastName"/></td>
            <td><form:errors path="lastName" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td>E-mail</td>
            <td><form:input path="email"/></td>
            <td><form:errors path="email" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td>Mobile phone</td>
            <td><form:input path="mobile"/></td>
            <td><form:errors path="mobile" cssClass="error" element="div"/></td>
        </tr><br>
        <tr>
            <td></td><br>
            <td><input type="submit" value="Save"></td>
        </tr>
    </table>
</form:form>

<h4><a href="/">Home page</a></h4>
</body>
</html>
