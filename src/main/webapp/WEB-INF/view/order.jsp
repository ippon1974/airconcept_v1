<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/img/icons/favicon.ico" type="image/x-icon" />
<%--    <link rel="stylesheet" type="text/css" href="/css/reset.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gamburger.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">

    <title>Оформление заказа</title>

</head>

<body>

<div style="padding: 0 0 0 40px">
    <jsp:include page="/WEB-INF/view/templates/menu_gamburger.jsp" />
    <a href="/" title="Airconcept"><img class="imglogo" src="${pageContext.request.contextPath}/img/logo_48.png" alt="Airconcept"></a>
    <ul class="nav">
        <li class="navmain"><a title="Airconcept" href="/" title="Главная">Airconcept</a></li>
        <li><a title="Шаблоны решеток" href="/catalog/grills">Шаблоны решеток</a></li>
        <li><a href="${pageContext.request.contextPath}/about" title="О нас">О нас</a> </li>
        <li><a title="Контакты" href="/contact">Контакты</a></li>
    </ul>
</div>

<div class="order order_head"><h1><a href="/cart">Корзина</a> → Оформление заказа</h1></div>
<c:set var="totalcart" value="${0}" />
<c:forEach var="orderList" items="${orderList}" varStatus="loop">
    <c:set var="totalcart" value="${totalcart + (orderList.getTotalNDC() * orderList.getNumber())}" />
<div class="container_order_loop">
    <div class="order_loop img">
        <c:if test="${orderList.getTypematerial() == 1}">
            <p><img src="/img/cart/copper/${orderList.getImg()}.png"></p>
        </c:if>
        <c:if test="${orderList.getTypematerial() == 2}">
            <p><img src="/img/cart/brass/${orderList.getImg()}.png"></p>
        </c:if>
        <c:if test="${orderList.getTypematerial() == 3}">
            <p><img src="/img/cart/steel/${orderList.getImg()}.png"></p>
        </c:if>
    </div>
    <div class="order_loop desc">
        <a href="${pageContext.request.contextPath}/catalog/grills?template=${orderList.getImg()}&materialid=${orderList.getTypematerial()}&size=${orderList.getSize()}&width=${orderList.getWidth()}&height=${orderList.getHeight()}">Вентиляционная решетка ${orderList.getNametemplate()}</a>
    </div>
    <div class="order_loop type">
            ${orderList.getNamematerial()}
    </div>
    <div class="order_loop size">
            ${orderList.getWidth()} мм &#215; ${orderList.getHeight()} мм &#215; ${orderList.getSize()} мм
    </div>
    <div class="order_loop price">
            ${orderList.getTotalNDC() * orderList.getNumber()} руб.
    </div>
    <div class="order_loop cout">
            ${orderList.getNumber()} шт.
    </div>
</div>
</c:forEach>
<div class="line"></div>
<div class="container_order_total">
    <div class="order total">Общая стоимость: ${totalcart} руб.</div>
</div>

<form method="post">
<div class="container_order_form">
    <div class="order name">
        <label>Имя</label>
        <input autofocus type="text" name="name" pattern="[A-Za-zА-Яа-яЁё]{4,}" title="Латинские или русский буквы" required="required">
    </div>
    <div class="order phone">
        <label style="display: block;">Телефон</label>
        <input  type="tel" name="phone" pattern="(\+?\d[- .]*){7,13}" title="Международный, государственный или местный телефонный номер" required="required">
    </div>
    <div class="order mail">
        <label>Электронная почта</label>
        <input type="email" name="email" required="required" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}">
    </div>
    <div class="order comment">
        <label>Комментарий к заказу</label>
        <textarea rows="10" cols="45" name="comment"></textarea><br>
    </div>
    <div class="order policy">
        <input type="checkbox" name="is_privacy" value="1" required="required"> <label style="display: inline-block">Даю согласие на обработку моих <a target="_blank" href="${pageContext.request.contextPath}/privacy">персональных данных</a></label>
    </div>
    <div class="order sendorder">
        <input class="button" type="submit" value="Оформить заказ">
    </div>
</div>
</form>

<div class="line"></div>

<div class="order_footer">
    <div class="order">
        <a target="_blank" href="${pageContext.request.contextPath}/policy">Политика конфиденциальности</a> | <a target="_blank" href="${pageContext.request.contextPath}/privacy">Пользовательское соглашение</a>
    </div>
</div>

</body>
</html>
