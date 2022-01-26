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

        int lastInsertId = orderService.saveCustomer(name, phone, email, comment, is_privacyID);
        List<ModelOrder> orderList = orderService.list();
        for (int i = 0; i < orderList.size(); i++) {
            orderService.saveOrder(lastInsertId, orderList.get(i).getNametemplate(), orderList.get(i).getNamematerial(),
                    orderList.get(i).getTypematerial(), orderList.get(i).getNumber(), orderList.get(i).getSize(), orderList.get(i).getWidth(),
                    orderList.get(i).getHeight(), orderList.get(i).getTotalNDC(), orderList.get(i).getImg());
        }

        CustomerOrderService customerOrderService = new CustomerOrderService(ConnectionFactory.getInstance());

        List<ModelCustomerOrder> mList = customerOrderService.getAll();

        ModelCustomerOrder modelCustomerOrder = customerOrderService.getByCustomerOrder(lastInsertId);

        for (int i = 0; i < mList.size(); i++) {
            if(modelCustomerOrder.getCustomerId() == mList.get(i).getCustomerId()){
                System.out.println(mList.get(i).getNameTemplate() + " " + " " + mList.get(i).getNameMaterial() + " " + mList.get(i).getTotalNDC());
            }
        }

        // Sender to email user
        String to = modelCustomerOrder.getEmail();

        // Sender's email ID needs to be mentioned
        String from = "post2074@gmail.com";

        // Assuming you are sending email from through gmails smtp
        String host = "smtp.gmail.com";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put ("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Get the Session object.// and pass username and password
        Session sessionMail = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("post2074@gmail.com", "k4b8c321974");
            }

        });

        // Used to debug SMTP issues
        sessionMail.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(sessionMail);

//            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("mail@htz.ru"));

            // Set From: header field of the header.
            message.setFrom(new InternetAddress (from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Производство вентиляционных решеток");

            StringBuilder listBuilder = new StringBuilder();

            listBuilder.append ("<style>\n" +
                    "        h1.one{\n" +
                    "            font-weight: normal;\n" +
                    "        }\n" +
                    "        table.inside tr td {\n" +
                    "            font-family: \"\";\n" +
                    "            font-size: 0.7em;\n" +
                    "        }\n" +
                    "        p{\n" +
                    "            font-size: 0.7em;\n" +
                    "        }\n" +
                    "        p.total{\n" +
                    "            font-size: 0.9em;\n" +
                    "        }\n" +
                    "    </style>");

            //Name customer
            listBuilder.append("<p>").append ("Ваше имя: ").append(modelCustomerOrder.getName()).append ("</p>");

            //Phone customer
            listBuilder.append("<p>").append("Ваш телефон: ").append (modelCustomerOrder.getPhone()).append ("</p>");

            //Email customer
            listBuilder.append("<p>").append ("Ваша электропочта: ").append (modelCustomerOrder.getEmail()).append ("</p>");

            //Comment customer
            listBuilder.append("<p>").append ("Ваш комментарий к заказу: ").append (modelCustomerOrder.getComment ()).append ("</p>");

            //All Cosst Grill of Cart
            BigDecimal allTotalCostsNDC = new BigDecimal (0);

            listBuilder.append ("<table class=inside border=0 width=100%>");
            for (int i = 0; i < mList.size(); i++) {
                if(modelCustomerOrder.getCustomerId() == mList.get(i).getCustomerId()) {
                    BigDecimal costCount = mList.get(i).getTotalNDC().multiply (new BigDecimal (mList.get (i).getNumber()));
                    allTotalCostsNDC = allTotalCostsNDC.add (costCount);
                    listBuilder.append ("<tr>");
                    if(mList.get(i).getNameMaterial().equals ("Латунь")){
                    listBuilder.append("<td>").append("<img src=").append("http://23.105.246.179:8080/").append ("/img/cart/copper/").append(mList.get(i).getImg()).append (".png>") .append("</td>");}
                    if(mList.get(i).getNameMaterial().equals ("Медь")){
                        listBuilder.append("<td>").append("<img src=http://23.105.246.179:8080/img/cart/brass/").append(mList.get(i).getImg()).append (".png>") .append("</td>");}
                    if(mList.get(i).getNameMaterial().equals ("Сталь")){
                        listBuilder.append("<td>").append("<img src=http://23.105.246.179:8080/img/cart/steel/").append(mList.get(i).getImg()).append (".png>") .append("</td>");}
                    listBuilder.append ("<td>").append ("Вентиляционная решетка ").append(mList.get(i).getNameTemplate()).append ("</td>");
                    listBuilder.append ("<td>").append(mList.get(i).getNameMaterial()).append ("</td>");
                    listBuilder.append ("<td>").append(mList.get(i).getWidth()).append ("мм ").append (mList.get (i).getHeight ()).append ("мм ") .append (mList.get (i).getSize()).append ("мм ") .append("</td>");
                    listBuilder.append ("<td>").append(costCount).append (" руб.").append ("</td>");
                    listBuilder.append ("<td>").append(mList.get(i).getNumber()).append (" шт.").append ("</td>");
                    listBuilder.append ("</tr>");
                }
            }
            listBuilder.append ("</table>");
            listBuilder.append ("<hr style=border-top: 1px solid black;>");
            listBuilder.append ("<p class = total>").append ("Общая стоимость: ").append(allTotalCostsNDC).append (" руб.").append ("</p>");

            message.setContent(listBuilder.toString(), "text/html; charset=UTF-8");

//            MailAdminService madmin = new MailAdminService();
//            madmin.send();

            System.out.println("sending...");

            // Send message
            Transport.send(message);

            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

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

