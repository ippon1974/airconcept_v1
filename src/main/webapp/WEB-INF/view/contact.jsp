<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <title>Контакты</title>
</head>
<body>
<jsp:include page="/WEB-INF/view/templates/menu.jsp" />
<h1>Контакты</h1>
<div style="">
    <div style="float: left; width: 80%; text-align: right">
        <c:if test="${cartService != null}">
            <div style="font-size: 0.9em" align="right"><a title="Корзина" style="color: red" href="/cart">Корзина</a> <strong>${count}</strong></div>
        </c:if>
    </div>
    <div style="clear: left"></div>
</div>
<p>Телефон: +7 (925) 585-33-71 В рабочие дни с 9:00 до 19:00. Суббота и воскресенье выходные дни</p>
<p>Электронная почта: box@wcut.ru</p>

<address style="font-style: normal">
    140080 ул. Карла Маркса д. 117, офис № 503 Люберецкий р-н, пос. Красково, МО. Территория института «ВНИИСТРОМ»
</address>

<jsp:include page="/WEB-INF/view/templates/footer.jsp" />
</body>
</html>
