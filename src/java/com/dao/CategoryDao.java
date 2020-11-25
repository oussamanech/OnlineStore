package com.dao;

import com.entites.Category;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CategoryDao {

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    String url = "jdbc:mysql://localhost/store";
    String user = "root";
    String password = "";

    public List<Category> getAllCategory() {
        List<Category> categorys = new ArrayList<Category>();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
            String query = "SELECT * FROM `category` ;";
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                Category c = new Category();
                c.setCatId(Integer.valueOf(resultSet.getString("catid")));
                c.setCatTitle(resultSet.getString("cattitle"));
                c.setCatDesc(resultSet.getString("catDes"));

                categorys.add(c);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return categorys;
    }

}
