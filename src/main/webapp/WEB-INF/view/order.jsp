<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <title>Оформление заказа</title>
    <style>

        .line{
            margin: 0 40px 1em 40px;
            border-bottom: 1px solid gray;
        }

        .order{
            margin: 0 40px;
            border: 1px solid black;
        }
        .order_loop{
            /*border: 1px solid black;*/
            padding: 0;
        }

        .container_order_loop{
            margin: 0 40px;
            display: grid;
            grid-template-columns: 160px 1.5fr 1fr 1fr 1fr 1fr;
        }

        .desc, .type, .size, .price, .cout{
            align-self: center;
        }

        .container_order_total{
            display: grid;
            grid-template-columns: 1fr;
        }
        .total{
            align-self: end;
            justify-self: end;
            font-weight: bold;
        }

        .container_order_form{
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
        }
        .comment{
            grid-column: 1/4;
        }
        .policy{
            grid-column: 1/4;
        }
        .sendorder{
            grid-column: 1/4;
        }

    </style>
</head>

<body>

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
        <input type="text" name="name" required="required">
    </div>
    <div class="order phone">
        <label>Телефон</label><br>
        <input type="text" name="phone" required="required">
    </div>
    <div class="order mail">
        <label>Электронная почта</label><br>
        <input type="email" name="email" required="required">
    </div>
    <div class="order comment">
        <label>Комментарий к заказу</label><br>
        <textarea style="width: 300px" name="comment"></textarea><br>
    </div>
    <div class="order policy">
        <input type="checkbox" name="is_privacy" value="1" required="required"> <label>Даю согласие на обработку моих <a target="_blank" href="${pageContext.request.contextPath}/privacy">персональных данных</a></label>
    </div>
    <div class="order sendorder">
        <input type="submit" value="Оформить заказ">
    </div>
</div>
</form>



<div class="order_footer">
    <div class="order">
        <a target="_blank" href="${pageContext.request.contextPath}/policy">Политика конфиденциальности</a> | <a target="_blank" href="${pageContext.request.contextPath}/privacy">Пользовательское соглашение</a>
    </div>
</div>










<table align="center" border="0" cellpadding="2" cellspacing="2" width="95%">
    <tr>
        <td colspan="6">
            <h1><a href="/cart">Корзина</a> → Оформление заказа</h1>
<%--            <h2>Заказ № 1402351</h2>--%>
        </td>
    </tr>

    <c:set var="totalcart" value="${0}" />
    <c:forEach var="orderList" items="${orderList}" varStatus="loop">
        <c:set var="totalcart" value="${totalcart + (orderList.getTotalNDC() * orderList.getNumber())}" />
    <tr>
        <td width="150px">
            <c:if test="${orderList.getTypematerial() == 1}">
                <p><img src="/img/cart/copper/${orderList.getImg()}.png"></p>
            </c:if>
            <c:if test="${orderList.getTypematerial() == 2}">
                <p><img src="/img/cart/brass/${orderList.getImg()}.png"></p>
            </c:if>
            <c:if test="${orderList.getTypematerial() == 3}">
                <p><img src="/img/cart/steel/${orderList.getImg()}.png"></p>
            </c:if>
        </td>
<%--            <td><p>Вентиляционная решетка ${orderList.getNametemplate()}</p></td>--%>
            <td><a href="${pageContext.request.contextPath}/catalog/grills?template=${orderList.getImg()}&materialid=${orderList.getTypematerial()}&size=${orderList.getSize()}&width=${orderList.getWidth()}&height=${orderList.getHeight()}">Вентиляционная решетка ${orderList.getNametemplate()}</a></td>
            <td><p>${orderList.getNamematerial()}</p></td>
            <td>${orderList.getWidth()} мм &#215; ${orderList.getHeight()} мм &#215; ${orderList.getSize()} мм</td>
            <td><p>${orderList.getTotalNDC() * orderList.getNumber()} руб.</p></td>
            <td><p>${orderList.getNumber()} шт.</p></td>
    </tr>
        </c:forEach>
    <tr>
        <td colspan="6"><hr></td>
    </tr>
    <tr>
        <td colspan="6">
            <p align="right"><strong>Общая стоимость: ${totalcart} руб.</strong></p>
        </td>
    </tr>

    <tr>
        <td colspan="7">
            <form method="post">
            <table border="0" cellpadding="2" cellspacing="2" width="70%">
                <tr>
                    <td>
                        <label>Имя</label><br>
                        <input type="text" name="name" required="required">
                    </td>
                    <td>
                        <label>Телефон</label><br>
                        <input type="text" name="phone" required="required">
                    </td>
                    <td>
                        <label>Электронная почта</label><br>
                        <input type="email" name="email" required="required">
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <label>Комментарий к заказу</label><br>
                        <textarea style="width: 300px" name="comment"></textarea><br>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <input type="checkbox" name="is_privacy" value="1" required="required"> <label>Даю согласие на обработку моих <a target="_blank" href="${pageContext.request.contextPath}/privacy">персональных данных</a></label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <input type="submit" value="Оформить заказ">
                    </td>
                </tr>
            </table>
            </form>
        </td>
    </tr>
</table>
<hr>

<div style="margin-left: 15em">
<p><a target="_blank" href="${pageContext.request.contextPath}/policy">Политика конфиденциальности</a> | <a target="_blank" href="${pageContext.request.contextPath}/privacy">Пользовательское соглашение</a></p>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</body>
</html>
