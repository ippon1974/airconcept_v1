<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <meta name="description" content="Шаблоны вентиляционных решеток. Производство вентиляционных решеток различного дизана из латуни, меди, нержавеющей стали." />
    <title>Шаблоны вентиляционных решеток</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/img/icons/favicon.ico" type="image/x-icon" />
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
                    <div style="font-size: 0.7em; text-transform: uppercase" align="right"><a title="Корзина" style="color: red" href="/cart">Корзина</a> <strong>${count}</strong></div>
                </c:if>
    </div>
    <div style="clear: left"></div>
</div>

<div style="margin-left: 40px"><h1>Шаблоны вентиляционных решеток</h1></div>

<div style="margin-left: 40px; width: 90%;">
    <form method="get" action="/filtergrills">
        <div class="container">
            <div class="item item-1">
                <div class="col-materialid">
                    <label for="materialid">Материал</label>
                </div>
                <select class="custom-select" id="materialid" name="materialid">
                    <option value="1">Латунь</option>
                    <option value="2">Медь</option>
                    <option value="3">Сталь</option>
                </select>
            </div>
            <div class="item item-2">
                <div class="col-size">
                    <label for="size">Толщина</label>
                </div>
                <select class="custom-select" id="size" name="size">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <div class="item item-3">
                <div class="col-width">
                    <label for="width">Длина</label>
                </div>
                <input class="size_input" type="number" min="120" max="3000" value="" name="width" id="width" required/>
            </div>
            <div class="item item-4">
                <div class="col-height">
                    <label for="height">Высота</label>
                </div>
                <input class="size_input" type="number" min="60" max="1500" value="" name="height" id="height" required/>
            </div>
            <div class="item item-5">
                <input class="button" type="submit" value="Выбрать" />
            </div>
        </div>
    </form>
</div>


<div id="images">

    <c:forEach var="listGrills" items="${listGrills}">
        <div class="about">
            <figure>
                <a href="/catalog/grills?template=${listGrills.gtransliterations}">
                    <img alt="Шаблон решетки ${listGrills.gname}" src="/img/showcase/blank/${listGrills.gtransliterations}.png"></a>
                <figcaption>Шаблон: <a title="Шаблон решетки ${listGrills.gname}" href="/catalog/grills?template=${listGrills.gtransliterations}">${listGrills.gname}</a><br></figcaption>
            </figure>
        </div>
    </c:forEach>
</div>
<jsp:include page="/WEB-INF/view/templates/footer.jsp" />
</body>
</html>
