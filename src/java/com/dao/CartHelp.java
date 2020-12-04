package com.dao;

import com.entites.Cart;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CartHelp {
  
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    String url = "jdbc:mysql://localhost/store";
    String user = "root";
    String password = "";
    
    public  boolean isProductAddToCart(int iduser,int idprod){
      
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
            String query = "SELECT * FROM `addtocart` WHERE `iduser` = "+iduser+" and `idproduct` = "+idprod+";";
            resultSet = statement.executeQuery(query);

            if( resultSet.next() ){
                return true;
            }
             
        } catch (Exception e) {
            e.getLocalizedMessage();
        }
        return false;
    }

    public int nmbrProdinCart(int iduser){
        int x=0;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
            String query = "SELECT * FROM `addtocart` WHERE `iduser` = "+iduser+";";
            resultSet = statement.executeQuery(query);

            while( resultSet.next() ){
                x=x+1;
            }
             
        } catch (Exception e) {
            e.getLocalizedMessage();
        }
        return x;
        
    }

}
