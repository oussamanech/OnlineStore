
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

public class RegesterServlet extends HttpServlet {

    
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
                String userName = request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");
                String userPhone = request.getParameter("user_phone");
                String userAddress = request.getParameter("user_address"); 
                
                // Validation
                
                if (userName.isEmpty()) {
                    out.print("Name Blank");
                }
                
                // Enregistrer

                        Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                        connection = DriverManager.getConnection(url, user, password);      
                        statement = connection.createStatement(); 
                      /*  
                        String affich_ins = "select * from inscript;" ;
                       resultSet = statement.executeQuery(affich_ins);

           if(userName!=null){
                    String query= "INSERT INTO `--------` "
                            + "(`id_ins`, `nom_ins`) "
                            + " VALUES (NULL, '"+nom_in+"', '"+prenom_in+"', '"+date_in+"', '"+anne_in+"', '"+groupe_in+"', '"+adresse_in+"', '"+username_in+"', '"+motpass_in+"');";
 */
            String query= "INSERT INTO `user` (`userid`, `username`, `useremail`, `userpassword`, `userphone`, `userpic`, `useraddress`, `type`)"
                              + " VALUES"
                              + " (NULL, '"+userName+"', '"+ userEmail+"', '"+userPassword +"', '"+ userPhone+"', 'default.png', '"+ userAddress+"', 'normal' );";
            
                   //statement =  connection.prepareStatement(query);
                 int n = statement.executeUpdate(query);
                 //resultSet = statement.executeQuery(query);
                 //------------------------- search  id -------------------
               String selectid ="SELECT * FROM `user` WHERE `userphone` LIKE "+userPhone+" and `useremail` = '"+userEmail+"';";
               resultSet = statement.executeQuery(selectid);
               String userIdNow="No Id";
                if (resultSet.next()) {
                   userIdNow= resultSet.getString("userid");
                }
              
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Registration Successful !! User Id : " + userIdNow  );
                
                response.sendRedirect("regestire.jsp");
          
                
                connection.close();
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
