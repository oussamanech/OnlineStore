
<%@page import="com.dao.UserDao"%>
<%@page import="com.entites.Product"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entites.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
      String userNow1 = (String) session.getAttribute("current-user");
      if(userNow1==null){
          session.setAttribute("message", "You are not logged in !! Login first");
          response.sendRedirect("login.jsp");
          return;
      }else{
            if(userNow1.equalsIgnoreCase("normal")){
                 session.setAttribute("message", "You are not Admin !! Do not Acces this page");
                 response.sendRedirect("login.jsp");
                 }
          
      }
    %>
    <%  %>
    
    <%
        CategoryDao categoryDao=new CategoryDao();
        List<Category> listcategorys=categoryDao.getAllCategory();

    %>
    <%
        ProductDao productDao=new ProductDao();
        List<Product> listproducts=productDao.getAllProduct();
      %>
    
    <%   
        UserDao ud1=new UserDao();
     %>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
           <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
        
         <div class="container admin">
             <!-- Top Page -->
             <div class="container-fluid mt-3" >
                <%@include file="components/message.jsp" %>
             </div>
             <!-- -->
             <div class="row mt-3">
                 
                 <!-- first col -->
                 <div class="col-md-4">
                     
                     <div class="card">
                         <div class="card-body text-center">
                             <div class="container">
                                 <img class="img-fluid rounded-circle" src="img/users.png" alt="User Image" style="max-width:50px;">
                             </div>
                             <h3><%=ud1.CountUser()  %></h3>
                             <h3 class="text-uppercase text-muted">Users</h3>
                         </div>
                     </div>
                     
                 </div>
                 
                   <!-- second col -->
                 <div class="col-md-4">
                     
                     <div class="card">
                         <div class="card-body text-center">
                             <div class="container">
                                 <img class="img-fluid rounded-circle" src="img/list.png" alt="Categories Image" style="max-width:50px;">
                             </div>
                              <h3><%=listcategorys.size()  %></h3>
                             <h3 class="text-uppercase text-muted">Categories</h3>
                         </div>
                     </div>
                     
                 </div>
                   
                     <!-- third col -->
                 <div class="col-md-4">
                     
                     <div class="card">
                         <div class="card-body text-center">
                             <div class="container">
                                 <img class="img-fluid rounded-circle" src="img/box.png" alt="Products Image" style="max-width: 50px;">
                             </div>
                              <h3><%=listproducts.size()  %></h3>
                              <h3 class="text-uppercase text-muted">Products</h3>
                         </div>
                     </div>
                     
                 </div>
                 
                 
             </div>
             
             <!-- Second Row -->
             <div class="row mt-3">
                  <!-- Second : Row First cool  -->
                 <div class="col-md-6">
                     
                     <div class="card" data-toggle="modal" data-target="#add-category-modal">
                         <div class="card-body text-center">
                             <div class="container">
                                 <img class="img-fluid rounded-circle" src="img/plus.png" alt="Add Product Image" style="max-width: 60px;">
                             </div>
                             <p class="mt-2">Click here to add new category</p>
                              <h3 class="text-uppercase text-muted">Add Category</h3>
                              
                         </div>
                     </div>
                     
                 </div>
                 
                 <div class="col-md-6" data-toggle="modal" data-target="#add-product-modal">
                     
                     <div class="card">
                         <div class="card-body text-center">
                             <div class="container">
                                 <img class="img-fluid rounded-circle" src="img/add.png" alt="Add Category Image" style="max-width: 60px;">
                             </div>
                             <p class="mt-2">Click here to add new product</p>
                              <h3 class="text-uppercase text-muted">Add Product</h3>
                         </div>
                     </div>
                     
                 </div>
                 
             </div>
             
         </div>
     <%@include file="components/lists.jsp" %>        
         <!-- *************** Add cattegory modal ******************************************-->
         

            <!-- Modal -->
            <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                  <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Fill Caegory details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                   
                    <form action="ProductOperationServlet" method="post">
                        
                        <input type="hidden" value="addcategory" name="operation"/>
                        
                          <div class="form-group">
                              <input type="text" class="form-control" name="catTitel" placeholder="Entre Category Titel" required />
                          </div>
                          
                          <div class="form-group">
                              <textarea placeholder="Entre Category Description" name="catDesc" style="height: 150px;" required class="form-control required"></textarea>
                          </div>
                          
                          <div class="container text-center">
                              <button class="btn btn-outline-success" >
                                  Add Category
                              </button>
                               <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          </div>
                          
                          
                          
                      </form>
                      
                  </div>
                 
                </div>
              </div>
            </div>
         
         <!-- End Add cattegory modal -->

         <!-- *****************Add Product modal  ******************************************* -->
         

               <!-- Modal -->
               <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                 <div class="modal-dialog  modal-lg" role="document">
                   <div class="modal-content">
                     <div class="modal-header custom-bg text-white">
                       <h5 class="modal-title" id="add-product-modal">Product Details</h5>
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                         <span aria-hidden="true">&times;</span>
                       </button>
                     </div>
                     <div class="modal-body">
                         <!--------------Form---------------------------------------------------------------------------->
                         
                         <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                        
                        <input type="hidden" value="addproduct" name="operation"/>
                        
                          <div class="form-group">
                              <input type="text" class="form-control" name="pName" placeholder="Entre titel of product " required />
                          </div>
                          <div class="form-group">
                              <textarea placeholder="Entre Product Description" name="pDesc" style="height: 80px;" required class="form-control required"></textarea>
                          </div>
                        
                          <div class="form-group">
                              <input type="number" class="form-control" name="pPrice" placeholder="Entre price of product " required />
                          </div>
                          <div class="form-group">
                              <input type="number" class="form-control" name="pDiscount" placeholder="Entre product discount" required />
                          </div>
                          <div class="form-group">
                              <input type="number" class="form-control" name="pQuantity" placeholder="Entre product Quantity" required />
                          </div>
                        
                        <!-- Category Product -->
                        
                        
                        <div class="form-group">
                            <select class="form-control" name="catId">
                                <% for(Category c1:listcategorys){  %>
                                <option value="<%=c1.getCatId()%>">
                                    <%=c1.getCatTitle()  %>
                                </option>
                                
                                <% }%>
                            </select>
                          </div>
                         <!-- File Product -->
                          <div class="form-group">
                              <label for="pPhoto">Select Picture of product</label><br/>
                              <input type="file"  id="pPhoto" name="pPhoto" />
                          </div>
                         
                         
                          <div class="container text-center">
                              <button class="btn btn-outline-success" >
                                  Add Product
                              </button>
                               <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          </div>
                          
                          
                          
                      </form>
                         
                         <!--------------EndForm---------------------------------------------------------------------------->
                            
                         
                     </div>
                   </div>
                 </div>
               </div>

         <!-- End Add product  modal -->
         
         
    <%@include file="components/common_modals.jsp" %>      
    </body>
</html>
