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
import java.util.ArrayList;
import java.util.List;

@WebServlet( "/filtergrills")
public class FilterGrillServlet extends HttpServlet {

    private ModelGrill modelGrill;
    private GrillService grillService;

    private ModelCalc modelCalc;
    private CalcService calcService;

    private ModelTax tax;
    private TaxService taxService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String material = req.getParameter("materialid");
        int materialID = 0;
        if(material != null) {
            materialID = Integer.parseInt (material);
        }

        String size = req.getParameter("size");
        int sizeID = 0;
        if(size != null) {
            sizeID = Integer.parseInt (size);
        }

        String width = req.getParameter("width");
        int widthID = 0;
        if(width != null){
            widthID = Integer.parseInt(width);
        }

        String height = req.getParameter ("height");
        int heightID = 0;
        if(height != null){
            heightID = Integer.parseInt (height);
        }

        grillService = new GrillService(ConnectionFactory.getInstance());
        List<ModelGrill> listGrills = grillService.getAll();

        calcService = new CalcService (ConnectionFactory.getInstance());
        if(material != null || size !=null) {
            modelCalc = calcService.getCostMatStore (materialID, sizeID);
        }

        taxService = new TaxService(ConnectionFactory.getInstance());

        // Модель для заполнения расчетов в цикле для фильтра
        List<ModelFilterCalc> listFilterCalcs = new ArrayList<ModelFilterCalc>();

        if(width != null || height != null) {
            for (int i = 0; i < listGrills.size ( ); i++) {
                 ModelFilterCalc mf = new ModelFilterCalc ();
                // Коэффициент длина из фррмы делим на 120
                double aspect = calcService.getAspect (widthID, heightID, listGrills.get (i).getGw());

                // Получаем площадь
                double area = calcService.getArea (widthID, heightID);

                // Получаем полную длину раскроя в погонных метрах
                int allcutlength = calcService.getCutLength (listGrills.get (i).getGbord(), listGrills.get (i).getGlenin(), aspect);

                // Общая стоимость материала без раскроя
                BigDecimal costmatnotcut = calcService.getCostMatNotCut(modelCalc.getCost(), area);

                // Общая стоимость раскря без материала
                BigDecimal costcutnotmat = calcService.getCostCutNotMat(modelCalc.getCostmcut(), allcutlength / 1000);

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
                mf.setGname (listGrills.get (i).getGname ());
                mf.setMaterialid(materialID);
                mf.setGw (widthID);
                mf.setGh (heightID);
                mf.setSize (sizeID);
                mf.setTotalNdc (totalNdc);
                mf.setGpathimg (listGrills.get (i).getGtransliterations ());
                mf.setGtransliterations (listGrills.get (i).getGtransliterations ());
                listFilterCalcs.add (mf);
            }

            req.setAttribute ("listFilterCalcs", listFilterCalcs);
            req.setAttribute ("listGrills", listGrills);
            req.setAttribute ("material", materialID);
            req.setAttribute ("size", sizeID);
            req.setAttribute ("width", widthID);
            req.setAttribute ("height", heightID);

            List<ModelMaterial> modelMaterial = grillService.getListMaterial();
            req.setAttribute ("modelMaterial", modelMaterial);

            List<ModelSize> modelSize = grillService.getListSize();
            req.setAttribute ("modelSize", modelSize);

        }

        req.getRequestDispatcher ("/WEB-INF/view/filtergrills.jsp").forward (req, resp);
    }
}
