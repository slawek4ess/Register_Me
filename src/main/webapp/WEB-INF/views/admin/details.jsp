<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<c:if test="${peselError==true}">
    <div class="w3-panel w3-red w3-display-container">
    <span onclick="this.parentElement.style.display='none';"
          class="w3-button w3-large w3-display-topright">&times;</span>
        <p>Nie można zapisać danych osoby, taki nr PESEL już jest zapisany w bazie !</p>
    </div>
</c:if>

<span>
    <h1>Edycja uprawnień</h1>

<div class=w3-container>
    <form:form method="post" modelAttribute="user">

    <div class="w3-panel">
        Imię: <form:input path="firstName"/><form:errors path="firstName" cssClass="error"/>
        Nazwisko: <form:input path="lastName"/><form:errors path="lastName" cssClass="error"/>
        Telefon: <form:input path="phone"/><form:errors path="phone" cssClass="error"/>
        Email: <form:input path="email"/><form:errors path="email" cssClass="error"/><hr>
        <form:hidden path="password" />
    <hr>
    </div>
        <hr>
    <div class="w3-large w3-panel">
        Administrator: <form:checkbox path="admin"/><form:errors path="admin" cssClass="error"/>
        Nowe hasło: <input name="newPassword"> jeżeli nic nie wpiszesz, hasło pozostanie bez zmian <br><br>

    </div>
        <hr>
        <a href="${pageContext.request.contextPath}/admin/all" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Powrót</a>
        <input class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge" type="submit"
               onclick="return confirm
            ('Na pewno chcesz zmienić uprawnienia ?')" value="Zapisz"><form:errors path="admin" cssClass="error"/>
        <a href="${pageContext.request.contextPath}/admin/home" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Panel administratora</a>

    </form:form>
</div>
</span>