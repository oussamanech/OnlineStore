
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
        <%
            HttpSession httpSession = request.getSession();
            //send names navbar
            httpSession.setAttribute("login", "Войти");
            httpSession.setAttribute("creat", "Регистрация");
            httpSession.setAttribute("titre", "онлайн магазин");
            //**************
            httpSession.setAttribute("Home", "главная");
            httpSession.setAttribute("Category", "категория");
            httpSession.setAttribute("Contact", "Контакты");
            httpSession.setAttribute("info", "Информация");
            httpSession.setAttribute("Service", "Услуги");
            httpSession.setAttribute("checkout", "Корзина");
            //*****************
            httpSession.setAttribute("logout", "выйти");

        %> 

        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <%
                    String Home1 = (String) session.getAttribute("Home");

                    String cat = request.getParameter("category");

                    String idproduct1 = request.getParameter("product");
                    if (idproduct1 != null) {
                %>

                <script>


                    $(document).ready(function () {
                        $('#modalQuickView').modal('show');
                    });

                </script>

                <% }

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




                <!-- Show gategory  *******************************************************************************-->
                <div class="col-md-2">

                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">All Category</a>
                        <%                       for (Category c : listcategorys) {
                        %>  
                        <a href="index.jsp?category=<%=c.getCatId()%>" class="list-group-item list-group-item-action "><%=c.getCatTitle()%></a>
                        <%
                            }
                        %>
                    </div>


                </div>

                <!-- Show product ***************************************************************-->
                <div class="col-md-8">
                    <%@include file="components/message.jsp" %>
                    <!-- Row -->
                    <div class="row mt-4">

                        <!-- Col : 12 -->
                        <div class=" ">

                            <div class="card-columns">
                                <!-- traversing product  data-toggle="modal" data-target="#modalQuickView" -->
                                <%                                    for (Product product : listProducts) {%>


                                <!-- Product card-->
                                <div class="card product-card">
                                    <div class="container text-center">
                                        <a href="index.jsp?product=<%=product.getId()%>" class="nav-link">
                                            <img src="img/products/<%=product.getpPic()%>" class="card-img-top" alt="" style="max-height: 200px;max-width: 100% ; width: auto">
                                        </a>
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title"><%=product.getpName()%> </h5> 

                                        <p class="card-text"><%=helper.get10Words(product.getpDesc())%></p>
                                    </div>


                                    <div class="card-footer text-center">
                                        <form action="CartServlet" method="post">

                                            <div class="row">
                                                <input type="hidden" name="idprod" value="<%=product.getId()%>" />
                                                <input type="hidden" name="operation" value="addtocart" />
                                                <div class="col-5">
                                                    <input type="number" class="form-control" name="Qntprod" value="1" max="<%=product.getpQuantity()%>" min="1" required />
                                                </div>
                                                <div class="col-7">
                                                    <button class="btn custom-bg text-white" ><i class="fa fa-cart-plus" style="font-size: 15px;"></i> В корзину </button>
                                                </div>

                                            </div>
                                            <div class="row">

                                                <div class="col-12">
                                                    <button class="btn btn-outline-success"> &#8381; <%=product.getPriceAfterDiscount()%>
                                                        <span class=" discount-label text-secondary">
                                                            /- &#8381; <%=product.getpPrice()%> , <%=product.getpDiscount()%>% Off
                                                        </span>
                                                    </button>
                                                </div>

                                            </div>

                                        </form>

                                    </div>

                                </div>



                                <%
                                    }
                                    if (listProducts.size() == 0) {
                                        out.print("<h3>No item in this category </h3>");
                                    }


                                %>

                            </div>

                        </div>

                    </div>




                </div>

                <!-- Show gategory  *******************************************************************************-->
                <div class="col-md-2">

                    <img src="img/shop1.png" style="height: 450px; width: 250px;" class="img-responsive">


                </div>


            </div>
        </div>
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
