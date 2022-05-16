package ru.airconcept.servlets;

import ru.airconcept.dao.ConnectionFactory;
import ru.airconcept.model.*;
import ru.airconcept.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet( "/catalog/grills")
public class GrillsServlet extends HttpServlet {

    private ModelGrill modelGrill;
    private GrillService grillService;

    private ModelCost modelCost;
    private CostService costService;

    private ModelCalc modelCalc;
    private CalcService calcService;

    private ModelTax tax;
    private TaxService taxService;

    private ModelCart modelCart;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if(req.getQueryString()==null){
            doGet_Def(req, resp);
        }else {
            doGet_Demo1(req, resp);
        }
    }

    protected void doGet_Def(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        grillService = new GrillService(ConnectionFactory.getInstance());
        List<ModelGrill> listGrills = grillService.getAll();
        req.setAttribute ("listGrills", listGrills);
        HttpSession session = req.getSession();
        CartService cartService = (CartService) session.getAttribute ("cartService");
        req.setAttribute ("cartService", cartService);
        // Проверякм количество товаров в корзине
        if(cartService != null){
            List<ModelCart> count = cartService.list();
            req.setAttribute ("count", count.size ());
        }
        req.getRequestDispatcher("/WEB-INF/view/grills.jsp").forward(req, resp);
    }

    protected void doGet_Demo1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String dt = myDateObj.format(myFormatObj);

        // Формируем строку запроса QueryString
        StringBuilder queryStirngCart = new StringBuilder();
        queryStirngCart.append ("template=")
                .append(req.getParameter("template"))
                .append ("&materialid=")
                .append(req.getParameter("materialid"))
                .append("&size=")
                .append (req.getParameter("size"))
                .append ("&width=")
                .append (req.getParameter("width"))
                .append ("&height=")
                .append (req.getParameter("height"));
        req.setAttribute ("queryStirngCart", queryStirngCart);

        String template = req.getParameter("template"); // параметр из строки запроса который переделан модулем rewrate
        HttpSession session = req.getSession();
        CartService cartService = (CartService) session.getAttribute ("cartService");
        req.setAttribute ("cartService", cartService);

        // Проверякм количество товаров в корзине
        if(cartService != null){
            List<ModelCart> count = cartService.list();
            req.setAttribute ("count", count.size ());
        }

        // Проверякм дубликаты в корзине
        if(cartService != null){
            List<ModelCart> rowProduct = cartService.list();
            boolean isStr = false;
            for (int i = 0; i < rowProduct.size(); i++) {
                StringBuilder sb = new StringBuilder ();
                sb.append ("template=")
                        .append (rowProduct.get (i).getImg())
                        .append ("&materialid=")
                        .append (rowProduct.get (i).getTypematerial())
                        .append ("&size=")
                        .append (rowProduct.get (i).getSize())
                        .append ("&width=")
                        .append (rowProduct.get (i).getWidth())
                        .append ("&height=")
                        .append (rowProduct.get (i).getHeight());

                String Str1 = new String(sb);
                String Str2 = new String(queryStirngCart);
                if(Str1.trim().equals (Str2.trim ())){
                    isStr = true;
                }
            }
            req.setAttribute ("isStr", isStr);
        }

        grillService = new GrillService(ConnectionFactory.getInstance());
        List<ModelGrill> listGrills = grillService.getAll();
        req.setAttribute ("listGrills", listGrills);

        String typematerial = req.getParameter ("materialid");
        int typematerialID = 0;
        if(typematerial != null) {
            typematerialID = Integer.parseInt(typematerial);
        }

        String number = req.getParameter ("number");
        int numberlID = 0;
        if(number != null) {
            numberlID = Integer.parseInt (number);
        }

        String material = req.getParameter("materialid");
        int materialID = 0;
        if(material != null) {
            materialID = Integer.parseInt (material);
        }
        req.setAttribute ("material", material);

        String size = req.getParameter("size");
        int sizeID = 0;
        if(size != null) {
            sizeID = Integer.parseInt (size);
        }
        req.setAttribute("size", size);

        String width = req.getParameter("width");
        int widthID = 0;
        if(width != null){
            widthID = Integer.parseInt(width);
        }
        req.setAttribute ("width", width);

        String height = req.getParameter ("height");
        int heightID = 0;
        if(height != null){
            heightID = Integer.parseInt (height);
        }
        req.setAttribute ("height", height);

        List<ModelMaterial> modelMaterial = grillService.getListMaterial();
        req.setAttribute ("modelMaterial", modelMaterial);

        List<ModelSize> modelSize = grillService.getListSize();
        req.setAttribute ("modelSize", modelSize);

        modelGrill = grillService.getByTransliterations(template);

        req.setAttribute ("transliterations", modelGrill.getGtransliterations());
        req.setAttribute("template", modelGrill.getGname());
        req.setAttribute("templateuri", modelGrill.getGtransliterations());
        req.setAttribute("id", modelGrill.getGid());

        calcService = new CalcService (ConnectionFactory.getInstance());
        if(material != null || size !=null) {
            modelCalc = calcService.getCostMatStore (materialID, sizeID);
            req.setAttribute ("modelCalc", modelCalc);
        }

        taxService = new TaxService(ConnectionFactory.getInstance());
        if(width != null || height != null){
            // Коэффициент длина из фррмы делим на 120
            double aspect = calcService.getAspect(widthID, heightID, modelGrill.getGw());
            req.setAttribute ("aspect", aspect);

            // Получаем площадь
            double area = calcService.getArea (widthID, heightID);
            req.setAttribute("area", area);

            // Получаем полную длину раскроя в погонных метрах
            int allcutlength = calcService.getCutLength (modelGrill.getGbord(), modelGrill.getGlenin(), aspect);
            req.setAttribute("allcutlength", allcutlength);

            // Общая стоимость материала без раскроя
            BigDecimal costmatnotcut = calcService.getCostMatNotCut(modelCalc.getCost(), area);
            req.setAttribute ("costmatnotcut", costmatnotcut);

            // Общая стоимость раскря без материала
            BigDecimal costcutnotmat = calcService.getCostCutNotMat(modelCalc.getCostmcut(), allcutlength / 1000);
            req.setAttribute ("costcutnotmat", costcutnotmat);

            // Общая таблица налогов и надбавок
            tax = taxService.getByTaxID(1);
            BigDecimal percent = new BigDecimal (100);
            BigDecimal taxNdc = new BigDecimal(tax.getTaxndc());
            BigDecimal taxIo = new BigDecimal(tax.getTaxio());
            BigDecimal taxMat = new BigDecimal(tax.getCoeffmat());
            BigDecimal taxCut = new BigDecimal(tax.getCoeffcut());
            BigDecimal addTaxMat = costmatnotcut.multiply(taxMat).divide(percent);
            BigDecimal addTaxCut = costcutnotmat.multiply(taxCut).divide (percent);
            BigDecimal total = costmatnotcut.add(costcutnotmat).add (addTaxMat).add(addTaxCut);
            BigDecimal addNdc = total.multiply(taxNdc).divide(percent);
            BigDecimal totalNdc = total.add (addNdc);
            totalNdc = totalNdc.setScale (0, RoundingMode.CEILING);
            req.setAttribute ("addTaxMat", addTaxMat);
            req.setAttribute ("addTaxCut", addTaxCut);
            req.setAttribute ("total", total);
            req.setAttribute ("totalNdc", totalNdc);

            // Пишим данные в сессию
            session.setAttribute("transliterationsSession", modelGrill.getGtransliterations());
            session.setAttribute("modelNameSession", modelGrill.getGname());
            session.setAttribute("materialSession", modelCalc.getMname());
            session.setAttribute("numberSession", 1);
            session.setAttribute("sizeSession", modelCalc.getSize());
            session.setAttribute("widthSession", widthID);
            session.setAttribute("heightSession", heightID);
            session.setAttribute("typematerialSession", typematerialID);
            session.setAttribute("totalSession",totalNdc);
            session.setAttribute("dtSession",dt);

            // Формируем строку для сравнения в корзине
            StringBuilder cartStringGoods = new StringBuilder ();
            cartStringGoods.append ("template=")
                    .append (modelGrill.getGtransliterations())
                    .append ("&materialid=")
                    .append(typematerialID)
                    .append("&size=")
                    .append (modelCalc.getSize())
                    .append ("&width=")
                    .append (widthID)
                    .append ("&height=")
                    .append (heightID);
            req.setAttribute ("cartStringGoods", cartStringGoods);
        }
        req.getRequestDispatcher ("/WEB-INF/view/product.jsp").forward (req, resp);
//        resp.sendRedirect("/successsubmit");
    }
}
