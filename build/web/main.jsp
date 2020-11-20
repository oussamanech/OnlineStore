<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
        
        
        <!-- font awsome -->
        <script src="https://kit.fontawesome.com/6fb17d3059.js" crossorigin="anonymous"></script>
        
        <!-- custom Styleshet -->
        <link rel="stylesheet" href="css/style1.css" >
        
        <!-- Slick Slider -->
        <link rel="stylesheet" type="text/css" href="css/slick.css"/>


        <title>Main Page</title>
    </head>
    <body>
        <!-- Header -->
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
                    </div> 
                    <!-- titre site -->
                    <div class="col-md-4 col-12 text-center">
                        <h2 class="my-md-3 site-title text-white">Online Store</h2>                        
                    </div>
                    <div class="col-md-4 col-12 text-right">
                        <p class="my-md-4 header-links">
                            <a href="#" class="px-2">Sing On</a>  
                            <a href="#" class="px-2">Create An Account</a>  
                        </p>                        
                    </div>
                    
                </div>
            </div>
            <div class="container-fluid p-0">
                <nav class="navbar navbar-expand-lg navbar-light bg-white">
                  
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                      <li class="nav-item active">
                        <a class="nav-link" href="#">HOME <span class="sr-only">(current)</span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">FEATURES</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">COLLECTION</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">SHOP</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">ABOUT US</a>
                      </li>
                    </ul>
                  </div>
                  <div class="navbar-nav">
                    <li class="nav-item border rounded-circle mx-2 search-icon">
                        <i class="fas fa-search p-2"></i>
                    </li>
                    
                    <li class="nav-item border rounded-circle mx-2 basket-icon">
                        <i class="fas fa-shopping-basket p-2"></i>
                    </li>

                      
                  </div>
                </nav>
            </div>
        </header>
        
        <!-- main -->
        <main>
            <!-- First Slider  -->
            <div class="container-fluid p-0">
                <div class="site-slider">
                    <div class="slider-one">
                     <div>
                         <img src="img/c1.jpg" alt="Banner 1" class="img-fluid " style="max-height: 95%;">
                     </div>
                     <div>
                         <img src="img/c2.jpg" alt="Banner 2" class="img-fluid"style="max-height:  95%;">
                     </div>
                     <div>
                         <img src="img/c3.jpg" alt="Banner 3" class="img-fluid"style="max-height: 95%;">
                     </div>   
                    </div>
                    <div class="slider-btn">
                        <span class="prev position-top"> <i class="fas fa-chevron-left"></i> </span>
                        <span class="next position-top right-0"> <i class="fas fa-chevron-right"></i> </span>
                    </div>
                </div>
            </div>
            <!-- -------------------------------------- -->
            <!-- Second Slider  -->
            <div class="container-fluid ">
                <div class="site-slider-two px-md-4">
                    <div class="row slider-two text-center">
                        <div class="col-md-2 product pt-md-5 pt-4">
                            <img src="img/c1.jpg" alt="Product 01">
                            <span class="border site-btn btn-span">dgfcb jghv</span>
                        </div>
                        <div class="col-md-2 product pt-md-5 pt-4">
                            <img src="img/file.png" alt="Product 01">
                            <span class="border site-btn btn-span">dgfcb jghv</span>
                        </div>
                        <div class="col-md-2 product pt-md-5 pt-4">
                            <img src="img/file.png" alt="Product 01">
                            <span class="border site-btn btn-span">dgfcb jghv</span>
                        </div>
                        <div class="col-md-2 product pt-md-5 pt-4">
                            <img src="img/file.png" alt="Product 01">
                            <span class="border site-btn btn-span"> Sofia & dunuc </span>
                        </div>
                        <div class="col-md-2 product pt-md-5 pt-4">
                            <img src="img/file.png" alt="Product 01">
                            <span class="border site-btn btn-span"> Sofia & dunuc </span>
                        </div>
                        <div class="col-md-2 product pt-md-5 pt-4">
                            <img src="img/file.png" alt="Product 01">
                            <span class="border site-btn btn-span"> Sofia & dunuc </span>
                        </div>
                        <div class="col-md-2 product pt-md-5 pt-4">
                            <img src="img/file.png" alt="Product 01">
                            <span class="border site-btn btn-span"> Sofia & dunuc </span>
                        </div>

                    </div>

                    

                    <div class="slider-btn">
                        <span class="prev position-top"> <i class="fas fa-chevron-left fa-2x text-secondary"></i> </span>
                        <span class="next position-top right-0"> <i class="fas fa-chevron-right fa-2x text-secondary"></i> </span>
                    </div>

                </div>
            </div>
            <!-- -------------------------------------- -->

        </main>
        <!-- footer -->
        <footer>
            
        </footer>
        
          <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <!-- Slick slider js -->
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script type="text/javascript" src="js/main.js"></script>

      
  
    </body>
</html>
