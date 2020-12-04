<%@page import="com.entites.User"%>

<%
    User userNow1 = (User) session.getAttribute("currentUser");
    if (userNow1 == null) {
        session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    }

    ProductDao pd1 = new ProductDao();
    CartHelpDao cartHelpDao1 = new CartHelpDao();
    // List<Cart> cartList = cartHelpDao.getAllCart();
    List<Cart> cartList1 = null;
    if (userNow1 != null) {
        cartList1 = cartHelpDao1.getAllCart(userNow1.getUserId());
    } else {
        cartList1 = cartHelpDao1.getAllCart();
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
        <div class="container mt-3">
            <%@include file="components/message.jsp" %>
            <div class="row mt-5">

                <div class="col-md-6">
                    <!-- card -->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-3"> Your Selected items</h3>
                            <div class="cart-body">
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
                                            <%int total1 = 0;
                                                for (Cart c1 : cartList1) {
                                                    Product p11 = pd1.getProductbyId(String.valueOf(c1.getIdproduct()));

                                            %>
                                        <form action="CartServlet" method="post">
                                            <tr>

                                            <input type="hidden" value="removeProdCart" name="operation"/>
                                            <input type="hidden" name="idproduct" value="<%=c1.getIdproduct()%>" >
                                            <input type="hidden" name="iduser" value="<%=c1.getIduser()%>" >

                                            <th scope="row"><%=c1.getIduser()%> - <%=c1.getIdproduct()%></th>
                                            <td><%=p11.getpName()%></td>
                                            <td><%=p11.getpPrice()%></td>
                                            <td><%=c1.getQntInCart()%></td>
                                            <td><%=p11.getpPrice() * c1.getQntInCart()%></td>

                                            <td><button class="btn btn-danger" >Remove </button></td>
                                            </tr>
                                        </form>

                                        <%total1 += p11.getpPrice() * c1.getQntInCart();
                                            }
                                        %>
                                        </tbody>
                                        <tr><td colspan="5" class="text-right m-5 font-weight-bold">Total  : <%=total1%> Rub</td></tr>
                                    </table>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- Form details  -->
                    <div class="card">
                        <div class="card-header">
                            <strong>Your details for order</strong>
                            <small>enter your card details</small>
                        </div>

                        <div class="card-body">
                            <h3 class="text-center mb-3"> </h3>

                            <form action="CartServlet" method="post">
                                <input type="hidden" value="conforder" name="operation"/>
                                <input type="hidden" name="iduser" value="<%=userNow1.getUserId()%>" >
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input style="pointer-events: none;" value="<%=userNow1.getUserEmail()%>" type="email" class="form-control" required>
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input style="pointer-events: none;" type="text" value="<%=userNow1.getUserName()%>" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input  type="text" style="pointer-events: none;" value="<%=userNow1.getUserPhone()%>" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="address">Your Shipping address</label>
                                    <textarea style="pointer-events: none;" class="form-control" required><%=userNow1.getUserAddress()%></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn custom-bg">Order Now </button>
                                    <a class="btn btn-danger" href="regestire.jsp" role="button">update</a>
                                    <a class="btn btn-primary" href="index.jsp" role="button">Continue Shopping</a>
                                </div>


                            </form>

                        </div>
                        <!-- Second card payment-->
                        <div class="padding">
                            <div class="row col-sm">
                                <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong>Credit Card</strong>
                                            <small>enter your card details</small>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <label for="name">Name</label>
                                                        <input class="form-control" id="name" type="text" placeholder="Enter your name">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <label for="ccnumber">Credit Card Number</label>
                                                        <div class="input-group">
                                                            <input class="form-control" type="text" placeholder="0000 0000 0000 0000" autocomplete="email">
                                                            <div class="input-group-append">
                                                                <span class="input-group-text">
                                                                    <i class="mdi mdi-credit-card"></i>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-sm-4">
                                                    <label for="ccmonth">Month</label>
                                                    <select class="form-control" id="ccmonth">
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                        <option>6</option>
                                                        <option>7</option>
                                                        <option>8</option>
                                                        <option>9</option>
                                                        <option>10</option>
                                                        <option>11</option>
                                                        <option>12</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-sm-4">
                                                    <label for="ccyear">Year</label>
                                                    <select class="form-control" id="ccyear">
                                                        <option>2014</option>
                                                        <option>2015</option>
                                                        <option>2016</option>
                                                        <option>2017</option>
                                                        <option>2018</option>
                                                        <option>2019</option>
                                                        <option>2020</option>
                                                        <option>2021</option>
                                                        <option>2022</option>
                                                        <option>2023</option>
                                                        <option>2024</option>
                                                        <option>2025</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label for="cvv">CVV/CVC</label>
                                                        <input class="form-control" id="cvv" type="text" placeholder="123">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                            <button class="btn btn-sm btn-success float-right" type="submit">
                                                <i class="mdi mdi-gamepad-circle"></i> Continue</button>
                                            <button class="btn btn-sm btn-danger" type="reset">
                                                <i class="mdi mdi-lock-reset"></i> Reset</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- fin Second card payment-->


                    </div> 




                </div>

            </div> 
        </div>      

        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
