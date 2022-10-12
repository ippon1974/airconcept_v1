<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="query" value="${req.queryString}" />

<c:set var="index" value="/WEB-INF/view/index.jsp" />
<c:set var="grills" value="/WEB-INF/view/grills.jsp" />
<c:set var="pay" value="/WEB-INF/view/pay.jsp" />
<c:set var="delivery" value="/WEB-INF/view/delivery.jsp" />
<c:set var="about" value="/WEB-INF/view/about.jsp" />
<c:set var="contact" value="/WEB-INF/view/contact.jsp" />

    <c:if test="${uri.equals(index)}">
        <ul class="nav">
            <li>Airconcept</li>
            <li><a href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток">Шаблоны решеток</a> </li>
            <li><a href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
            <li><a href="${pageContext.request.contextPath}/about" title="О нас">О нас</a> </li>
            <li><a href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
        </ul>
    </c:if>

<c:if test="${uri.equals(grills)}">
    <ul class="nav">
        <li><a href="/" title="Главная">Airconcept</a></li>
        <li>Шаблоны решеток</li>
        <li><a href="${pageContext.request.contextPath}/pay" title="Оплата">Оплата</a> </li>
        <li><a href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
        <li><a href="${pageContext.request.contextPath}/about" title="О нас">О нас</a> </li>
        <li><a href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
    </ul>
</c:if>

<c:if test="${uri.equals(pay)}">
    <ul class="nav">
        <li><a href="/" title="Главная">Airconcept</a></li>
        <li><a href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток">Шаблоны решеток</a> </li>
        <li>Оплата</li>
        <li><a href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
        <li><a href="${pageContext.request.contextPath}/about" title="О нас">О нас</a> </li>
        <li><a href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
    </ul>
</c:if>

<c:if test="${uri.equals(delivery)}">
    <ul class="nav">
        <li><a href="/" title="Главная">Airconcept</a></li>
        <li><a href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток">Шаблоны решеток</a> </li>
        <li><a href="${pageContext.request.contextPath}/pay" title="Оплата">Оплата</a> </li>
        <li>Доставка</li>
        <li><a href="${pageContext.request.contextPath}/about" title="О нас">О нас</a> </li>
        <li><a href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
    </ul>
</c:if>

<c:if test="${uri.equals(about)}">
    <ul class="nav">
        <li><a href="/" title="Главная">Airconcept</a></li>
        <li><a href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток">Шаблоны решеток</a> </li>
        <li><a href="${pageContext.request.contextPath}/pay" title="Оплата">Оплата</a> </li>
        <li><a href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
        <li>О нас</li>
        <li><a href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
    </ul>
</c:if>

<c:if test="${uri.equals(contact)}">
    <ul class="nav">
        <li><a href="/" title="Главная">Airconcept</a></li>
        <li><a href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток">Шаблоны решеток</a> </li>
        <li><a href="${pageContext.request.contextPath}/pay" title="Оплата">Оплата</a> </li>
        <li><a href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
        <li><a href="${pageContext.request.contextPath}/about" title="О нас">О нас</a> </li>
        <li>Контакты</li>
    </ul>
</c:if>

<c:if test="${query != null}">
<ul class="nav">
        <li><a href="${pageContext.request.contextPath}/" title="Главная">Airconcept</a></li>
        <li><a style="color: #ffff00;" href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток"><strong>Шаблоны решеток</strong></a> </li>
        <li><a href="${pageContext.request.contextPath}/pay" title="Оплата">Оплата</a></li>
        <li><a href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
        <li><a href="${pageContext.request.contextPath}/about" title="О нас">О нас</a> </li>
        <li><a href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
</ul>
</c:if>








