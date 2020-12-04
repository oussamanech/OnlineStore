
<%@page import="com.dao.CartHelp"%>
<%@page import="com.entites.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entites.User"%>
<%
    String usertype = (String) session.getAttribute("current-user");
    String userNowName = (String) session.getAttribute("current-username");

    User u = (User) session.getAttribute("currentUser");

    CategoryDao categoryDao1 = new CategoryDao();
    List<Category> listcategorys1 = categoryDao1.getAllCategory();
    
    //home ruusia
    String login = (String) session.getAttribute("login");
    String creat = (String) session.getAttribute("creat");
    String titre = (String) session.getAttribute("titre");
    //*********
    String Home = (String) session.getAttribute("Home");
    String Category = (String) session.getAttribute("Category");
    String Contact = (String) session.getAttribute("Contact");
    String info = (String) session.getAttribute("info");
    String Service = (String) session.getAttribute("Service");
    String checkout = (String) session.getAttribute("checkout");
    //**********************
    String logout = (String) session.getAttribute("logout");
%>
<header>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-12 col-12 ">
                <div class="btn-group">
                    <button class="btn border dropdown-toggle my-md-4 my2 text-white" data-toggle="dropdown"
                            aria-haspoup="true" aria-expanded="false">RUB
                    </button>
                    <div class="dropdown-menu">
                        <a href="#" class="dropdown-item">EUR - Euro</a>
                    </div>
                </div>
                <div class="btn-group">
                    <button class="btn border dropdown-toggle my-md-4 my2 text-white" data-toggle="dropdown"
                            aria-haspoup="true" aria-expanded="false">Russia
                    </button>
                    <div class="dropdown-menu">
                        <a href="IndexServlet" class="dropdown-item">English</a>
                    </div>
                </div>
            </div> 
            <!-- titre site -->
            <div class="col-md-4 col-12 text-center">
                <h2 class="my-md-3 site-title text-white"><%=titre%></h2>                        
            </div>

            <div class="col-md-4 col-12 text-right">
                <p class="my-md-4 header-links">

                    <% if (usertype == null) {  %> 

                    <a href="login.jsp" class="px-2"><%=login%></a>  
                    <a href="regestire.jsp" class="px-2"><%=creat%></a>

                    <%   } else {%>

                    <a href="<%=u.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>" class="px-2"><%=u.getUserName()%></a>  
                    <a href="logoutServlet" class="px-2"><%=logout%></a>

                    <% } %>


                </p>                        
            </div>

        </div>
    </div>
    <div class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><%=Home%> <span class="sr-only">(current)</span></a>
                    </li>
                    <!-- Category -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%=Category%>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <% for (Category c : listcategorys1) {%>  
                            <a href="index.jsp?category=<%=c.getCatId()%>" class="dropdown-item"><%=c.getCatTitle()%> </a>
                            <%  }  %>

                        </div>
                    </li>
                    <!-- /Category -->

                    <li class="nav-item">
                        <a class="nav-link" href="service.jsp"><%=Service%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp"><%=info%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="contact.jsp" "><%=Contact%></a>
                    </li>

                </ul>
            </div>
            <div class="navbar-nav">

                <% CartHelp cartHelp = new CartHelp();
                    if (!(usertype == null)) {%> 
                <li class="nav-item active">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#addcart">
                        <i class="fa fa-cart-plus" style="font-size: 20px;"></i> <span class="ml-0 cart-items">( <%=cartHelp.nmbrProdinCart(u.getUserId())%> )</span> 
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=u.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>">DASHBORD</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="checkout.jsp"><%=checkout%></a>
                </li>

                <%   } else {       %>
                <li class="nav-item active">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#addcartnull">
                        <i class="fa fa-cart-plus" style="font-size: 20px;"></i> <span class="ml-0 cart-items">( 0 )</span> 
                    </a>
                </li> 
                <li class="nav-item">
                    <a class="nav-link" href="checkout.jsp"><%=checkout%></a>
                </li>
                <% }%>

            </div>
        </nav>
    </div>
</header>
<!--        
<nav class="navbar navbar-expand-lg navbar-dark custom-bg" >

    <nav class="container">
        
          <a class="navbar-brand" href="index.jsp">Store-2020</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                 <ul class="navbar-nav mr-auto">
                   <li class="nav-item active">
                     <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                   </li>

                   <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       Categories
                     </a>
                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                       <a class="dropdown-item" href="#">Action</a>
                       <a class="dropdown-item" href="#">Another action</a>
                       <div class="dropdown-divider"></div>
                       <a class="dropdown-item" href="#">Something else here</a>
                     </div>
                   </li>
                    <li class="nav-item">
                     <a class="nav-link" href="admin.jsp">Admin</a>
                   </li>
                    <li class="nav-item">
                     <a class="nav-link" href="main.jsp">Main</a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Contact</a>
                   </li>
                 </ul>

                <ul class="navbar-nav ml-auto">
                   
                    
                    
                    
                   
                    
                     
                </ul>


               </div>

    </nav>
    
</nav>

-->

