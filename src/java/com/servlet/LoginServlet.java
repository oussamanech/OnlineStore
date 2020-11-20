package com.servlet;

import com.dao.UserDao;
import com.entites.User;
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

public class LoginServlet extends HttpServlet {
 
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
           
             try {
                 
                 Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                 connection = DriverManager.getConnection(url, user, password);      
                 statement = connection.createStatement();
                 
                 // coding area
                String e = request.getParameter("email");
                String p = request.getParameter("password");
                
                //validation
                
                //authenticating user
                 UserDao userDao =new UserDao();
                 User u = userDao.getUserPyEmailAndPassword(e, p);
                 HttpSession httpSession = request.getSession();
                 
                 if(u == null){
                      httpSession.setAttribute("message", "Invailed Detail !! try with another one  "); 
                      response.sendRedirect("login.jsp");
                      return;
                 }else{
                     httpSession.setAttribute("current-user", u.getUserType());
                     httpSession.setAttribute("currentUser", u);
                     httpSession.setAttribute("current-username", u.getUserName());
                     
                     if(u.getUserType().equalsIgnoreCase("admin")){
                                  response.sendRedirect("admin.jsp");
                              }else 
                                  if(u.getUserType().equalsIgnoreCase("normal")){
                                  response.sendRedirect("normal.jsp");
                              }else{
                                  httpSession.setAttribute("message", "We have not your identified user type");
                              }
                     
                 }
                 
                 
            } catch (Exception e) {
               out.println( "\n -getLocalizedMessage : "  +e.getLocalizedMessage());
               out.println( "\n -getMessage : "  +e.getMessage());
               out.println( "\n -toString : "  +e.toString());
               e.printStackTrace() ;
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
