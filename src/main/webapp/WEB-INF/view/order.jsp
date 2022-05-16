<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Оформление заказа</title>
</head>

<body>

<table align="center" border="0" cellpadding="2" cellspacing="2" width="70%">
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
