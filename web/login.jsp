<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
          <%@include file="components/navbar.jsp" %>
      <div class="container">
            <div class="row">
              <div class="col-md-6 offset-md-3">
                  
                  <div class="card mt-3">
                      
                      <div class="card-header custom-bg text-white">
                          <h3>Вход в личный кабинет</h3>
                      </div>
                      <div class="card-body">
                          
                              <%@include file="components/message.jsp" %>
                          
                          <form action="LoginServlet" method="post">
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email </label>
                                  <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                                  <small id="emailHelp" class="form-text text-muted">Мы никогда никому не передадим вашу электронную почту.</small>
                                </div>
                              
                                <div class="form-group">
                                  <label for="exampleInputPassword1">пароль</label>
                                  <input name="password" type="password" class="form-control" id="exampleInputPassword1" required>
                                </div>
                              <a href="regestire.jsp" class="text-center d-block mb-3">
                                  Хочу зарегистрироваться
                              </a>
                              
                              <div class="container text-center"> 
                                  <button type="submit" class="btn btn-primary custom-bg border-0">Войти</button>
                                  <button type="reset" class="btn btn-primary custom-bg border-0">Отмена</button>
                              </div>
                          </form>
                      </div>
                      <div class="card-footer text-center">
                          :)
                      </div>
                      
                  </div>
                  

                </div>
            </div>
        </div>
        <%@include file="components/common_modals.jsp" %> 
    </body>
</html>
