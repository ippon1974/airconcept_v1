<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <c:set var="materialname" value="" />
    <c:if test="${material == 1}">
        <c:set var="materialname" value="Материал: Латунь" />
    </c:if>
    <c:if test="${material == 2}">
        <c:set var="materialname" value="Материал: Медь" />
    </c:if>
    <c:if test="${material == 3}">
        <c:set var="materialname" value="Материал: Сталь" />
    </c:if>

    <title>Вентиляционные решетки ${materialname}. Длина: ${width}мм. Высота: ${height}мм. Толщина листа: ${size}мм.</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Произовдство вентиляционных решеток из стали, латуни, меди. ">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form_filter.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
</head>
<body>
<div style="padding: 0 0 0 30px">
<jsp:include page="/WEB-INF/view/templates/menu.jsp" />
</div>

<div style="">
    <div style="float: left; width: 80%; text-align: right">
        <c:if test="${cartService != null}">
            <div style="font-size: 0.9em" align="right"><a title="Корзина" style="color: red" href="/cart">Корзина</a> <strong>${count}</strong></div>
        </c:if>
    </div>
    <div style="clear: left"></div>
</div>

<c:set var="materialname" value="" />
<c:if test="${material == 1}">
    <c:set var="materialname" value="Материал: Латунь" />
</c:if>
<c:if test="${material == 2}">
    <c:set var="materialname" value="Материал: Медь" />
</c:if>
<c:if test="${material == 3}">
    <c:set var="materialname" value="Материал: Сталь" />
</c:if>

<div style="margin-left: 40px">
    <h1>${materialname}.
        Длина: ${width}мм. Высота: ${height}мм.
        Толщина листа: ${size}мм.</h1>
</div>


<div style="margin-left: 40px; width: 90%;">

    <form method="get" action="/filtergrills">
        <div class="container">
            <div class="item item-1">
                <div class="col-materialid">
                    <label for="materialid">Материал</label>
                </div>
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
            </div>
            <div class="item item-2">
                <div class="col-size">
                    <label for="size">Толщина</label>
                </div>
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
            </div>
            <div class="item item-3">
                <div class="col-width">
                    <label for="width">Длина</label>
                </div>
                <input class="size_input" type="number" min="120" max="3000" value="${width}" name="width" id="width" required/>
            </div>
            <div class="item item-4">
                <div class="col-height">
                    <label for="height">Высота</label>
                </div>
                <input class="size_input" type="number" min="60" max="1500" value="${height}" name="height" id="height" required/>
            </div>
            <div class="item item-5">
                <input class="button" type="submit" value="Выбрать" />
            </div>
        </div>
    </form>
    <br>
</div>

<%--<div class="line"></div>--%>

<div id="images">
<c:forEach var="listFilterCalcs" items="${listFilterCalcs}">
    <div class="about">
        <figure>
            <a href="${pageContext.request.contextPath}/catalog/grills?template=${listFilterCalcs.gtransliterations}&materialid=${listFilterCalcs.materialid}&size=${listFilterCalcs.size}&width=${listFilterCalcs.gw}&height=${listFilterCalcs.gh}">
                <c:if test="${listFilterCalcs.materialid == 1}">
                    <img alt="Шаблон решетки ${listFilterCalcs.gname}" src="/img/showcase/copper/${listFilterCalcs.gpathimg}.png">
                </c:if>
                <c:if test="${listFilterCalcs.materialid == 2}">
                    <img alt="Шаблон решетки ${listFilterCalcs.gname}" src="/img/showcase/brass/${listFilterCalcs.gpathimg}.png">
                </c:if>
                <c:if test="${listFilterCalcs.materialid == 3}">
                    <img alt="Шаблон решетки ${listFilterCalcs.gname}" src="/img/showcase/steel/${listFilterCalcs.gpathimg}.png">
                </c:if>
            </a>
            <figcaption>
                Шаблон: <a title="Шаблон решетки ${listFilterCalcs.gname}" href="${pageContext.request.contextPath}/catalog/grills?template=${listFilterCalcs.gtransliterations}&materialid=${listFilterCalcs.materialid}&size=${listFilterCalcs.size}&width=${listFilterCalcs.gw}&height=${listFilterCalcs.gh}">${listFilterCalcs.gname}</a><br>
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
                Стоимость: ${listFilterCalcs.totalNdc} руб.
                </figcaption>
        </figure>
    </div>
</c:forEach>
</div>
<jsp:include page="/WEB-INF/view/templates/footer.jsp" />
</body>
</html>
