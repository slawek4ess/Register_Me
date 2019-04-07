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
        PESEL: <form:input path="pesel"/><form:errors path="pesel" cssClass="error"/>
        Telefon: <form:input path="phone"/><form:errors path="phone" cssClass="error"/>
        Email: <form:input path="email"/><form:errors path="email" cssClass="error"/><hr>
        <form:hidden path="password" />

        Ulica: <form:input path="address.street"/><form:errors path="address.street" cssClass="error"/>
        Nr domu: <form:input path="address.number"/><form:errors path="address.number" cssClass="error"/>
        Nr mieszkania: <form:input path="address.apartment"/><form:errors path="address.apartment" cssClass="error"/>
        Kod: <form:input path="address.zip"/><form:errors path="address.zip" cssClass="error"/>
        Miasto: <form:input path="address.city"/><form:errors path="address.city" cssClass="error"/><hr>

        <div class="w3-select">
        Firma: <form:select path="company">
            <form:option value="0" label="--Wybierz firmę--"/>
            <form:options items="${companies}" itemLabel="name" itemValue="id"/>
        </form:select>
        <form:errors path="company" cssClass="error"/>
    </div>
    </div>
        <hr>
        <div class="w3-large w3-panel">
        Administrator: <form:checkbox path="admin"/><form:errors path="admin" cssClass="error"/>
        Obsługa HR: <form:checkbox path="hr"/><form:errors path="hr" cssClass="error"/><hr>
        Nowe hasło: <input name="newPassword"> jeżeli nic nie wpiszesz, hasło pozostanie bez zmian <br><br>

    </div>
        <hr>
        <a href="${pageContext.request.contextPath}/admin/all" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Powrót</a>
        <input class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge" type="submit"
               onclick="return confirm
            ('Na pewno chcesz zmienić uprawnienia ?')" value="Zapisz"><form:errors path="admin" cssClass="error"/>
        <a href="${pageContext.request.contextPath}/admin/adminHome" class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Panel administratora</a>

    </form:form>
</div>
</span>