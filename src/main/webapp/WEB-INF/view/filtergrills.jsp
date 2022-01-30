<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Вентиляционные решетки</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>


<div style="">
    <div style="padding-left:40px;float: left; width: 100px"><a href="/catalog">Каталог</a></div>
    <div style="float: left; width: 80%; text-align: right">
        <c:if test="${cartService != null}">
            <div align=""><a href="/cart">Корзина</a></div>
        </c:if>
    </div>
    <div style="clear: left"></div>
</div>

<div style="margin-left: 40px"><h1><a href="${pageContext.request.contextPath}/catalog/grills">Вентиляционные решетки</a></h1></div>


<div style="margin-left: 40px; width: 600px;">

    <form action="/filtergrills">

        <select class="custom-select" id="materialid" name="materialid">
            <c:forEach var="modelMaterial" items="${modelMaterial}">
                <c:if test="${material == modelMaterial.mtype}">
                    <option value="${modelMaterial.mtype}" selected>${modelMaterial.mname}</option>
                </c:if>
                <c:if test="${material != modelMaterial.mtype}">
                    <option value="${modelMaterial.mtype}">${modelMaterial.mname}</option>
                </c:if>
            </c:forEach>
        </select>


        <select class="custom-select" id="size" name="size">
            <c:forEach var="modelSize" items="${modelSize}">
                <c:if test="${size == modelSize.size}">
                    <option value="${modelSize.size}" selected>${modelSize.size}</option>
                </c:if>
                <c:if test="${size != modelSize.size}">
                    <option value="${modelSize.size}">${modelSize.size}</option>
                </c:if>
            </c:forEach>
        </select>

        <input type="number" min="120" max="3000" value="${width}" name="width" id="width" required/>
        <input type="number" min="60" max="1500" value="${height}" name="height" id="height" required/>
        <input type="submit" value="GO">
    </form>
</div>

<div id="images">
<c:forEach var="listFilterCalcs" items="${listFilterCalcs}">
    <div class="about">
        <figure>
            <a href="${pageContext.request.contextPath}/catalog/grills?template=${listFilterCalcs.gtransliterations}&materialid=${listFilterCalcs.materialid}&size=${listFilterCalcs.size}&width=${listFilterCalcs.gw}&height=${listFilterCalcs.gh}">
                <c:if test="${listFilterCalcs.materialid == 1}">
                    <p><img src="/img/cart/copper/${listFilterCalcs.gpathimg}.png"></p>
                </c:if>
                <c:if test="${listFilterCalcs.materialid == 2}">
                    <p><img src="/img/cart/brass/${listFilterCalcs.gpathimg}.png"></p>
                </c:if>
                <c:if test="${listFilterCalcs.materialid == 3}">
                    <p><img src="/img/cart/steel/${listFilterCalcs.gpathimg}.png"></p>
                </c:if>
            </a>
            <figcaption>

                <c:if test="${listFilterCalcs.materialid == 1}">
                    Латунь ${listFilterCalcs.size} мм.<br>
                </c:if>
                <c:if test="${listFilterCalcs.materialid == 2}">
                    Медь ${listFilterCalcs.size} мм.<br>
                </c:if>
                <c:if test="${listFilterCalcs.materialid == 3}">
                    Сталь ${listFilterCalcs.size} мм.<br>
                </c:if>

                Размер: ${listFilterCalcs.gw} мм &#215; ${listFilterCalcs.gh} мм &#215; ${listFilterCalcs.size} мм<br>
                Стоимость: ${listFilterCalcs.totalNdc} руб.<br>
                <a href="${pageContext.request.contextPath}/catalog/grills?template=${listFilterCalcs.gtransliterations}&materialid=${listFilterCalcs.materialid}&size=${listFilterCalcs.size}&width=${listFilterCalcs.gw}&height=${listFilterCalcs.gh}">${listFilterCalcs.gname}</a></figcaption>
        </figure>
    </div>
</c:forEach>
</div>

</body>
</html>
