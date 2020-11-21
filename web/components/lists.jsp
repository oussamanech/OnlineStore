 

<%@page import="com.entites.User"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.entites.Product"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entites.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%
        UserDao userDao =new UserDao();
        List<User> listUsers=userDao.getAllUsers();
        
        CategoryDao categoryDao1=new CategoryDao();
        List<Category> catlist=categoryDao1.getAllCategory();
        
        ProductDao productDao1=new ProductDao();
        List<Product> prodlist = productDao1.getAllProduct();
        

    %>
<div class="container">
    <!-- LIst Users -->
    <div class="text-center mb-3 mt-3">
        <h1>List Users</h1>
    
    <div class="row mt-3">
        <table class="table">
            <thead class="thead-dark">
                <tr>
                  <th scope="col">#Id</th>
                  <th scope="col">Name</th>
                  <th scope="col">Email</th>
                  <th scope="col">Password</th>
                  <th scope="col">Phone</th>
                  <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <% for(User c1 : listUsers){  %>
                <tr>
                    <form action="ListServlet" method="post">
                         <input type="hidden" value="remove_user" name="operation"/>
                         <input type="hidden" name="idus" value="<%=c1.getUserId()%>" >
                         <input type="hidden" name="nameus" value="<%=c1.getUserName()%>" >

                            <th scope="row"><%=c1.getUserId()%></th>
                            <td><%=c1.getUserName()%></td>
                            <td><%=c1.getUserEmail()%></td>
                            <td><%=c1.getUserPassword()%></td>
                            <td><%=c1.getUserPhone()%></td>
                            <td><button class="btn btn-danger" >Remove </button></td>
                     </form>
                </tr>
              <% }%>
            </tbody>
        </table>
            
    </div>
    
 </div>   
    <!-- /LIst Users -->
    
     <!-- LIst Category -->
    <div class="text-center mb-3 mt-3">
        <h1>List Category</h1>
    
    <div class="row mt-3">
        <table class="table">
            <thead class="thead-dark">
                <tr>
                  <th scope="col">#Id</th>
                  <th scope="col">Name</th>
                  <th scope="col">Description</th>
                  <th scope="col">Action</th>
                  <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <% for(Category c1 : catlist){  %>
                <tr>
                    <!-- Update cat -->
                    <form action="ListServlet" method="post">
                        <input type="hidden" value="update_cat" name="operation"/>
                        <input type="hidden" name="idd" value="<%=c1.getCatId()%>" >

                            <th scope="row"><%=c1.getCatId()%></th>
                            
                            <td><div class="form-group">
                                <input name="namee" value="<%=c1.getCatTitle()%>" type="text" required>
                             </div>  </td>
                            
                             <td><div class="form-group">
                                <input name="catdesc" value="<%=c1.getCatDesc()%>" type="text" required>
                             </div> </td>
                            
                            <td><button class="btn btn-primary" >Update </button></td>
                            </form>
                            <!-- Romove cat -->
                             <form action="ListServlet" method="post">
                                <input type="hidden" value="remove_cat" name="operation"/>
                                <input type="hidden" name="idd" value="<%=c1.getCatId()%>" >
                                <input type="hidden" name="namee" value="<%=c1.getCatTitle()%>" >
                                <td><button class="btn btn-danger" >Remove </button></td>
                            </form>
                     
                </tr>
              <% }%>
            </tbody>
        </table>
            
    </div>
    
 </div>   
    <!-- /LIst Category -->
    
    <!-- LIst Product -->
    <div class="text-center mb-3 mt-3">
        <h1>List Product</h1>
    
    <div class="row mt-3">
        <table class="table">
            <thead class="thead-dark">
                <tr>
                  <th scope="col">#Id</th>
                  <th scope="col">Name</th>
                  <th scope="col">Description</th>
                  <th scope="col">Price</th>
                  <th scope="col">Discount</th>
                  <th scope="col">QNT</th>
                  <th scope="col">Action</th>
                  <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <% for(Product c1 : prodlist){  %>
                <tr>
                    <!-- Update product -->
                    <form action="ListServlet" method="post">
                        <input type="hidden" value="update_prod" name="operation"/>
                        <input type="hidden" name="idd" value="<%=c1.getId()%>" >

                            <th scope="row" style="max-width: 20px"><%=c1.getCatId()%></th>
                            <td><div class="form-group">
                                <input name="namee" value="<%=c1.getpName()%>" type="text" required>
                             </div></td>
                             
                            <td><div class="form-group">
                                    <input name="pdesc" value="<%=c1.getpDesc()%>" type="text" required>
                             </div></td>
                             
                            <td><div class="form-group">
                                <input name="pprice" value="<%=c1.getpPrice()%>" type="number" style="max-width: 60px" required>
                             </div></td>
                             
                            <td><div class="form-group">
                                    <input name="pdicount" value="<%=c1.getpDiscount()%>" max="100" type="number" style="max-width: 60px" required>
                             </div></td>
                             
                            <td><div class="form-group">
                                    <input name="pqnt" value="<%=c1.getpQuantity()%>" type="number" style="max-width: 60px" required>
                             </div></td>
                            
                            <td><button class="btn btn-primary" >Update </button></td>
                            </form>
                            <!-- Romove product -->
                             <form action="ListServlet" method="post">
                                <input type="hidden" value="romove_prod" name="operation"/>
                                <input type="hidden" name="idd" value="<%=c1.getId()%>" >
                                <input type="hidden" name="namee" value="<%=c1.getpName()%>" >
                                <td><button class="btn btn-danger" >Remove </button></td>
                            </form>
                     
                </tr>
              <% }%>
            </tbody>
        </table>
            
    </div>
    
 </div>   
    <!-- /LIst Product -->
    
</div>
            