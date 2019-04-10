<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add dayhour</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<h1>Add Category</h1>

<%--@elvariable id="category" type="javax"--%>
<form:form method="post" action="/settings/addcateg" modelAttribute="category">
    <table>
        <tr>
            <td>Name</td>
            <td><form:input path="name"/></td>   <%-- value="23:15"--%>
            <td><form:errors path="name" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td>Duration</td>
            <td><form:input path="duration"/></td>
            <td><form:errors path="duration" cssClass="error" element="div"/></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><form:input path="description"/></td>
            <td><form:errors path="description" cssClass="error" element="div"/></td>
        </tr>        <tr>
            <td></td>
            <td><input type="submit" value="Add"></td>
        </tr>
    </table>
</form:form>

<h4><a href="/admin/home">Panel administratora</a></h4>
</body>
</html>
