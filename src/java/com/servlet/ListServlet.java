package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ListServlet extends HttpServlet {

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    private String url = "jdbc:mysql://localhost/store";
    private String user = "root";
    private String password = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                      throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession httpSession = request.getSession();
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(url, user, password);
                statement = connection.createStatement();

                //get id name :
                String idd = request.getParameter("idd");
                String namee = request.getParameter("namee");

                //Get Parameter operation
                String operation = request.getParameter("operation");
                // remove_user
                if (operation.equalsIgnoreCase("remove_user")) {
                    String rmvuser = "DELETE FROM `user` WHERE `user`.`userid` = " + idd + ";";
                    int n = statement.executeUpdate(rmvuser);
                    httpSession.setAttribute("message", "Delete USer : " + namee + " Successfully . ");
                    response.sendRedirect("admin.jsp");
                    return;
                }
                //remove_cat
                if (operation.equalsIgnoreCase("remove_cat")) {
                    String rmvcat = "DELETE FROM `category` WHERE `category`.`Catid` = " + idd + ";";
                    int n = statement.executeUpdate(rmvcat);
                    httpSession.setAttribute("message", "Delete Category : " + namee + " Successfully . ");
                    response.sendRedirect("admin.jsp");
                    return;
                }

                //update category
                if (operation.equalsIgnoreCase("update_cat")) {
                    String catdesc = request.getParameter("catdesc");
                    String updatecat = "UPDATE `category` SET `cattitle` = '" + namee + "'"
                                      + ", `catDes` = '" + catdesc + "' WHERE `category`.`Catid` = " + idd + ";";
                    int n = statement.executeUpdate(updatecat);
                    httpSession.setAttribute("message", "Update Category : " + namee + " Successfully . ");
                    response.sendRedirect("admin.jsp");
                    return;
                }

                //remove_product
                if (operation.equalsIgnoreCase("romove_prod")) {
                    String rmvcat = "DELETE FROM `product` WHERE `product`.`prodid` = " + idd + ";";
                    int n = statement.executeUpdate(rmvcat);
                    httpSession.setAttribute("message", "Delete Category : " + namee + " Successfully . ");
                    response.sendRedirect("admin.jsp");
                    return;
                }
                //update product
                if (operation.equalsIgnoreCase("update_prod")) {
                    String pdesc = request.getParameter("pdesc");
                    String pprice = request.getParameter("pprice");
                    String pdicount = request.getParameter("pdicount");
                    String pqnt = request.getParameter("pqnt");

                    String update = "UPDATE `product` SET `prodname` = '" + namee + "',"
                                      + "`proddesc` = '" + pdesc + "' ,"
                                      + "`prodprice` = '" + pprice + "' ,"
                                      + "`proddiscount` = '" + pdicount + "' ,"
                                      + "`prodquantity` = '" + pqnt + "' "
                                      + " WHERE `product`.`prodid` = " + idd + ";";
                    int n = statement.executeUpdate(update);
                    httpSession.setAttribute("message", "Update Product : " + namee + " Successfully . ");
                    response.sendRedirect("admin.jsp");
                    return;
                }
                // response.sendRedirect("admin.jsp");
                // return;
            } catch (Exception e) {
                out.println("\n -getLocalizedMessage : " + e.getLocalizedMessage());
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
                      throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                      throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
