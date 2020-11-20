<%@page import="com.entites.User"%>
<%
     User userNow1 = (User) session.getAttribute("currentUser");
      if(userNow1==null){
          session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
          response.sendRedirect("login.jsp");
          return;
      }
 %>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
         <div class="container">
            <div class="row mt-5">
                
                <div class="col-md-6">
                    <!-- card -->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-3"> Your Selected items</h3>
                            <div class="cart-body">
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- Form details  -->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-3"> Your details for order</h3>
                            
                            <form action="">
                              <div class="form-group">
                                <label for="email">Email address</label>
                                <input value="<%=userNow1.getUserEmail()  %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                              </div>
                              <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" value="<%=userNow1.getUserName()%>" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                              </div>
                              <div class="form-group">
                                <label for="phone">Phone</label>
                                <input type="text" value="<%=userNow1.getUserPhone()%>" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Phone">
                              </div>
                              
                              <div class="form-group">
                                <label for="address">Your Shipping address</label>
                                <textarea value="<%=userNow1.getUserAddress()%>" class="form-control" id="address" rows="3" placeholder="Enter your address"></textarea>
                              </div>
                                
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order Now </button>
                                    <button class="btn btn-primary">Continue Shopping </button>
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
