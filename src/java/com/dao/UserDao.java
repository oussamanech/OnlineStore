package com.dao;

import com.entites.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    String url = "jdbc:mysql://localhost/store";
    String user = "root";
    String password = "";

    public User getUserPyEmailAndPassword(String e, String p) {
        User u1 = null;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
            String query = "SELECT * FROM `user` WHERE `useremail`='" + e + "' AND `userpassword`='" + p + "';";
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                User u = new User();
                u.setUserAddress(resultSet.getString("useraddress"));
                u.setUserEmail(e);
                u.setUserId(Integer.parseInt(resultSet.getString("userid")));
                u.setUserName(resultSet.getString("username"));
                u.setUserPassword(p);
                u.setUserPhone(resultSet.getString("userphone"));
                u.setUserPic(resultSet.getString("userpic"));
                u.setUserType(resultSet.getString("type"));
                u1 = u;
            }
            connection.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return u1;
    }

    public List<User> getAllUsers() {
        List<User> u1 = new ArrayList<User>();

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
            String query = "SELECT * FROM `user`;";
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                User u = new User();
                u.setUserAddress(resultSet.getString("useraddress"));
                u.setUserEmail(resultSet.getString("useremail"));
                u.setUserId(Integer.parseInt(resultSet.getString("userid")));
                u.setUserName(resultSet.getString("username"));
                u.setUserPassword(resultSet.getString("userpassword"));
                u.setUserPhone(resultSet.getString("userphone"));
                u.setUserPic(resultSet.getString("userpic"));
                u.setUserType(resultSet.getString("type"));
                u1.add(u);
            }
            connection.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return u1;
    }

    public int CountUser() {
        int x = 0;
        try {

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
            String query = "SELECT * FROM `user`;";
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                x++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x;
    }

}
