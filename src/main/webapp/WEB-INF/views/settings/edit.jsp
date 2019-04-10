<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<h1>Osoby w bazie danych</h1>

<table class="w3-table-all">
    <thead>
    <th>ID</th>
    <th>Dayname</th>
    </thead>

    <tbody>
    <tr>
        <td>${weekday.id}</td>
        <td>${weekday.name}</td>
    </tr>
    </tbody>
</table>
<h1>New values:</h1>
<%--@elvariable id="weekday" type="javax"--%>
<form:form method="post" action="/settings/edit" modelAttribute="weekday">
    <table class="w3-table-all">
        <form:hidden path="id" value="${weekday.id}"/>
        <tr>
            <td>E-mail</td>
            <td><form:input path="name"/></td>
            <td><form:errors path="name" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Update"></td>
        </tr>
    </table>
</form:form>
<br>
<a href="${pageContext.request.contextPath}/settings/all"
   class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Powrót</a>

<a href="${pageContext.request.contextPath}/admin/home"
   class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Panel administratora</a>
</body>
</html>
