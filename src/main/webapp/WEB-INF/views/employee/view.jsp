<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <style>
        <%@include file="../css/style.css"%>
        <%@include file="../css/w3.css" %>
    </style>
    <title>Pracownik</title>
</head>
<%@include file="../elements/header.jsp" %>
<body>


<div class="w3-panel w3-large">
    <h1>Dane pracownika</h1>
    ${user.firstName}
    ${user.lastName}<br>
    Telefon : ${user.phone}<br>
    Email: ${user.email}
</div>
<hr>

<table class="w3-table-all">
    <thead>
    <tr class="w3-blue">
        <td>Nazwa</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${workhrs}" var="hours">
        <tr>
            <td>${hours.id}</td>
            <td>${hours.hoursGroup.name}</td>
            <td>${hours.hoursGroup.product.name}</td>
            <td>${hours.start}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<c:if test="${emailSent==true}">
    <div class="w3-panel w3-red w3-display-container">
        <span onclick="this.parentElement.style.display='none';
            <c:set var="emailSent" value="0" scope="session" />"
              class="w3-button w3-large w3-display-topright">&times;</span>
        <p> Podsumowanie zostało wysłane na podany adres...</p>
    </div>
</c:if>


<br>
<div class="w3-container">
<form method="post"><br>
    <input class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge" type="submit"
           value="Wyślij podsumowanie na adres: ">
    <input class="w3-xlarge w3-round-large"  type="email" name="emailToSend" value="${user.email}">
    <br>
</form>
<a href="${pageContext.request.contextPath}/password/change"
   class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge" onclick="return confirm
('Na pewno chcesz zmienić hasło ?')">Zmiana hasła</a>

<a href="${pageContext.request.contextPath}/employee/logout"
   class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge" onclick="return confirm
            ('Na pewno chcesz się wylogować ?')">Wylogowanie</a>
</div>

</body>
</html>
