<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <style>
        <%@include file="../css/style.css"%>
        <%@include file="../css/w3.css" %>
    </style>
    <title>Adresy</title>
</head>
<%@include file="../elements/header.jsp" %>
<body>

<h1 class="w3-container">Administratorzy</h1>

<table class="w3-table-all">
    <thead>
    <tr class="w3-blue">
        <td>Imię</td>
        <td>Nazwisko</td>
        <td>PESEL</td>
        <td>Zmiana uprawnień</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${admins}" var="user">
        <tr>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.pesel}</td>
            <td><a href="${pageContext.request.contextPath}/admin/edit/${user.id}">Zmień uprawnienia</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<h1 class="w3-container">Obsługa HR</h1>
<table class="w3-table-all">
    <thead>
    <tr class="w3-blue">
        <td>Imię</td>
        <td>Nazwisko</td>
        <td>PESEL</td>
        <td>Zmiana uprawnień</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${hrs}" var="user">
        <tr>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.pesel}</td>
            <td><a href="${pageContext.request.contextPath}/admin/edit/${user.id}">Zmień uprawnienia</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<h1 class="w3-container">Wszystkie osoby</h1>
<table class="w3-table-all">
    <thead>
    <tr class="w3-blue">
        <td>Imię</td>
        <td>Nazwisko</td>
        <td>PESEL</td>
        <td>Zmiana uprawnień</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.pesel}</td>
            <td><a href="${pageContext.request.contextPath}/admin/edit/${user.id}">Zmień uprawnienia</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div align="center">
<hr><a href="${pageContext.request.contextPath}/admin/adminHome" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Panel administratora</a>
</div>

</body>
</html>
