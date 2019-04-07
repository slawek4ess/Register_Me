<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: slawek
  Date: 22.02.19
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add user</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<h1>Add user</h1>

<form:form method="post" action="/user/add" modelAttribute="user">
    <table>
        <tr>
            <td>E-mail</td>
            <td><form:input path="email"/></td>
            <td><form:errors path="email" cssClass="error" element="div"/></td>
        </tr>
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
            <td></td>
            <td><input type="submit" value="add"></td>
        </tr>
    </table>
</form:form>

<h4><a href="/home">Home</a></h4>
</body>
</html>
