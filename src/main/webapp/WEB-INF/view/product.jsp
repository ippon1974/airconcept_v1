<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <c:choose>
        <c:when test="${width == null}">
            <title>Вентиляционная решетка ${template}</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
        </c:when>

        <c:when test="${width != null}">
            <title>Вентиляционная решетка ${template}. Материал: ${modelCalc.getMname()}. Длина: ${width}мм. Высота: ${height}мм. Толщина материала: ${size}мм.</title>
        </c:when>

        <c:otherwise>
            <title>Вентиляционная решетка</title>
        </c:otherwise>
    </c:choose>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
</head>

<body>
<div style="padding: 0 0 0 100px">
<jsp:include page="/WEB-INF/view/templates/menu.jsp" />
</div>
<table align="center" cellpadding="5" cellspacing="5" border="0" width="90%">
    <tr>
        <td valign="top" colspan="3">
            <p><a href="${pageContext.request.contextPath}/catalog/grills">Шаблоны решеток</a> <!-- <a href="/adaptive">Adaptive</a>--></p>

            <c:choose>
                <c:when test="${width == null}">
                    <h1>Вентиляционная решетка &#171;${template}&#187;</h1>
                </c:when>

                <c:when test="${width != null}">
                    <h1>Вентиляционная решетка &#171;${template}&#187;. Материал: ${modelCalc.getMname()}. Длина: ${width}мм. Высота: ${height}мм. Толщина материала: ${size}мм.</h1>
                </c:when>

                <c:otherwise>
                    <h1>Вентиляционная решетка</h1>
                </c:otherwise>
            </c:choose>

            <c:if test="${cartService != null}">
                <div style="font-size: 0.9em" align="right"><a title="Корзина" style="color: red" href="/cart">Корзина</a> <strong>${count}</strong></div>
            </c:if>
        </td>
    </tr>
    <tr valign="top">
        <td width="40%">
            <form method="get" id="search">
                <%--                <input type="hidden" name="number" value="1">--%>
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
                        <input type="number" min="120" max="3000" value="${width}" name="width" id="width" required/>
                    </fieldset>
                </div>

                <div>
                    <fieldset>
                        <legend>Высота</legend>
                        <input type="number" min="60" max="1500" value="${height}" name="height" id="height" required/>
                    </fieldset>
                </div>

                <div>
                    <br>
                    <input type="submit" value="Расчет "/>
                </div>

            </form>
        </td>
        <td valign="top">
            <%--            <c:if test="${totalNdc != null}">--%>
            <%--                <div>--%>
            <%--                    <form action="${pageContext.request.contextPath}/cart" name="cart" method="post">--%>
            <%--                        <input type="submit" value="В корзину">--%>
            <%--                    </form>--%>
            <%--                </div>--%>
            <%--            </c:if>--%>

            <c:choose>
                <c:when test="${isStr}">
                    <h3>Этот товар добавлен в корзину</h3>
                </c:when>
                <c:when test="${totalNdc != null}">
                    <div>
                        <form action="${pageContext.request.contextPath}/cart" name="cart" method="post">
                            <input type="submit" value="В корзину">
                        </form>
                    </div>
                </c:when>
                <c:otherwise>

                </c:otherwise>
            </c:choose>

            <h2 class="war">Вычисляем</h2>

            Результаты вычесления. Вычисляем примерную стоимость продукта.
            <dl>
                <dt>Шаблон</dt>
                <dd>${template}</dd>
                <dt>Материал</dt>
                <dd>${modelCalc.getMname()}</dd>
                <dt>Толщина материала</dt>
                <dd>${modelCalc.getSize()} мм.</dd>
                <dt>Длина шаблона</dt>
                <dd>${width} мм.</dd>
                <dt>Высота шаблона</dt>
                <dd>${height} мм.</dd>
            </dl>

            <dl class="calcTotal">
                <dt>Aspect </dt>
                <dd>${aspect}</dd>
                <dt>Площцадь </dt>
                <dd>${area} кв. м.</dd>
                <dt>Стоимость 1 кв. м. склад </dt>
                <dd>${modelCalc.getCost()} руб.</dd>
                <dt>Длина реза</dt>
                <dd>${allcutlength} пог. м.</dd>
                <dt>Стоимость реза 1 пог. м.</dt>
                <dd>${modelCalc.getCostmcut()}  руб.</dd>
            </dl>

            <div class="finalCalc">
                <p>Стоимость материала без раскроя: ${costmatnotcut} руб. + 30% надбавка за материал ${addTaxMat} руб.</p>
                <p>Стоимость раскрооя без материала: ${costcutnotmat} руб. + 30% надбавка за раской ${addTaxCut} руб.</p>

                <div>
                    <h3>Итого: ${total} руб.</h3>
                    <h3>Итого с НДС: ${totalNdc} руб.</h3>
                </div>
            </div>

        </td>
        <td>
            <c:if test="${material == null}">
                <p><img src="/img/blank/${transliterations}.png"></p>
            </c:if>
            <c:if test="${material == 1}">
                <p><img src="/img/copper/${transliterations}.png"></p>
            </c:if>
            <c:if test="${material == 2}">
                <p><img src="/img/brass/${transliterations}.png"></p>
            </c:if>
            <c:if test="${material == 3}">
                <p><img src="/img/steel/${transliterations}.png"></p>
            </c:if>
        </td>
    </tr>
</table>

<jsp:include page="/WEB-INF/view/footer.jsp" />
</body>
</html>
