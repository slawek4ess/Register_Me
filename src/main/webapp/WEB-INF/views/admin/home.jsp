<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style>
        <%@include file="../css/style.css" %>
        <%@include file="../css/w3.css" %>
    </style>
</head>
<body>
<%@include file="../elements/header.jsp" %>
<%--
<img src="${pageContext.request.contextPath}/images/schedule-img.jpg" alt="Logo" style="width:100%">
--%>

<div class="w3-container w3-blue">
    <h1 align="center">Strona administratora</h1>
</div>

<br><br>

<div align="center">

    <a href="${pageContext.request.contextPath}/settings/all"
       class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Dni tygodnia</a>

    <a href="${pageContext.request.contextPath}/settings/hours"
       class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Godziny pracy</a>

    <a href="${pageContext.request.contextPath}/settings/categ"
       class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Kategorie</a>

    <hr>
    <a href="${pageContext.request.contextPath}/employee/all"
       class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Pracownicy</a>

    <a href="${pageContext.request.contextPath}/workhrs/all"
       class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Harmonogramy</a>
    <hr>
    <a href="${pageContext.request.contextPath}/admin/all" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Zmiana uprawnień</a>
    <a href="${pageContext.request.contextPath}/admin/logout" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge" onclick="return confirm
            ('Na pewno chcesz się wylogować ?')">Wylogowanie</a>
    <hr>
    <%--<a href="settings/all">1) Settings - Weekdays</a><br>
    <a href="settings/hours"> * Visit Hours (TimeSlots) </a><br>
    <a href="settings/categ"> * Service Categories </a><br><br>

    <a href="employee/all">2) Employees</a><br>
    <a href="employee/add"> ... add new empl.</a><br><br>

    <a href="workhrs/all" >3) Employee Week schedules (templates)</a><br>
    <a href="workhrs/addweek"> ... add week Emp.templ.workhours</a><br>
    <a href="workhrs/add">     ... add one day Emp.templ.workhours</a><br><br>--%>


</div>

</body>
</html>
