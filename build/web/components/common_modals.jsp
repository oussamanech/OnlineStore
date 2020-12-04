<%@page import="com.entites.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entites.Cart"%>
<%@page import="com.entites.Product"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.dao.CartHelpDao"%>
<%
    User u11 = (User) session.getAttribute("currentUser");

    ProductDao pd = new ProductDao();
    CartHelpDao cartHelpDao = new CartHelpDao();
    // List<Cart> cartList = cartHelpDao.getAllCart();
    List<Cart> cartList = null;
    if (u11 != null) {
        cartList = cartHelpDao.getAllCart(u11.getUserId());
    } else {
        cartList = cartHelpDao.getAllCart();
    }
    String userNowName1 = (String) session.getAttribute("current-username");

%>

<div class="modal fade" id="addcart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="add-product-modal">You Cart : <%=userNowName1%></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div class="row mt-3">
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#Id</th>
                                <th scope="col">Name Product</th>
                                <th scope="col">Price</th>
                                <th scope="col">Qnt</th>
                                <th scope="col">Price Total</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%int total = 0;
                                for (Cart c1 : cartList) {
                                    Product p1 = pd.getProductbyId(String.valueOf(c1.getIdproduct()));

                            %>
                        <form action="CartServlet" method="post">
                            <tr>
                       
                            <input type="hidden" value="removeProdCart" name="operation"/>
                            <input type="hidden" name="idproduct" value="<%=c1.getIdproduct()%>" >
                            <input type="hidden" name="iduser" value="<%=c1.getIduser()%>" >

                            <th scope="row"><%=c1.getIduser()%> - <%=c1.getIdproduct()%></th>
                            <td><%=p1.getpName()%></td>
                            <td><%=p1.getpPrice()%></td>
                            <td><%=c1.getQntInCart()%></td>
                            <td><%=p1.getpPrice() * c1.getQntInCart()%></td>

                            <td><button class="btn btn-danger" >Remove </button></td>
                             </tr>
                        </form>
                       
                        <%total += p1.getpPrice() * c1.getQntInCart();
                            }
                        %>
                        </tbody>
                        <tr><td colspan="5" class="text-right m-5 font-weight-bold">Total Price : <%=total%></td></tr>
                    </table>

                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a class="btn btn-primary" href="checkout.jsp" role="button">Checkout</a>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="addcartnull" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="add-product-modal">You Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Your Cart Null - You need To login first
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary checkout-btn" onclick="goToCheckout()" >Checkout</button>
            </div>

        </div>
    </div>
</div>

<!-- Modal: modalQuickView -->
<%
    ProductDao productDaodao1 = new ProductDao();
    String idproduct = request.getParameter("product");
    Product p5 = productDaodao1.getProductbyId(idproduct);

%>
<!-- Modal Show Information Product -->
<div class="modal fade" id="modalQuickView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-5">
                        <!--Carousel Wrapper-->
                        <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails"
                             data-ride="carousel">
                            <!--Slides-->
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active">
                                    <img class="d-block w-100"
                                         src="img/products/<%=p5.getpPic()%>"
                                         alt="First slide" alt="" style="max-height: 200px;max-width: 100% ; width: auto">
                                </div>                
                            </div>
                            <!--/.Slides-->

                            <ol class="carousel-indicators">
                                <li data-target="#carousel-thumb" data-slide-to="0" class="active">
                                    <img src="img/products/<%=p5.getpPic()%>" class="card-img-top" alt="" style="max-height: 200px;max-width: 100% ; width: auto">
                                </li>
                            </ol>
                        </div>
                        <!--/.Carousel Wrapper-->
                    </div>
                    <div class="col-lg-7">
                        <h2 class="h2-responsive product-name">

                            <strong><%=p5.getpName()%>  </strong>
                        </h2>
                        <h4 class="h4-responsive">
                            &#8381; <%=p5.getPriceAfterDiscount()%>
                            <span class=" discount-label text-secondary">
                                /- &#8381; <%=p5.getpPrice()%> , <%=p5.getpDiscount()%>% Off
                            </span>
                        </h4>

                        <!--Accordion wrapper-->
                        <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">
                            <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                 data-parent="#accordionEx">
                                <div class="card-body">
                                    <%=p5.getpDesc()%>
                                </div>
                            </div>
                        </div>
                        <!-- Accordion wrapper -->


                        <!-- Add to Cart -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>Entre product Quantity - Toatal : (<%=p5.getpQuantity()%>)</p> 

                                </div> 

                            </div>
                            <!-- form to add to cart -->
                            <form action="CartServlet" method="post">
                                <div class="row">
                                    <input type="hidden" name="idprod" value="<%=p5.getId()%>" />
                                    <input type="hidden" name="operation" value="addtocart" />

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="Qntprod" value="1" max="<%=p5.getpQuantity()%>" min="1" required />
                                        </div>
                                    </div> 
                                </div>
                                <div class="text-center">

                                    <button class="btn btn-primary">Add to cart
                                        <i class="fas fa-cart-plus ml-2 " aria-hidden="true"></i>
                                    </button>

                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </form> 
                        </div>
                        <!-- /.Add to Cart -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

