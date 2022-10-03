<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="yandex-verification" content="4672193bab487671" />
    <meta name="mailru-domain" content="OfhnFCfLcyDirjtk" />
    <link rel="icon" href="${pageContext.request.contextPath}/img/icons/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <meta name="keywords" content="Вентиляционная решетка под заказ,решетка зи латуни, решетка из меди, решетка из стали, решетка из камня">
    <meta name="description" content="Производство вентиляционных решеток различного дизайна из латуни, меди, нержавеющей стали, природного и искусственного камня" />
    <title>Производство вентиляционных решеток различного дизайна из латуни, меди, нержавеющей стали.</title>
</head>

<body>

<jsp:include page="/WEB-INF/view/templates/menu.jsp" />

<div style="">
    <div style="float: left; width: 80%; text-align: right">
        <c:if test="${cartService != null}">
            <div style="font-size: 0.9em" align="right"><a title="Корзина" style="color: yellow" href="/cart">Корзина</a> <strong>${count}</strong></div>
        </c:if>
    </div>
    <div style="clear: left"></div>
</div>

<div style="padding: 0 10px 0 10px;">
<h1 class="mainpageheader">Производство <a href="${pageContext.request.contextPath}/catalog/grills">вентиляционных решеток</a> из
    <a href="/filtergrills?materialid=1&size=1&width=300&height=300">латуни</a>,
    <a href="/filtergrills?materialid=2&size=1&width=300&height=300">меди</a>, <a href="/filtergrills?materialid=3&size=1&width=300&height=300">нержавеющей стали</a></h1>
</div>

<jsp:include page="/WEB-INF/view/templates/footer.jsp" />

</body>
</html>