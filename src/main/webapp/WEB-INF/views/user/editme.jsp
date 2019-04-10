<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <style>
        <%@include file="../css/style.css"%>
        <%@include file="../css/w3.css" %>
    </style>
    <title>Address</title>
</head>
<body>
<%@include file="../elements/header.jsp" %>
<div class="w3-panel">
    <h1>Edycja lub dodawanie osoby</h1>
    <hr>


    <c:if test="${emailError==true}">
        <div class="w3-panel w3-red w3-display-container">
    <span onclick="this.parentElement.style.display='none';"
          class="w3-button w3-large w3-display-topright">&times;</span>
            <p>Nie można zapisać danych osoby, taki e-mail już jest zapisany w bazie !</p>
        </div>
    </c:if>


    <form:form method="post" modelAttribute="user">

        Imię: <form:input path="firstName"/><form:errors path="firstName" cssClass="error"/>
        Nazwisko: <form:input path="lastName"/><form:errors path="lastName" cssClass="error"/>
        Telefon: <form:input path="phone"/><form:errors path="phone" cssClass="error"/>
        Email: <form:input path="email"/><form:errors path="email" cssClass="error"/><br><br>

        <%--Administrator: <form:checkbox path="admin"/><form:errors path="admin" cssClass="error"/>--%>
        Zmień hasło: <input name="newPassword"> (pozostaw puste, jeśli bez zmian) <br>

<%--        Hasło: <form:input type="password" path="password"/><form:errors path="password" cssClass="error"/>--%>

        <hr>
        <input class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge" type="submit"
               value="Zapisz">
        <a href="${pageContext.request.contextPath}/"
           class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Powrót</a>
        <a href="${pageContext.request.contextPath}/admin/logout" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge" onclick="return confirm
            ('Na pewno chcesz się wylogować ?')">Wylogowanie</a>

    </form:form>
</div>
</body>
</html>
