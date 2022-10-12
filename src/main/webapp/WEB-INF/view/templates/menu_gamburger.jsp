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
<c:set var="cart" value="/WEB-INF/view/cart.jsp" />
<c:set var="order" value="/WEB-INF/view/order.jsp" />

<div class="hamburger-menu">
    <input id="menu__toggle" type="checkbox" />
    <label class="menu__btn" for="menu__toggle">
        <span></span>
    </label>

    <c:if test="${uri.equals(index)}">
        <ul class="menu__box">
            <li class="menu__item"><strong>Airconcept</strong></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток">Шаблоны решеток</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/pay" title="Оплата">Оплата</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/about" title="О нас">О нас</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
        </ul>
    </c:if>

    <c:if test="${uri.equals(grills)}">
        <ul class="menu__box">
            <li><a class="menu__item" href="/" title="Главная">Airconcept</a></li>
            <li class="menu__item"><strong>Шаблоны решеток</strong></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/pay" title="Оплата">Оплата</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/about" title="О нас">О нас</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
        </ul>
    </c:if>

    <c:if test="${uri.equals(pay)}">
        <ul class="menu__box">
            <li><a class="menu__item" href="/" title="Главная">Airconcept</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток">Шаблоны решеток</a> </li>
            <li class="menu__item">Оплата</li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/about" title="О нас">О нас</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
        </ul>
    </c:if>

    <c:if test="${uri.equals(delivery)}">
        <ul class="menu__box">
            <li><a class="menu__item" href="/" title="Главная">Airconcept</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток">Шаблоны решеток</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/pay" title="Оплата">Оплата</a></li>
            <li class="menu__item">Доставка</li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/about" title="О нас">О нас</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
        </ul>
    </c:if>

    <c:if test="${uri.equals(about)}">
        <ul class="menu__box">
            <li><a class="menu__item" href="/" title="Главная">Airconcept</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток">Шаблоны решеток</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/pay" title="Оплата">Оплата</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
            <li class="menu__item">О нас</li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
        </ul>
    </c:if>

    <c:if test="${uri.equals(contact)}">
        <ul class="menu__box">
            <li><a class="menu__item" href="/" title="Главная">Airconcept</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток">Шаблоны решеток</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/pay" title="Оплата">Оплата</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/about" title="О нас">О нас</a></li>
            <li class="menu__item"><strong>Контакты</strong></li>
        </ul>
    </c:if>

    <c:if test="${query != null}">
        <ul class="menu__box">
            <li><a class="menu__item" href="${pageContext.request.contextPath}/" title="Главная">Airconcept</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток"><strong>Шаблоны решеток</strong></a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/pay" title="Оплата">Оплата</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/about" title="О нас">О нас</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
        </ul>
    </c:if>

    <c:if test="${uri.equals(cart)}">
        <ul class="menu__box">
            <li><a class="menu__item" href="${pageContext.request.contextPath}/" title="Главная">Airconcept</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток"><strong>Шаблоны решеток</strong></a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/pay" title="Оплата">Оплата</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/about" title="О нас">О нас</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
        </ul>
    </c:if>

    <c:if test="${uri.equals(order)}">
        <ul class="menu__box">
            <li><a class="menu__item" href="${pageContext.request.contextPath}/" title="Главная">Airconcept</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/catalog/grills" title="Шаблоны решеток"><strong>Шаблоны решеток</strong></a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/pay" title="Оплата">Оплата</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/delivery" title="Доставка">Доставка</a> </li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/about" title="О нас">О нас</a></li>
            <li><a class="menu__item" href="${pageContext.request.contextPath}/contact" title="Контакты">Контакты</a></li>
        </ul>
    </c:if>


</div>
