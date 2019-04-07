<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rejestracja wizyt</title>
</head>
<body>
<h2> Struktura danych</h2>
<a href="settings/all">1) Settings - Weekdays</a><br>
<a href="settings/hours"> * Visit Hours (TimeSlots) </a><br>
<a href="settings/categ"> * Service Categories </a><br><br>

<a href="employee/all">2) Employees</a><br>
<a href="employee/add"> ... add new empl.</a><br><br>

<a href="workhrs/all" >3) Employee Week schedules (templates)</a><br>
<a href="workhrs/addweek"> ... add week Emp.templ.workhours</a><br>
<a href="workhrs/add">     ... add one day Emp.templ.workhours</a><br><br>

</body>
</html>
