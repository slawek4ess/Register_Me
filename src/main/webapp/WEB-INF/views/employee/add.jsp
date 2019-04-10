<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add employee</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<h1>Add employee</h1>

<%--@elvariable id="employee" type="org.hibernate.mapping"--%>
<form:form method="post" action="/employee/add" modelAttribute="employee">
    <table>
        <tr>
            <td>First name</td>
            <td><form:input path="firstName"/></td>
            <td><form:errors path="firstName" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td>Last name</td>
            <td><form:input path="lastName"/></td>
            <td><form:errors path="lastName" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td>E-mail</td>
            <td><form:input path="email"/></td>
            <td><form:errors path="email" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td>Mobile No.</td>
            <td><form:input path="mobile"/></td>
            <td><form:errors path="mobile" cssClass="error" element="div"/></td>
        </tr><br>
        <tr>
            <td></td>
            <td><input type="submit" value="Add"></td>
        </tr>
    </table>
</form:form>

<h4><a href="/admin/home">Panel administratora</a></h4>

</body>
</html>
