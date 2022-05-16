package ru.airconcept.servlets;

import ru.airconcept.dao.ConnectionFactory;
import ru.airconcept.model.ModelCart;
import ru.airconcept.model.ModelGrill;
import ru.airconcept.service.CartService;
import ru.airconcept.service.GrillService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("")
public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        CartService cartService = (CartService) session.getAttribute ("cartService");
        // Проверякм количество товаров в корзине
        if(cartService != null){
            List<ModelCart> count = cartService.list();
            req.setAttribute ("count", count.size ());
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/view/index.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/view/index.jsp");
        requestDispatcher.forward(req, resp);

    }
}
