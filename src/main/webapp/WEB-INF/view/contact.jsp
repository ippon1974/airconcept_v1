<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/img/icons/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gamburger.css">
    <meta name="description" content="Контакты. Компания AirConcept. Производство вентиляционных решеток в Москве" />
    <title>Контакты</title>
</head>
<body>

<div style="margin: 1em 30px 1em 30px;">

    <div style="padding: 0 0 0 0">
        <jsp:include page="/WEB-INF/view/templates/menu_gamburger.jsp" />
        <jsp:include page="/WEB-INF/view/templates/menu.jsp" />
    </div>


    <h1>Контакты</h1>
<div style="">
    <div style="float: left; width: 80%; text-align: right">
        <c:if test="${cartService != null}">
            <div style="font-size: 0.9em" align="right"><a title="Корзина" style="color: yellow" href="/cart">Корзина</a> <strong>${count}</strong></div>
        </c:if>
    </div>
    <div style="clear: left"></div>
</div>
<p><strong>Телефон</strong>: +7 (925) 585-33-71 (Мегафон)</p>
<p>В рабочие дни с 9:00 до 19:00. Суббота и воскресенье выходные дни</p>
<p><strong>Электронная почта</strong>: box@airconcept.ru</p>

<address style="font-style: normal">
    140080 ул. Карла Маркса д. 117 Б, офис № 503 Люберецкий р-н, пос. Красково, МО. Территория института «ВНИИСТРОМ»
</address>

<p>
    Прилегающие населенные пункты: Люберцы, Красково, Коренево, Томилино, Лыткарино, Некрасовка, Октябрьский, Котельники, Малаховка, Дзержинский,   Железнодорожный, Раменское, Жуковский, Выхино-Жулебино, Электроугли.
</p>

<div class="map">
    <script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Af6a25cbccd3d03fdf25afbd6fa0ae8a71873847b1239154e647b92b4d4c73cb9&amp;width=100%&amp;height=400&amp;lang=ru_RU&amp;scroll=true"></script>
</div>

    <div>
        <jsp:include page="/WEB-INF/view/templates/footer.jsp" />
    </div>

</div>



</body>
</html>
