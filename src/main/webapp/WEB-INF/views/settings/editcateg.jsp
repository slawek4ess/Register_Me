<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        <%@include file="../css/style.css"%>
        <%@include file="../css/w3.css" %>
    </style>
    <title>Kategoria</title>
</head>
<%@include file="../elements/header.jsp" %>
<body>
<h1>Kategoria usług</h1>

<%--@elvariable id="category" type="javax"--%>
<form:form method="post" modelAttribute="category">

    Nazwa usługi: <form:input path="name"/><form:errors path="name" cssClass="error"/>
    Czas trwania: <form:input path="duration"/><form:errors path="duration" cssClass="error"/>
    Opis: <form:input path="description"/><form:errors path="description" cssClass="error"/>

    <hr><br>

    <input class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge" type="submit"
           value="Zapisz">

    <a href="${pageContext.request.contextPath}/settings/categ"
       class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Powrót</a>

    <a href="${pageContext.request.contextPath}/admin/home"
       class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Panel administratora</a>


</form:form>
</body>
</html>
