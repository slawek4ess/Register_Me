<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add weekday</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<h1>Add weekday</h1>

<%--@elvariable id="weekday" type="javax"--%>
<form:form method="post" action="/settings/add" modelAttribute="weekday">
    <table>
        <tr>
            <td>Weekday name</td>
            <td><form:input path="name"/></td>
            <td><form:errors path="name" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="add"></td>
        </tr>
    </table>
</form:form>

<h4><a href="/">Home</a></h4>
</body>
</html>
