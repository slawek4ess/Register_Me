<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add dayhour</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<h1>Add day hour</h1>

<%--@elvariable id="timeSlot" type="javax"--%>
<form:form method="post" action="/settings/addhour" modelAttribute="timeSlot">
    <table>
        <tr>
            <td>Start time</td>
            <td><form:input path="startTime"/></td>   <%-- value="23:15"--%>
            <td><form:errors path="startTime" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td>End time</td>
            <td><form:input path="endTime"/></td>
            <td><form:errors path="endTime" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Add"></td>
        </tr>
    </table>
</form:form>

<h4><a href="/">Home</a></h4>
</body>
</html>
