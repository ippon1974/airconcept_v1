<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="query" value="${req.queryString}" />

<c:set var="index" value="/WEB-INF/view/index.jsp" />
<c:set var="grills" value="/WEB-INF/view/grills.jsp" />
<c:set var="contact" value="/WEB-INF/view/contact.jsp" />

<ul class="nav">
    <c:if test="${uri.equals(index)}">
        <li>Airconcept</li>
        <li><a href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток">Шаблоны решеток</a> </li>
        <li><a href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
    </c:if>
</ul>

<c:if test="${uri.equals(grills)}">
<ul class="nav">

        <li><a href="/" title="Главная">Airconcept</a></li>
        <li>Шаблоны решеток</li>
        <li><a href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
</ul>
</c:if>

<c:if test="${uri.equals(contact)}">
<ul class="nav">
        <li><a href="/" title="Главная">Airconcept</a></li>
        <li><a href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток">Шаблоны решеток</a> </li>
        <li>Контакты</li>
</ul>
</c:if>

<c:if test="${query != null}">
<ul class="nav">

        <li><a href="${pageContext.request.contextPath}/" title="Главная">Airconcept</a></li>
        <li><a style="color: #ffff00;" href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток"><strong>Шаблоны решеток</strong></a> </li>
        <li><a href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
</ul>
</c:if>








