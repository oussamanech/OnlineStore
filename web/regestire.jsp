<%-- 
    Document   : rejester
    Created on : 23-Sep-2020, 5:39:28 PM
    Author     : pc
--%>
<%@page import="com.entites.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>

        <title>новый пользователь</title>
    </head>
    <body>
        <%
            User userNow1 = (User) session.getAttribute("currentUser");

        %>   
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">

            <div class="row mt-3">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <%@include file="components/message.jsp" %>

                        <div class="card-body px-5">

                            <%                                
                                if (userNow1 == null) {
                            %> 
                            <h3 class="text-center my-3"> Регистрация !</h3>
                            <form action="RegesterServlet" method="post">
                                <input type="hidden" value="newuser" name="operation"/>
                                <div class="form-group">
                                    <label for="name">имя и фамилия</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="" aria-describedby="emailHelp" required>
                                </div>

                                <div class="form-group">
                                    <label for="email">Электронный адрес</label>
                                    <input name="user_email" type="email" class="form-control" id="email" placeholder="" aria-describedby="emailHelp" required>
                                </div>

                                <div class="form-group">
                                    <label for="password">пароль</label>
                                    <input name="user_password" type="password" class="form-control" id="email" placeholder="" aria-describedby="emailHelp" required>
                                </div>

                                <div class="form-group">
                                    <label for="phone">Мобильный телефон</label>
                                    <input name="user_phone" type="number" class="form-control" id="email" placeholder="" aria-describedby="emailHelp" required>
                                </div>

                                <div class="form-group">
                                    <label for="address">Адрес</label>
                                    <textarea name="user_address" class="form-control" placeholder="" style="height: 150px" required></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Регистрация</button>
                                    <button class="btn btn-outline-warning">Отмена</button>
                                </div>

                            </form>
                            <%
                            } else {
                            %> 
                            <h3 class="text-center my-3"> Обновить пользователя!</h3>
                            <form action="RegesterServlet" method="post">
                                <input type="hidden" value="updatuser" name="operation"/>
                                <div class="form-group">
                                    <label for="name">имя и фамилия</label>
                                    <input value="<%=userNow1.getUserName()%>" name="user_name" type="text" class="form-control" id="name" placeholder="Entre Here" aria-describedby="emailHelp" required>
                                </div>

                                <div class="form-group">
                                    <label for="email">>Электронный адрес</label>
                                    <input value="<%=userNow1.getUserEmail()%>" name="user_email" type="email" class="form-control" id="email" placeholder="Entre Here" aria-describedby="emailHelp" required>
                                </div>

                                <div class="form-group">
                                    <label for="password">пароль</label>
                                    <input value="<%=userNow1.getUserPassword()%>" name="user_password" type="password" class="form-control" id="email" placeholder="Entre Here" aria-describedby="emailHelp" required>
                                </div>

                                <div class="form-group">
                                    <label for="phone">Мобильный телефон</label>
                                    <input value="<%=userNow1.getUserPhone()%>" name="user_phone" type="text" class="form-control" id="email" placeholder="Entre Here" aria-describedby="emailHelp" required>
                                </div>

                                <div class="form-group">
                                    <label for="address">Адрес</label>
                                    <textarea  name="user_address" class="form-control" placeholder="Entre Your Address" style="height: 150px" required><%=userNow1.getUserAddress()%></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn custom-bg">Обновить</button>
                                    <button class="btn btn-danger">Отмена</button>
                                </div>

                            </form>
                            <%
                                }
                            %> 
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="components/common_modals.jsp" %>         
    </body>
</html>
