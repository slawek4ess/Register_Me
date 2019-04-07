<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: slawek
  Date: 22.02.19
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>User list</h1>

<table border="1" style="text-align: center">
    <thead>
    <th>ID</th>
    <th>E-mail</th>
    <th>First name</th>
    <th>Last name</th>
    </thead>

    <tbody>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.email}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td><a href="/user/edit/${user.id}">Edit</a></td>
            <td><a href="/user/delete/${user.id}" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="/user/add">Add new user</a>

<h4><a href="/home">Home</a></h4>

</body>
</html>
