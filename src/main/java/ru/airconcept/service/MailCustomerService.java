package ru.airconcept.service;


import ru.airconcept.dao.ConnectionFactory;
import ru.airconcept.model.ModelCustomerOrder;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.math.BigDecimal;
import java.util.List;
import java.util.Properties;

public class MailCustomerService {
    private String to;
    private String from;
    private String host;
    private String port;
    private Properties properties;
    private Session session;
    private ModelCustomerOrder modelCustomerOrder;
    private CustomerOrderService customerOrderService;
    private int lastInsertId;

    public MailCustomerService(String to, String from, String host, String port, int lastInsertId) {
        this.to = to;
        this.from = from;
        this.host = host;
        this.port = port;
        this.lastInsertId = lastInsertId;

    }

    private void getPropertiesServer(){
        properties = System.getProperties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put ("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.auth", "true");
    }

    public void sendMail(){
        customerOrderService = new CustomerOrderService(ConnectionFactory.getInstance());
        List<ModelCustomerOrder> mList = customerOrderService.getAll();
        modelCustomerOrder = customerOrderService.getByCustomerOrder(lastInsertId);

        getPropertiesServer();

        // Get the Session object.// and pass username and password
        session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("post2074@gmail.com", "00000000");
            }

        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

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

    }

    public void sendAdminMain(){
        customerOrderService = new CustomerOrderService(ConnectionFactory.getInstance());
        List<ModelCustomerOrder> mList = customerOrderService.getAll();
        modelCustomerOrder = customerOrderService.getByCustomerOrder(lastInsertId);
        getPropertiesServer();

        // Get the Session object.// and pass username and password
        session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("post2074@gmail.com", "00000");
            }

        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress("box@wcut.ru"));

            // Set Subject: header field
            message.setSubject("Запрос с сайта: Airconcept.ru");
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
            listBuilder.append("<p>").append ("Имя клиента: ").append(modelCustomerOrder.getName()).append ("</p>");

            //Phone customer
            listBuilder.append("<p>").append("Телефон клиента: ").append (modelCustomerOrder.getPhone()).append ("</p>");

            //Email customer
            listBuilder.append("<p>").append ("Почта клиента: ").append (modelCustomerOrder.getEmail()).append ("</p>");

            //Comment customer
            listBuilder.append("<p>").append ("Комментарий клиента: ").append (modelCustomerOrder.getComment ()).append ("</p>");

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


    }

}
