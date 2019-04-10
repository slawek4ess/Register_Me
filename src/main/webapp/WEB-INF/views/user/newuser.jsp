<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <style>
        <%@include file="../css/style.css"%>
        <%@include file="../css/w3.css" %>
    </style>
    <title>Dane</title>
</head>
<body>
<%@include file="../elements/header.jsp" %>

<div class="w3-panel">
    <h1>Podaj swoje dane</h1>
    <hr>

    <form:form method="post" modelAttribute="user">

        Imię: <form:input path="firstName"/><form:errors path="firstName" cssClass="error"/>
        Nazwisko: <form:input path="lastName"/><form:errors path="lastName" cssClass="error"/>
        Telefon: <form:input path="phone"/><form:errors path="phone" cssClass="error"/>
        Email: <form:input path="email"/><form:errors path="email" cssClass="error"/>

        <%--Administrator: <form:checkbox path="admin"/><form:errors path="admin" cssClass="error"/>--%>
        Hasło: <form:input type="password" path="password"/><form:errors path="password" cssClass="error"/>

        <hr>
        <input class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge" type="submit"
               value="Zapisz">
        <a href="${pageContext.request.contextPath}/"
           class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Powrót</a>
    </form:form>
</div>



</body>
</html>