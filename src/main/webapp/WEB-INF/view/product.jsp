<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/img/icons/favicon.ico" type="image/x-icon" />
    <c:choose>
        <c:when test="${width == null}">
            <title>Вентиляционная решетка ${template}</title>
            <meta name="description" content="Решетка для вентиляции ${template}. ">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        </c:when>

        <c:when test="${width != null}">
            <meta name="description" content="Решетка для ветиляции ${template}. Материал: ${modelCalc.getMname()}. Длина: ${width} мм. Высота: ${height} мм. Толщина: ${size} мм.">
            <title>Вентиляционная решетка ${template}. Материал: ${modelCalc.getMname()}. Длина: ${width} мм. Высота: ${height} мм. Толщина материала: ${size} мм.</title>
        </c:when>

        <c:otherwise>
            <meta name="description" content="Решетка для ветиляции ${template}.">
            <title>Вентиляционная решетка</title>
        </c:otherwise>
    </c:choose>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/air_02.css">
<%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style1.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page1.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gamburger.css">
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.4/clipboard.min.js" type = "text/javascript"></script>
</head>

<body>

<div class="container">
    <div class="item menu">
        <div>
            <jsp:include page="/WEB-INF/view/templates/menu_gamburger.jsp" />
            <jsp:include page="/WEB-INF/view/templates/menu.jsp" />
        </div>
    </div>

    <div class="item cart">
        <c:if test="${cartService != null}">
            <div><a title="Корзина" href="/cart">Корзина</a> <strong>${count}</strong></div>
        </c:if>
    </div>

    <div class="item title">
        <c:choose>
            <c:when test="${width == null}">
                <h1 class="productInfoHead">Вентиляционная решетка &#171;${template}&#187;</h1>
            </c:when>

            <c:when test="${width != null}">
                <h1 class="productInfoHead">Вентиляционная решетка &#171;${template}&#187;</h1>
                <h2 class="subheaderProduct">Материал: ${modelCalc.getMname()}. Длина: ${width} мм. Высота: ${height} мм. Толщина материала: ${size} мм.</h2>
            </c:when>

            <c:otherwise>
                <h1>Вентиляционная решетка</h1>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="item sideform">
        <form method="get" id="search">
            <div>
                <fieldset>
                    <legend>Шаблон</legend>
                    <select class="custom-select" id="template" name="template">
                        <c:forEach var="listGrills" items="${listGrills}">
                            <c:if test="${templateuri == listGrills.gtransliterations}">
                                <option value="${listGrills.gtransliterations}" selected>${listGrills.gname}</option>
                            </c:if>
                            <c:if test="${templateuri != listGrills.gtransliterations}">
                                <option value="${listGrills.gtransliterations}">${listGrills.gname}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </fieldset>
            </div>
            <div>
                <fieldset>
                    <legend>Материал</legend>
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
                </fieldset>
            </div>
            <div>
                <fieldset>
                    <legend>Толщина листа</legend>
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
                </fieldset>
            </div>

            <div>
                <fieldset>
                    <legend>Длина</legend>
                    <c:if test="${totalNdc == null}">
                        <input autocomplete="off" autofocus class="custom-size" type="number" min="120" max="3000" value="${width}" name="width" id="width" required/>
                    </c:if>
                    <c:if test="${totalNdc != null}">
                        <input autocomplete="off" class="custom-size" type="number" min="120" max="3000" value="${width}" name="width" id="width" required/>
                    </c:if>
                </fieldset>
            </div>

            <div>
                <fieldset>
                    <legend>Высота</legend>
                    <c:if test="${totalNdc == null}">
                        <input class="custom-size" type="number" min="60" max="1500" value="${height}" name="height" id="height" required/>
                    </c:if>
                    <c:if test="${totalNdc != null}">
                        <input class="custom-size" type="number" min="60" max="1500" value="${height}" name="height" id="height" required/>
                    </c:if>
