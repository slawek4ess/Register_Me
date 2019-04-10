<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Godziny pracy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<span>
    <h1>Godziny pracy</h1>

<table class="w3-table-all">
    <thead>
    <tr class="w3-blue">
    <th>ID</th>
    <th>Początek</th>
    <th>Koniec</th>
    <th colspan="">Akcje</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach items="${timeSlotLst}" var="timeSlot">
        <tr>
            <td>${timeSlot.id}</td>
            <td>${timeSlot.startTime}</td>
            <td>${timeSlot.endTime}</td>
            <td><a href="/settings/deletehour/${timeSlot.id}" onclick="return confirm('Are you sure you want to delete this item?');">Usuń</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="${pageContext.request.contextPath}/settings/addhour" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Dodaj wiersz</a>
<a href="${pageContext.request.contextPath}/admin/home" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Panel administratora</a>
</div>
</span>

</body>
</html>
