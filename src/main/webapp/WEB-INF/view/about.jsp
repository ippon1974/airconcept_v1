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
    <title>О нас</title>
</head>
<body>

<div style="margin: 1em 30px 1em 30px;">

    <div style="padding: 0 0 0 0">
        <jsp:include page="/WEB-INF/view/templates/menu_gamburger.jsp" />
        <jsp:include page="/WEB-INF/view/templates/menu.jsp" />
    </div>

    <h1>О нас</h1>
    <div style="">
        <div style="float: left; width: 80%; text-align: right">
            <c:if test="${cartService != null}">
                <div style="font-size: 0.9em" align="right"><a title="Корзина" style="color: yellow" href="/cart">Корзина</a> <strong>${count}</strong></div>
            </c:if>
        </div>
        <div style="clear: left"></div>
    </div>

    <p></p>Компания «Airconcept» была создана в 2014 году.
    <p>Наш осноыной вид деятельности производство изделий из цветного, черного металла, а так же изделий из природного и искусственного камня.</p>
    <p>За это время накоплен опыт, знания, расширилась собственная клиентская база.</p>
    <div>
        <jsp:include page="/WEB-INF/view/templates/footer.jsp" />
    </div>

</div>



</body>
</html>
