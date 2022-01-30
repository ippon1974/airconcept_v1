package ru.airconcept.service;

import ru.airconcept.dao.ConnectionFactory;
import ru.airconcept.dao.DaoException;
import ru.airconcept.model.ModelGrill;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FilterGrillService {
    public static final String SELECT_ALL_QUERY = "SELECT * FROM cgrill WHERE gispubl = '1' ORDER BY gname";
    public static final String COLUMN_ID = "gid";
    public static final String COLUMN_TYPE = "gtype";
    public static final String COLUMN_NAME = "gname";
    public static final String COLUMN_TRANSLITERATIONS = "gtransliterations";
    public static final String COLUMM_WIDTH = "gw";
    public static final String COLUMM_HEIGHT = "gh";
    public static final String COLUMM_BORDER = "gbord";
    public static final String COLUMM_LEN_INSIDE = "glenin";
    public static final String COLUMM_ALL_METER_POG = "glenall";
    public static final String COLUMM_PATH_TO_IMG = "gpathimg";
    public static final String COLUMM_DESC_TEMPLATE = "gdesc";
    public static final String COLUMM_KEYWORDS_TEMPLATE = "gkeyw";
    public static final String COLUMM_DT = "gdt";
    public static final String COLUMM_PUBLISH= "gispubl";

    private ConnectionFactory connectionFactory = null;
    public FilterGrillService(ConnectionFactory connectionFactory) {
        this.connectionFactory = connectionFactory;
    }

    public List<ModelGrill> getAll() {
        List<ModelGrill> all = new ArrayList<ModelGrill> ();
        try (Connection connection = connectionFactory.getConnection();
             Statement statement = connection.createStatement();) {
            try (ResultSet resultSet = statement.executeQuery(SELECT_ALL_QUERY);) {
                while (resultSet.next()) {
                    all.add(new ModelGrill (resultSet.getInt(COLUMN_ID),
                            resultSet.getInt(COLUMN_TYPE),
                            resultSet.getString(COLUMN_NAME),
                            resultSet.getString(COLUMN_TRANSLITERATIONS),
                            resultSet.getInt(COLUMM_WIDTH),
                            resultSet.getInt(COLUMM_HEIGHT),
                            resultSet.getInt(COLUMM_BORDER),
                            resultSet.getInt(COLUMM_LEN_INSIDE),
                            resultSet.getInt (COLUMM_ALL_METER_POG),
                            resultSet.getString(COLUMM_PATH_TO_IMG),
                            resultSet.getString (COLUMM_DESC_TEMPLATE),
                            resultSet.getString(COLUMM_KEYWORDS_TEMPLATE),
                            resultSet.getDate(COLUMM_DT),
                            resultSet.getBoolean(COLUMM_PUBLISH)
                    ));
                }
            }
        } catch (Exception e) {
            throw new DaoException ("Method getAll() has thrown an exception.", e);
        }
        return all;
    }


}
