package ru.airconcept.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    public static final String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
//    public static final String MYSQL_DRIVER = "com.mysql.jdbc.Driver";
    public static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/test_airconcept?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    public static final String LOGIN = "airconcept";
<<<<<<< HEAD
    public static final String PASSWORD = "";
=======
    public static final String PASSWORD = "k@4b8C321974";
>>>>>>> 460d10627ceaaa2c58d1df2bed3f1102e33c6d2f

    private static ConnectionFactory instance;

    private ConnectionFactory() {
        try {
            Class.forName(MYSQL_DRIVER);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Not found class " + MYSQL_DRIVER, e);
        }
    }

    public static synchronized ConnectionFactory getInstance() {
        if (instance == null) {
            instance = new ConnectionFactory ();
        }
        return instance;
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, LOGIN, PASSWORD);
    }
}
