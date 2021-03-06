<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Workhours</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<h1>Current values:</h1>

<table border="1" style="text-align: center">
    <thead>
    <th>ID</th>
    <th>Employee</th>
    <th>Weekday</th>
    <th>Start time</th>
    <th>End time</th>
    </thead>          <%---------------------------------------------------%>
    <tbody>
    <tr>
        <td>${empTemplate.id}</td>
        <td>${empTemplate.employee.lastName}</td>
        <td>${empTemplate.weekday.name}</td>
        <%--<td>${empTemplate.startTime}</td>--%>
        <td>${empTemplate.startTimeObj.getStartTime()}</td>
        <%--<td>${empTemplate.endTime}</td>--%>
        <td>${empTemplate.endTimeObj.getEndTime()}</td>
    </tr>
    </tbody>
</table>
<%--------------------------------------------------------------------------%>
<h1>New values:</h1>
<%--@elvariable id="empTemplate" type="javax"--%>
<form:form method="post" action="/workhrs/edit" modelAttribute="empTemplate">
    <table>
        <form:hidden path="id" value="${empTemplate.id}"/>
        <form:hidden path="employee" value="${empTemplate.employee.getId()}"/>
 <%--       <tr><td>Employee</td>
            <td><form:select path="employee">
                <form:options itemValue="id" itemLabel="lastName" items="${employees}" />
                </form:select>
            <td><form:errors path="employee" cssClass="error" element="div"/></td>
            <td><form:input path="employee"      readonly="true"/></td>    </tr>   --%>

        <form:hidden path="weekday" value="${empTemplate.weekday.getId()}"/>
<%--        <tr><td>Weekday</td>
            <td><form:select path="weekday">
                <form:options itemValue="id" itemLabel="name" items="${weekdays}" />
                </form:select>
            </td>
            <td><form:errors path="weekday" cssClass="error" element="div"/></td>
            <td><form:input path="weekday"      readonly="true"/></td>    </tr>     --%>

        <%--<form:hidden path="startTimeObj" value="${empTemplate.startTimeObj.getId()}"/>
        </tr>  --%>

        <tr><td>(prev.start value)</td>
            <td><form:input path="startTime" readonly="true"/></td>
        </tr>
        <tr><td>Day start time</td>
            <td><form:select path="startTimeObj">
                <form:option value="${empTemplate.startTimeObj.getId()}" label="- Wybierz -"/>
                <form:options items="${timeSlotLst}" itemValue="id" itemLabel="startTime" />
            </form:select>
            </td>
            <td><form:errors path="startTimeObj" cssClass="error" element="div"/></td>
        </tr>

        <tr><td>(prev.end value)</td>
            <td><form:input path="endTime"      readonly="true"/></td>
        </tr>
        <tr><td>Day end time</td>
            <td><form:select path="endTimeObj" >
            <form:option value="${empTemplate.endTimeObj.getId()}" label="- Wybierz -"/>
            <form:options items="${timeSlotLst}" itemValue="id" itemLabel="endTime" />
            </form:select>
            </td>
            <td><form:errors path="endTimeObj" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="Save"></td>
        </tr>
    </table>
</form:form>

<h4><a href="/admin/home">Home page</a></h4>
</body>
</html>
