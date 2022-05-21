<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>403 Ошибка. Извините, запрошенная вами страница не найдена.</title>
</head>

<body>
<div style="text-align: center">
    <h1>403 Ошибка</h1>
    <h1>Извините, запрошенная вами страница не найдена.</h1>
    <p><a href="${pageContext.request.contextPath}/">Главная</a> | <a href="${pageContext.request.contextPath}/contact">Контакты</a></p>
</div>
</body>
</html>
