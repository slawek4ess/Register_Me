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

<c:if test="${forcePasswordChange==true}">
    <div class="w3-panel w3-red w3-display-container">
        <span onclick="this.parentElement.style.display='none';
            <c:set var="forcePasswordChange" value="false" scope="session" />"
              class="w3-button w3-large w3-display-topright">&times;</span>
        <p> Hasło musi zostać zmienione !</p>
    </div>
</c:if>

<c:if test="${passwordError==true}">
    <div class="w3-panel w3-red w3-display-container">
        <span onclick="this.parentElement.style.display='none';
            <c:set var="passwordError" value="false" scope="session" />"
              class="w3-button w3-large w3-display-topright">&times;</span>
        <p> Podane hasła nie są takie same !</p>
    </div>
</c:if>


<div class="w3-panel w3-large">
    <h1>Zostanie zmienione hasło dla użytkownika : </h1>
    ${user.firstName}
    ${user.lastName}<br>
    Telefon : ${user.phone}<br>
    Email: ${user.email}
</div>
<hr>


<div align="center">
    <form method="post">
        <input type="password" name="newPass1" placeholder="podaj hasło" class=w3-xlarge>
        <input type="password" name="newPass2" placeholder="powtórz hasło" class=w3-xlarge><br><br>
        <button type="submit" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Zmień hasło</button>
    </form>
</div>


<hr>
<div align="center">
    <a href="${pageContext.request.contextPath}/employee/view"
       class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Powrót</a>
    <a href="${pageContext.request.contextPath}/employee/logout"
       class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge" onclick="return confirm
            ('Na pewno chcesz się wylogować ?')">Wylogowanie</a>
</div>
</body>
</html>
