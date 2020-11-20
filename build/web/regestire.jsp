<%-- 
    Document   : rejester
    Created on : 23-Sep-2020, 5:39:28 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <%@include file="components/common_css_js.jsp" %>
        
        <title>новый пользователь</title>
    </head>
    <body>
        
               <%@include file="components/navbar.jsp" %>
               <div class="container-fluid">
                   
                            <div class="row mt-3">
                   <div class="col-md-6 offset-md-3">
                       
                       <div class="card">
                           <%@include file="components/message.jsp" %>
                           
                           <div class="card-body px-5">
                                <h3 class="text-center my-3"> РЕГИСТРАЦИЯ !</h3>
                       
                                <form action="RegesterServlet" method="post">
                            <div class="form-group">
                                <label for="name">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="name" placeholder="Entre Here" aria-describedby="emailHelp" required>
                           </div>
                           
                           <div class="form-group">
                                <label for="email">User Email</label>
                                <input name="user_email" type="email" class="form-control" id="email" placeholder="Entre Here" aria-describedby="emailHelp" required>
                           </div>
                           
                           <div class="form-group">
                                <label for="password">User Password</label>
                                <input name="user_password" type="password" class="form-control" id="email" placeholder="Entre Here" aria-describedby="emailHelp" required>
                           </div>
                             
                           <div class="form-group">
                                <label for="phone">User Phone</label>
                                <input name="user_phone" type="number" class="form-control" id="email" placeholder="Entre Here" aria-describedby="emailHelp" required>
                           </div>
                           
                           <div class="form-group">
                                <label for="address">User Adress</label>
                                <textarea name="user_address" class="form-control" placeholder="Entre Your Address" style="height: 150px" required></textarea>
                           </div>
                           
                           <div class="container text-center">
                               <button class="btn btn-outline-success">Register</button>
                               <button class="btn btn-outline-warning">Reset</button>
                           </div>
                           
                       </form>
                           </div>
                       </div>
                      
                       
                   </div>
               </div>
                   
               </div>
       <%@include file="components/common_modals.jsp" %>         
    </body>
</html>
