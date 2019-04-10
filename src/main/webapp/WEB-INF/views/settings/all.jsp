<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        <%@include file="../css/style.css"%>
        <%@include file="../css/w3.css" %>
    </style>
    <title>Dni tygodnia</title>
</head>
<%@include file="../elements/header.jsp" %>
<body>
<h1>Dni robocze</h1>

<table  class="w3-table-all">
    <thead>
    <th>ID</th>
    <th>Dzień tygodnia</th>
    <th colspan="2">Akcje</th>
    </thead>
    <tbody>
    <c:forEach items="${weekdays}" var="weekdays">
        <tr>
            <td>${weekdays.id}</td>
            <td>${weekdays.name}</td>
            <td><a href="/settings/edit/${weekdays.id}">Popraw</a></td>
            <td><a href="/settings/delete/${weekdays.id}" onclick="return confirm('Are you sure you want to delete this item?');">Usuń</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br>
<a href="${pageContext.request.contextPath}/settings/add"
   class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Dodaj pozycję</a>

<a href="${pageContext.request.contextPath}/admin/home"
   class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Panel administratora</a>

</body>
</html>
