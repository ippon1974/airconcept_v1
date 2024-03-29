<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/img/icons/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gamburger.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <title>Корзина</title>
</head>

<body>

<div style="padding: 0.5em 0 0 50px">
    <jsp:include page="/WEB-INF/view/templates/menu_gamburger.jsp" />
    <a href="/" title="Airconcept"><img class="imglogo" src="${pageContext.request.contextPath}/img/logo_48.png" alt="Airconcept"></a>
    <ul class="nav">
        <li class="navmain"><a title="Airconcept" href="/" title="Главная">Airconcept</a></li>
        <li><a title="Шаблоны решеток" href="/catalog/grills">Шаблоны решеток</a></li>
        <li><a href="${pageContext.request.contextPath}/about" title="О нас">О нас</a> </li>
        <li><a title="Контакты" href="/contact" title="Контакты">Контакты</a></li>
    </ul>
</div>

<form action="/update" method="post">
<div class="cart_order_head"><h1>Корзина</h1></div>
<c:set var="totalcart" value="${0}" />
<c:forEach var="listCatr" items="${listCatr}" varStatus="loop">
    <c:set var="totalcart" value="${totalcart + (listCatr.getTotalNDC() * listCatr.getNumber())}" />
<div class="container_loop">
    <div class="item_2 img_2">
        <c:if test="${listCatr.getTypematerial() == 1}">
            <p><img src="/img/cart/copper/${listCatr.getImg()}.png"></p>
        </c:if>
        <c:if test="${listCatr.getTypematerial() == 2}">
            <p><img src="/img/cart/brass/${listCatr.getImg()}.png"></p>
        </c:if>
        <c:if test="${listCatr.getTypematerial() == 3}">
            <p><img src="/img/cart/steel/${listCatr.getImg()}.png"></p>
        </c:if>
    </div>
    <div class="item_2 desc_2">
        <a href="${pageContext.request.contextPath}/catalog/grills?template=${listCatr.getImg()}&materialid=${listCatr.getTypematerial()}&size=${listCatr.getSize()}&width=${listCatr.getWidth()}&height=${listCatr.getHeight()}">Вентиляционная решетка ${listCatr.getName()}</a>

    </div>
    <div class="item_2 type_2">
            ${listCatr.getNamematerial()}
    </div>
    <div class="item_2 size_2">
        ${listCatr.getWidth()} мм &#215; ${listCatr.getHeight()} мм &#215; ${listCatr.getSize()} мм
    </div>
    <div class="item_2 cost_2">
            ${listCatr.getTotalNDC() * listCatr.getNumber()} руб.
    </div>
    <div class="item_2 count_2">
        <input type="number" min="1" name="number" size="2em" value="${listCatr.getNumber()}">
    </div>
    <div class="item_2 delete_2">
        <a href="/delete?id=${listCatr.getId()}">Удалить</a>
    </div>
</div>
</c:forEach>
    <div class="line"></div>
    <div class="container_footer">
    <div class="item_3 navfooter">
    <p><a title="Продолжить покупки" href="${pageContext.request.contextPath}/catalog/grills">Продолжить покупки</a>  <c:if test="${totalcart != 0}">| <a title="Оформить заказ" class="checkout_order" href="/order">Оформить заказ</a></c:if></p>
    </div>
    <div class="item_3 totalcart">
        <p>Общая стоимость: ${totalcart} руб.</p>
    <c:if test="${totalcart != 0}">
        <input class="button" type="submit" value="Обновить">
    </c:if>
    </div>
</div>
</form>
