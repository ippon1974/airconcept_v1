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

<div style="margin-left: 40px"><h1>Вентиляционные решетки</h1></div>


<div style="margin-left: 40px; width: 600px;">
    <form action="/filtergrills">
        <select class="custom-select" id="materialid" name="materialid">
            <option value="1">Латунь</option>
            <option value="2">Медь</option>
            <option value="3">Сталь</option>
        </select>
        <select class="custom-select" id="size" name="size">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>
        <input type="number" min="120" max="3000" value="" name="width" id="width" required/>
        <input type="number" min="60" max="1500" value="" name="height" id="height" required/>
        <input type="submit" value="GO" />
    </form>
</div>


<div id="images">

    <c:forEach var="listGrills" items="${listGrills}">
        <div class="about">
            <figure>
                <a href="/catalog/grills?template=${listGrills.gtransliterations}">
                    <img src="/img/showcase/blank/${listGrills.gtransliterations}.png"></a>
                <figcaption><a href="/catalog/grills?template=${listGrills.gtransliterations}">${listGrills.gname}</a><br></figcaption>
            </figure>
        </div>
    </c:forEach>
</div>
<jsp:include page="/WEB-INF/view/footer.jsp" />
</body>
</html>
