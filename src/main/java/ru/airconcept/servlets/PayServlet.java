package ru.airconcept.servlets;

import ru.airconcept.model.ModelCart;
import ru.airconcept.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet( "/pay")
public class PayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        CartService cartService = (CartService) session.getAttribute ("cartService");
        // Проверякм количество товаров в корзине
        if(cartService != null){
            List<ModelCart> count = cartService.list();
            req.setAttribute ("count", count.size ());
        }
        req.getRequestDispatcher("/WEB-INF/view/pay.jsp").forward(req, resp);
    }
}
