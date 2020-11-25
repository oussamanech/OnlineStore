package com.dao;

import com.entites.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDao {

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    String url = "jdbc:mysql://localhost/store";
    String user = "root";
    String password = "";

    // get all product
    public List<Product> getAllProduct() {

        List<Product> p = new ArrayList<Product>();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
            String query = "SELECT * FROM `product` ;";
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                Product p1 = new Product();
                p1.setCatId(Integer.valueOf(resultSet.getString("catid")));
                p1.setId(Integer.valueOf(resultSet.getString("prodid")));
                p1.setpName(resultSet.getString("prodname"));
                p1.setpDesc(resultSet.getString("proddesc"));
                p1.setpPrice(Integer.valueOf(resultSet.getString("prodprice")));
                p1.setpDiscount(Integer.valueOf(resultSet.getString("proddiscount")));
                p1.setpQuantity(Integer.valueOf(resultSet.getString("prodquantity")));
                p1.setpPic(resultSet.getString("prodphoto"));
                //p.add(resultSet.getString("cattitle"));

                p.add(p1);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public List<Product> getAllProduct(int catid2) {

        List<Product> p = new ArrayList<Product>();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();

            String query = "SELECT * FROM `product` WHERE `catid` =" + catid2 + "";
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                Product p1 = new Product();
                p1.setCatId(Integer.valueOf(resultSet.getString("catid")));
                p1.setId(Integer.valueOf(resultSet.getString("prodid")));
                p1.setpName(resultSet.getString("prodname"));
                p1.setpDesc(resultSet.getString("proddesc"));
                p1.setpPrice(Integer.valueOf(resultSet.getString("prodprice")));
                p1.setpDiscount(Integer.valueOf(resultSet.getString("proddiscount")));
                p1.setpQuantity(Integer.valueOf(resultSet.getString("prodquantity")));
                p1.setpPic(resultSet.getString("prodphoto"));
                //p.add(resultSet.getString("cattitle"));

                p.add(p1);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

}
