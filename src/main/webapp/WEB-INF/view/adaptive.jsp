<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Grid_02</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adaptive.css">
</head>
<body>

<header>
    Header
</header>
<div class="navnav">Home | About | Contacts</div>
<article>
    <h1>Расчет стоимости</h1>
    <p class="example">Remember that browser support for Grid is good but requires fallbacks for legacy browsers. That means a straight up copy and paste of these may not be well suited for some use cases.</p>
</article>
<div class="img">
    <img class="responsive" src="${pageContext.request.contextPath}/img/copper/victorian.png">
</div>
<aside>
    <form method="get" id="search">

        <div>
            <fieldset>
                <legend>Шаблон</legend>
                <select class="custom-select" id="template" name="template">
                    <option value="amelie" selected>Amelie</option>
                    <option value="antique-flower">Antique Flower</option>
                    <option value="antiquity">Antiquity</option>
                    <option value="barcelona">Barcelona</option>
                    <option value="becker">Becker</option>
                    <option value="beethoven">Beethoven</option>
                    <option value="belfast">Belfast</option>
                    <option value="bella">Bella</option>
                    <option value="cell">Cell</option>
                    <option value="celtic-cross">Celtic Cross</option>
                    <option value="circle">Circle</option>
                    <option value="clover">Clover</option>
                    <option value="colette">Colette</option>
                    <option value="craftsman">Craftsman</option>
                    <option value="cusick">Cusick</option>
                    <option value="diamond">Diamond</option>
                    <option value="diamond-flower">Diamond Flower</option>
                    <option value="dorothea">Dorothea</option>
                    <option value="egyptian">Egyptian</option>
                    <option value="ellas">Ellas</option>
                    <option value="elysian">Elysian</option>
                    <option value="emiques">Emiques</option>
                    <option value="erebia">Erebia</option>
                    <option value="flower">Flower</option>
                    <option value="french-curl">French Curl</option>
                    <option value="french-parlor">French Parlor</option>
                    <option value="genesis">Genesis</option>
                    <option value="geo">Geo</option>
                    <option value="gianetti">Gianetti</option>
                    <option value="gothic">Gothic</option>
                    <option value="gothic-clover">Gothic Clover</option>
                    <option value="gothic-fleur-de-li">Gothic Fleur-De-Li</option>
                    <option value="grecian">Grecian</option>
                    <option value="hanna">Hanna</option>
                </select>
            </fieldset>
        </div>
        <div>
            <fieldset>
                <legend>Материал</legend>
                <select class="custom-select" id="materialid" name="materialid">
                    <option value="1">Латунь</option>
                    <option value="2">Медь</option>
                    <option value="3">Сталь</option>
                </select>
            </fieldset>
        </div>
        <div>
            <fieldset>
                <legend>Толщина листа</legend>
                <select class="custom-select" id="size" name="size">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </fieldset>
        </div>

        <div>
            <fieldset>
                <legend>Длина</legend>
                <input class="w" type="number" min="120" max="3000" value="" name="width" id="width" placeholder="Длина" required/>
            </fieldset>
        </div>

        <div>
            <fieldset>
                <legend>Высота</legend>
                <input class="h" type="number" min="60" max="1500" value="" name="height" id="height" placeholder="Высота" required/>
            </fieldset>
        </div>

        <div>
            <br>
            <input class="submit" type="submit" value="Расчет "/>
        </div>

    </form>
</aside>
<footer>
    Footer
</footer>

</body>
</html>