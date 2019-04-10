<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add work hours</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<h1>Add week workhours</h1>
<%--@elvariable id="empTemplate" type="javax"--%>
<form:form method="post"  modelAttribute="empTemplate">
    <table>
        <tr>
            <td>Employee (rest):</td>
            <td><form:select path="employee" >
                <form:option value="-1" label="- Wybierz -"/>
                <form:options items="${employeesToAdd}" itemLabel="lastName" itemValue="id" />
            </form:select> </td>
            <td><form:errors path="employee" cssClass="error" element="div"/></td>
        </tr>

        <tr>
            <td> - Start time</td>
            <td><form:select path="startTimeObj" required="true">
                <form:option value="00:00" label="- Wybierz -"/>
                <form:options items="${timeSlotLst}" itemLabel="startTime" itemValue="id" />
            </form:select> </td>

            <td><form:errors path="startTimeObj" cssClass="error" element="div"/></td>
        </tr>

        <form:hidden path="startTime" value="${empTemplate.startTimeObj.getStartTime()}"/>

        <tr>
            <td> - End time</td>
            <td><form:select path="endTimeObj" required="true">
                <form:option value="00:00" label="- Wybierz -"/>
                <form:options items="${timeSlotLst}" itemLabel="endTime" itemValue="id" />
            </form:select> </td>
            <td><form:errors path="endTimeObj" cssClass="error" element="div"/></td>
        </tr>

        <form:hidden path="endTime" value="${empTemplate.endTimeObj.getEndTime()}"/>

        <tr>
            <td><input type="submit" value="Add week"></td>
        </tr>
    </table>
</form:form>

<h4><a href="/admin/home">Home page</a></h4>

</body>
</html>
