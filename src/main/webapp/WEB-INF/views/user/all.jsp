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
<h1>Osoby w bazie danych</h1>

<c:if test="${deleteError==true}">
    <div class="w3-panel w3-red w3-display-container">
    <span onclick="this.parentElement.style.display='none';
            <c:set var="deleteError" value="false" scope="session" />"
        class="w3-button w3-large w3-display-topright">&times;</span>
        <p>Nie można usunąć osoby, jest przypisana do umowy !</p>
    </div>
</c:if>

<table class="w3-table-all">
    <thead>
    <tr class="w3-blue">
        <td>Imię</td>
        <td>Nazwisko</td>
        <td>Telefon</td>
        <td>Email</td>
        <td>Edycja</td>
        <td>Usuwanie</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.phone}</td>
            <td>${user.email}</td>
            <td><a href="${pageContext.request.contextPath}/user/edit/${user.id}">Edytuj osobę</a></td>
            <td><a href="${pageContext.request.contextPath}/user/delete/${user.id}" onclick="return confirm
            ('Na pewno chcesz usunąć ?')">Usuń osobę</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br>
<a href="${pageContext.request.contextPath}/user/add" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Nowa osoba</a>
<a href="${pageContext.request.contextPath}/admin/home" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Panel administratora</a>
<a href="${pageContext.request.contextPath}/user/logout" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge"
   onclick="return confirm('Na pewno chcesz się wylogować ?')">Wylogowanie</a>
</body>
</html>
