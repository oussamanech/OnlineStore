package com.servlet;

import com.dao.CartHelp;
import com.dao.CartHelpDao;
import com.dao.ProductDao;
import com.entites.Cart;
import com.entites.Product;
import com.entites.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartServlet extends HttpServlet {

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    private String url = "jdbc:mysql://localhost/store";
    private String user = "root";
    private String password = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                      throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8,ISO-8859-1");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession httpSession = request.getSession();
            CartHelp ch = new CartHelp();
            CartHelpDao cartHelpDao1 = new CartHelpDao();
            ProductDao pd1 = new ProductDao();
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(url, user, password);
                statement = connection.createStatement();

                //Get Parameter operation
                String operation = request.getParameter("operation");

                User userNow = (User) httpSession.getAttribute("currentUser");
                //String userNow1 = (String) httpSession.getAttribute("current-user");
                if (userNow == null) {
                    httpSession.setAttribute("message", "You are not logged in !! Login first");
                    response.sendRedirect("login.jsp");
                    return;
                }

                // addtocart
                if (operation.equalsIgnoreCase("addtocart")) {
                    //get id product :
                    int prodid = Integer.valueOf(request.getParameter("idprod"));

                    int Qntprod = Integer.valueOf(request.getParameter("Qntprod"));

                    if (ch.isProductAddToCart(userNow.getUserId(), prodid)) {
                        String q = "UPDATE `addtocart` SET `qntproduct` = '" + Qntprod + "' WHERE"
                                          + " `addtocart`.`iduser` = " + userNow.getUserId() + " AND `addtocart`.`idproduct` = " + prodid + ";";
                        int n = statement.executeUpdate(q);
                        httpSession.setAttribute("message", "Product Alredy Add to cart ! Update Qauntity");
                        response.sendRedirect("index.jsp");
                        return;
                    } else {
                        String q = "INSERT INTO `addtocart` (`iduser`, `idproduct`, `qntproduct`)"
                                          + " VALUES ('" + userNow.getUserId() + "', '" + prodid + "', '" + Qntprod + "');";
                        int n = statement.executeUpdate(q);
                        httpSession.setAttribute("message", "Product Added To Cart ");
                        response.sendRedirect("index.jsp");
                        return;

                    }
                }

                if (operation.equalsIgnoreCase("removeProdCart")) {
                    int idu = Integer.valueOf(request.getParameter("iduser"));
                    int idp = Integer.valueOf(request.getParameter("idproduct"));
                    String q = "DELETE FROM `addtocart` WHERE `addtocart`.`iduser` = " + idu + " AND `addtocart`.`idproduct` = " + idp + " ;";
                    int n = statement.executeUpdate(q);
                    httpSession.setAttribute("message", "Product romove from your Cart ");
                    response.sendRedirect("checkout.jsp");
                    return;
                }

                if (operation.equalsIgnoreCase("conforder")) {
                    int idu = Integer.valueOf(request.getParameter("iduser"));
                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmm");
                    LocalDateTime now = LocalDateTime.now();
                    String idtime = idu + dtf.format(now);
                    List<Cart> cartList = cartHelpDao1.getAllCart(idu);

                    for (Cart c1 : cartList) {
                        Product prod = pd1.getProductbyId(String.valueOf(c1.getIdproduct()));
                        //delet qnt from stock product
                        if (prod.getpQuantity() >= c1.getQntInCart()) {
                            //delet qnt from cart
                            String deletqnt = "UPDATE `product` SET `prodquantity` = '" + (prod.getpQuantity() - c1.getQntInCart()) + "' "
                                              + "WHERE `product`.`prodid` = " + prod.getId() + ";";
                            int deletqnt1 = statement.executeUpdate(deletqnt);

                            // add to list
                            out.print(idtime);
                            String addlist = "INSERT INTO `listofrequest` (`nbrrequest`, `idrequest`, `iduser`, `idproduct`, `qntproduct`, `date`)"
                                              + " VALUES (NULL, '" + idtime + "', '" + idu + "', '" + prod.getId() + "', '" + c1.getQntInCart() + "', CURRENT_TIME());";
                            int addlist1 = statement.executeUpdate(addlist);

                            // delet From Cart 
                            String deletFromCart = "DELETE FROM `addtocart` WHERE `addtocart`.`iduser` = " + idu + " "
                                              + " AND `addtocart`.`idproduct` = " + prod.getId() + ";";
                            int deletFromCart1 = statement.executeUpdate(deletFromCart);

                        }

                    }

                    httpSession.setAttribute("message", "Your Order Conformer ");
                    response.sendRedirect("checkout.jsp");
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