<%--                    <input class="custom-size" type="number" min="60" max="1500" value="750" name="height" id="height" required/>--%>
                </fieldset>
            </div>
            <div>
                <br>
                <input class="button" type="submit" value="Расчет "/>
            </div>

        </form>
    </div>
    <div class="item result">
        <div class="cart_add_result">
        <c:choose>
            <c:when test="${isStr}">
                <h3>Товар добавлен в корзину</h3>
            </c:when>
            <c:when test="${totalNdc != null}">
                <div>
                    <form action="${pageContext.request.contextPath}/cart" name="cart" method="post">
                        <input class="add_card" type="submit" value="В корзину">
                    </form>
                </div><br>
            </c:when>
            <c:otherwise>

            </c:otherwise>
        </c:choose>
        </div>

        <c:if test="${totalNdc == null}">
            <h2>Расчет стоимости</h2>
            <dl>
                <dt>Шаблон</dt>
                <dd>${template}</dd>
                <dt>Материал</dt>
                <dd>Не выбран</dd>
                <dt>Толщина</dt>
                <dd>Нет</dd>
                <dt>Длина</dt>
                <dd>Нет</dd>
                <dt>Высота</dt>
                <dd>Нет размера</dd>
            </dl>
        </c:if>
        <c:if test="${totalNdc != null}">
            <dl>
                <dt>Шаблон</dt>
                <dd>${template}</dd>
                <dt>Материал</dt>
                <dd>${modelCalc.getMname()}</dd>
                <dt>Толщина</dt>
                <dd>${modelCalc.getSize()} мм.</dd>
                <dt>Длина</dt>
                <dd>${width} мм.</dd>
                <dt>Высота</dt>
                <dd>${height} мм.</dd>
            </dl>
        </c:if>

        <div class="finalCalc">
<%--                            <p>Стоимость материала без раскроя: ${costmatnotcut} руб. + 30% надбавка за материал ${addTaxMat} руб.</p>--%>
<%--                            <p>Стоимость раскрооя без материала: ${costcutnotmat} руб. + 30% надбавка за раской ${addTaxCut} руб.</p>--%>
            <c:if test="${totalNdc != null}">
                <div class="pricetotal">
                    <p>Итого: ${totalNdc} руб.</p>
                </div>
            </c:if>
                <div class="note">
                    <p class="war">Внимание!</p>
                    <p>Данный расчет является приблизительным.</p>
                    <p>Точная стоимость вентиляционной решетки будет известна после всех согласований с заказчиком.</p>
                    <p class="owndesign">Если у вас есть свой дизайн вентиляционной решетки, вы можете отправить чертеж или эскиз на нашу почту: <span class="desmail">box@airconcept.ru</span></p>
                </div>
<%--            <c:if test="${totalNdc != null}">--%>
<%--                <div class="copy_link">--%>
<%--                <p id="foo">http://${pageContext.request.getServerName()}/catalog/grills?${cartStringGoods}</p>--%>
<%--                <!-- data-clipboard-target - ссылка на, то что будет копироваться -->--%>
<%--                <button class="btn" data-clipboard-target="#foo">Копировать ссылку</button>--%>
<%--                </div>--%>
<%--            </c:if>--%>

        </div>


    </div>
    <div class="item img">
        <c:if test="${material == null}">
            <p><img class="responsive" alt="Вентиляционная решетка: ${template}" src="${pageContext.request.contextPath}/img/blank/${transliterations}.png"></p>
        </c:if>
        <c:if test="${material == 1}">
            <p><img class="responsive" alt="Вентиляционная решетка: ${template}" src="${pageContext.request.contextPath}/img/copper/${transliterations}.png"></p>
        </c:if>
        <c:if test="${material == 2}">
            <p><img class="responsive" alt="Вентиляционная решетка: ${template}" src="${pageContext.request.contextPath}/img/brass/${transliterations}.png"></p>
        </c:if>
        <c:if test="${material == 3}">
            <p><img class="responsive" alt="Вентиляционная решетка: ${template}" src="${pageContext.request.contextPath}/img/steel/${transliterations}.png"></p>
        </c:if>
    </div>
    <div class="item footer">
        <jsp:include page="/WEB-INF/view/templates/footer.jsp" />
        <script src="${pageContext.request.contextPath}/js/bufer.js"></script>
    </div>
</div>
</body>
</html>