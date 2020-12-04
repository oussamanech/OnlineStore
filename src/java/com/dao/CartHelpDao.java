
package com.dao;

import com.entites.Cart;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CartHelpDao {
  
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    String url = "jdbc:mysql://localhost/store";
    String user = "root";
    String password = "";
    
   public List<Cart> getAllCart() {
        List<Cart> carts = new ArrayList<Cart>();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
            String query = "SELECT * FROM `addtocart` ;";
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                Cart c = new Cart();
                c.setIduser(Integer.valueOf(resultSet.getString("iduser")));
                c.setIdproduct(Integer.valueOf(resultSet.getString("idproduct")));
                c.setQntInCart(Integer.valueOf(resultSet.getString("qntproduct")));

                carts.add(c);
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
        }
        return carts;
    }
 
      public List<Cart> getAllCart(int iduser) {
        List<Cart> carts = new ArrayList<Cart>();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
            String query = "SELECT * FROM `addtocart` where iduser like "+iduser+" ;";
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                Cart c = new Cart();
                c.setIduser(Integer.valueOf(resultSet.getString("iduser")));
                c.setIdproduct(Integer.valueOf(resultSet.getString("idproduct")));
                c.setQntInCart(Integer.valueOf(resultSet.getString("qntproduct")));

                carts.add(c);
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
        }
        return carts;
    }
 
}
