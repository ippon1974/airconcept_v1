<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="yandex-verification" content="4672193bab487671" />
    <title>Декоративные вентиляционные решетки из латуни меди стали</title>
</head>

<body>

<jsp:include page="/WEB-INF/view/templates/menu.jsp" />

<div style="">
    <div style="float: left; width: 80%; text-align: right">
        <c:if test="${cartService != null}">
            <div style="font-size: 0.9em" align="right"><a title="Корзина" style="color: red" href="/cart">Корзина</a> <strong>${count}</strong></div>
        </c:if>
    </div>
    <div style="clear: left"></div>
</div>

<h2>Производство вентиляционных решеток из латуни, меди, нержавеющей стали</h2>

<jsp:include page="/WEB-INF/view/templates/footer.jsp" />

</body>
</html>