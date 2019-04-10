<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Categories</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<h1>Kategorie</h1>

<table class="w3-table-all">
    <thead>
    <th>ID</th>
    <th>Nazwa kateg.</th>
    <th>Czas obsługi</th>
    <th>Opis kategorii</th>
    <th colspan="2">Akcje</th>
    </thead>
    <tbody>
    <c:forEach items="${categoryLst}" var="category">
        <tr>
            <td>${category.id}</td>
            <td>${category.name}</td>
            <td>${category.duration}</td>
            <td>${category.description}</td>
            <td><a href="/settings/editcateg/${category.id}">Popraw</a></td>
            <td><a href="/settings/deletecateg/${category.id}" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br>
<a href="${pageContext.request.contextPath}/settings/addcateg"
   class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Dodaj pozycję</a>

<a href="${pageContext.request.contextPath}/admin/home"
   class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Panel administratora</a>
</body>
</html>
