
package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

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
                
                String operation = request.getParameter("operation");
                
                //Connect to Add Category or product
                        Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                        connection = DriverManager.getConnection(url, user, password);      
                        statement = connection.createStatement(); 
                //-------------------------------------------------------------------------------------------------------------------------
                if (operation.trim().equals("addcategory")) {
                    // So add category
                    String catTitel = request.getParameter("catTitel");
                    String catDesc = request.getParameter("catDesc");
                    
                    String query= "INSERT INTO `category` (`Catid`, `cattitle`, `catDes`) "
                                      + "VALUES (NULL, '"+catTitel+"', '"+catDesc+"');";
            
                   int n = statement.executeUpdate(query);
                
                   
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category Add Successfully : "  +catTitel );
                response.sendRedirect("admin.jsp");
                return;
                    
                   //------------------------------------------------------------------------------------------------------------------------- 
                }else if (operation.trim().equals("addproduct")) {
                    // So add product
                    String pName = request.getParameter("pName");
                    String pDesc = request.getParameter("pDesc");
                    int pPrice =Integer.parseInt( request.getParameter("pPrice"));
                    int pDiscount = Integer.parseInt(request.getParameter("pDiscount")); 
                    int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                    int catId = Integer.parseInt(request.getParameter("catId"));
                    Part part= request.getPart("pPhoto");
                    out.print(Paths.get(part.getSubmittedFileName()).getFileName().toString()); 
                    // pic upload - find out the path to upload photo
                        String path = "C:/Users/pc/Documents/NetBeansProjects/StoreRussia/web/img"+File.separator+"products"+File.separator+part.getSubmittedFileName(); 
                       // String path = request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName(); 
                         out.print(path);
                     
                    // uploading code ......
                   // InputStream fis = new FileInputStream(path);
                    InputStream fis=part.getInputStream();
                    // reading data
                    byte [] data = new byte[fis.available()];
                    fis.read(data);
                    // writing data
                    FileOutputStream fos=new FileOutputStream(path);
                    fos.write(data);
                    fos.close();
                    
                    String query= "INSERT INTO `product` "
                                      + "(`prodid`, `prodname`, `proddesc`, `prodphoto`, `prodprice`, `proddiscount`, `prodquantity`, `catid`)"
                                      + " VALUES (NULL, '"+pName+"', '"+pDesc+"', '"+part.getSubmittedFileName()+"'  "
                                      + ", '"+pPrice+"', '"+pDiscount+"', '"+pQuantity+"', '"+catId+"');";
            
                   int n = statement.executeUpdate(query);
                
                   
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Product Add Successfully : "  +pName );
                response.sendRedirect("admin.jsp");
                return;
                    
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
