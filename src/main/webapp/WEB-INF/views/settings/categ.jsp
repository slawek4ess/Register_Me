<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Categories</title>
</head>
<body>
<table border="1" style="text-align: center">

    <thead>
    <th>ID</th>
    <th>Name</th>
    <th>Duration</th>
    <th>Description</th>
    <th colspan="">Actions</th>
    </thead>

    <tbody>
    <c:forEach items="${categoryLst}" var="category">
        <tr>
            <td>${category.id}</td>
            <td>${category.name}</td>
            <td>${category.duration}</td>
            <td>${category.description}</td>
            <td><a href="/settings/deletecateg/${category.id}" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="/settings/addcateg">Add new item</a>

<h4><a href="/">Home page</a></h4>
</body>
</html>
