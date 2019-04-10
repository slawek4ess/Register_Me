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
<h1>Wypełnij</h1>

<%--@elvariable id="weekday" type="javax"--%>
    <form:form method="post" modelAttribute="weekday">

    <div class="w3-panel">
        Nazwa: <form:input path="name"/><form:errors path="name" cssClass="error"/><br><br>
    </div>
    <hr>
    <input class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge" type="submit"
           value="Zapisz"><form:errors path="name" cssClass="error"/>
    <a href="${pageContext.request.contextPath}/settings/all"
           class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Powrót</a>
    <a href="${pageContext.request.contextPath}/admin/home"
       class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Panel administratora</a>

    </form:form>

</body>
</html>
