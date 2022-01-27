package ru.airconcept.servlets;

import ru.airconcept.dao.ConnectionFactory;
import ru.airconcept.model.ModelCart;
import ru.airconcept.model.ModelCustomerOrder;
import ru.airconcept.model.ModelGrill;
import ru.airconcept.model.ModelOrder;
import ru.airconcept.service.*;

import javax.activation.CommandMap;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.activation.MailcapCommandMap;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    private OrderService orderService;
    private ModelOrder modelOrder;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session;
        session = req.getSession(true);
        CartService cartService = (CartService) session.getAttribute ("cartService");
        List<ModelCart> cartList = cartService.list();

        orderService = new OrderService(ConnectionFactory.getInstance());
        List<ModelOrder> orderList = orderService.list();

        for (int i = 0; i < cartList.size(); i++) {
            modelOrder = new ModelOrder();
            modelOrder.setNametemplate (cartList.get(i).getName());
            modelOrder.setNamematerial (cartList.get(i).getNamematerial());
            modelOrder.setTypematerial (cartList.get(i).getTypematerial());
            modelOrder.setNumber (cartList.get(i).getNumber());
            modelOrder.setSize (cartList.get(i).getSize ());
            modelOrder.setWidth (cartList.get(i).getWidth ());
            modelOrder.setHeight (cartList.get(i).getHeight ());
            modelOrder.setImg (cartList.get(i).getImg ());
            modelOrder.setTotalNDC (cartList.get(i).getTotalNDC());
            orderList.add (modelOrder);
        }
        req.setAttribute ("orderList", orderList);
        req.getRequestDispatcher("/WEB-INF/view/order.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session;
        session = req.getSession(true);

        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String comment = req.getParameter("comment");
        String is_privacy = req.getParameter ("is_privacy");
        int is_privacyID = 0;
        if(is_privacy != null) {
            is_privacyID = Integer.parseInt(is_privacy);
        }

        // Сохраняем ордер пользователя в базу данных
        int lastInsertId = orderService.saveCustomer(name, phone, email, comment, is_privacyID);
        List<ModelOrder> orderList = orderService.list();
        for (int i = 0; i < orderList.size(); i++) {
            orderService.saveOrder(lastInsertId, orderList.get(i).getNametemplate(), orderList.get(i).getNamematerial(),
                    orderList.get(i).getTypematerial(), orderList.get(i).getNumber(), orderList.get(i).getSize(), orderList.get(i).getWidth(),
                    orderList.get(i).getHeight(), orderList.get(i).getTotalNDC(), orderList.get(i).getImg());
        }

        // Подготавливем отправку уведомления пользователю по электронной почте
        MailCustomerService mailCustomerService = new MailCustomerService(email, "post2074@gmail.com", "smtp.gmail.com", "465", lastInsertId);

        // Отправляем письмо клиенту
        mailCustomerService.sendMail();

        // Отправляем письмо администратору
        mailCustomerService.sendAdminMain();

        // Проверяем поля формы на заполнение на уровне сервера. Если все ок отправляем.
        List<String> errors = new ArrayList<String>();
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter pw = resp.getWriter();

        if (name.equals("") || null == name) {
            errors.add("Поле <strong>Имя</strong> не может быть пустым.");
        }
        if (phone.equals("") || null == phone) {
            errors.add("Поле <strong>Телефон</strong> не может быть пустым.");
        }
        if (email.equals("") || null == email) {
            errors.add("Поле <strong>Email</strong> не может быть пустым.");
        }

        if (!errors.isEmpty()) {
            String errorList = "<ul>";
            for (String error : errors) {
                errorList += "<li>" + error + "</li>";
            }
            errorList += "</ul>";
            errorList += "<p><a href=/order><< Вернутся к заказу</a><p>";
            pw.println(errorList);
        } else {
            session.removeAttribute("cartService");
            resp.sendRedirect("/successsubmit");
        }
    }
}

