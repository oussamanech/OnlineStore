
<%@page import="com.help.helper"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entites.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.entites.Product"%>
<%@page import="com.dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@include file="components/common_css_js.jsp" %>
        <title>Store - Home</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <%
                    String cat = request.getParameter("category");
                    //  out.print(cat);
                    ProductDao productDaodao = new ProductDao();
                    List<Product> listProducts = null;

                    if (cat == null || cat.trim().equalsIgnoreCase("all")) {
                        listProducts = productDaodao.getAllProduct();

                    } else {
                        int catId1 = Integer.parseInt(cat);
                        listProducts = productDaodao.getAllProduct(catId1);
                    }

                    CategoryDao categoryDao = new CategoryDao();
                    List<Category> listcategorys = categoryDao.getAllCategory();

                %>


                <%  %>

                <!-- Show gategory  *******************************************************************************-->
                <div class="col-md-2">

                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">All Category</a>
                        <%                       for (Category c : listcategorys) {
                        %>  
                        <a href="index.jsp?category=<%=c.getCatId()%>" class="list-group-item list-group-item-action "><%=c.getCatTitle()%> </a>
                        <%
                            }
                        %>
                    </div>


                </div>

                <!-- Show product ***************************************************************-->
                <div class="col-md-10">

                    <!-- Row -->
                    <div class="row mt-4">

                        <!-- Col : 12 -->
                        <div class="col-md-12 ">

                            <div class="card-columns">
                                <!-- traversing product -->
                                <%
                                    for (Product product : listProducts) {
                                %> 
                                <!-- Product card-->
                                <div class="card product-card">
                                    <div class="container text-center">
                                        <img src="img/products/<%=product.getpPic()%>" class="card-img-top" alt="" style="max-height: 200px;max-width: 100% ; width: auto">
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title"><%=product.getpName()%></h5>
                                        <p class="card-text"><%=helper.get10Words(product.getpDesc())%></p>
                                    </div>

                                    <div class="card-footer ttext-center">
                                        <button class="btn custom-bg text-white" 
                                                onclick="add_to_cart('<%=product.getId()%>', '<%=product.getpName()%>',<%=product.getPriceAfterDiscount()%>)">
                                            Add to Cart
                                        </button>
                                        <button class="btn btn-outline-success"> &#8381; <%=product.getPriceAfterDiscount()%>
                                            <span class=" discount-label text-secondary">
                                                /- &#8381; <%=product.getpPrice()%> , <%=product.getpDiscount()%>% Off</span></button>
                                    </div>

                                </div>


                                <%
                                    }
                                    if (listProducts.size() == 0) {
                                        out.print("<h3>No item in this category : " + cat + "</h3>");
                                    }


                                %>

                            </div>

                        </div>

                    </div>




                </div>



            </div>
        </div>
        <!-- jsssssssssssssssssssssss code 
                <script src="js/jquery-3.4.1.slim.min.js"></script>
                <script src="js/popper.min.js"></script>
                <script src="js/bootstrap.min.js"></script>
        <!-- Slick slider js 
        <script type="text/javascript" src="js/slick.min.js"></script>
        <script type="text/javascript" src="js/main.js"></script>
        <!-- jsssssssssssssssssssssss code -->


        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
