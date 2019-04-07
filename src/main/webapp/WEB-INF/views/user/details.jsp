<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="w3-panel">
    <h1>Edycja lub dodawanie osoby</h1>
    <hr>


    <c:if test="${peselError==true}">
        <div class="w3-panel w3-red w3-display-container">
    <span onclick="this.parentElement.style.display='none';"
          class="w3-button w3-large w3-display-topright">&times;</span>
            <p>Nie można zapisać danych osoby, taki nr PESEL już jest zapisany w bazie !</p>
        </div>
    </c:if>


    <form:form method="post" modelAttribute="user">

        Imię: <form:input path="firstName"/><form:errors path="firstName" cssClass="error"/>
        Nazwisko: <form:input path="lastName"/><form:errors path="lastName" cssClass="error"/>
        Telefon: <form:input path="phone"/><form:errors path="phone" cssClass="error"/>
        Email: <form:input path="email"/><form:errors path="email" cssClass="error"/>
        <form:hidden path="password"/>

        <hr>

        <input class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge" type="submit"
               value="Zapisz">

        <a href="${pageContext.request.contextPath}/user/all"
           class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Powrót</a>

        <a href="${pageContext.request.contextPath}/admin/adminHome"
           class="w3-button w3-xlarge w3-border w3-border-blue w3-round-xxlarge">Panel administratora</a>


    </form:form>
</div>

