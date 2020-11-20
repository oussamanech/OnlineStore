//alert("testing");

function add_to_cart(pid,pname,price){
    
    let cart= localStorage.getItem("cart");
    if(cart == null){
         // no cart yet **********************************************************...
        let products = [] ;
        let product  = { productId: pid , productName: pname , productQuantity: 1 , productPrice: price}
        products.push(product);
        localStorage.setItem( "cart",JSON.stringify(products) );
        console.log("Product is added for the first time ... ")
    }else{
            //cart alredy to present*************************************************** ...
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find( (item)=> item.productId == pid )
        
        if(oldProduct){
            // we have to increase the quanity 
            oldProduct.productQuantity = oldProduct.productQuantity +1 ;
            pcart.map((item)=>{
                
                        if(item.productId== oldProduct.productId){
                                item.productQuantity = oldProduct.productQuantity ;
                        }
            })
            
             localStorage.setItem( "cart",JSON.stringify(pcart) );
             console.log(" Product Quantity is increassed ")
        }else{
            // we have to add the product 
            let product = { productId:pid , productName:pname , productQuantity:1 , productPrice : price}
            pcart.push(product);
            localStorage.setItem( "cart",JSON.stringify(pcart) );
            console.log("Product is added ")
        } 
        
       
    }
   updateCart();
}

// update cart :

function updateCart(){
    
    let cartString=localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    
    if(cart == null || cart.length == 0 ){
        console.log("Cart is empty !! ")
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Cart does not have any items </h3>");
        $(".checkout-btn").attr('disabled',true);
    }else{
        // there is some is cart to show 
       console.log(cart)
       let x=cart.length;
       let c=2;
       $(".cart-items").html('( '+x+' )');
      
       let table='<table class="table">\n\
                    <thead class="thead-light">\n\
                        <tr>\n\
                        <th> Item Name </th>\n\
                        <th> Price </th>\n\
                        <th> Quantity </th>\n\
                        <th> Total Price </th>\n\
                        <th> Action </th>\n\
                    </thead>';
        
       
       let totlaPrice=0;
       cart.map((item)=>{
           table+='<tr><td>'+ item.productName +'   </td>\n\
                    <td>'+ item.productPrice +'   </td>\n\
                    <td>'+ item.productQuantity +'   </td>\n\
                    <td>'+ item.productQuantity*item.productPrice +'   </td>\n\
                    <td> <button onclick="deleteItemFromCart('+item.productId+')" class="btn btn-danger btn-sm">Remove</button> </td>\n\
                    </tr>'
         totlaPrice+=  item.productQuantity*item.productPrice; 
           
       })
        table=table+ '<tr><td colspan="5" class="text-right m-5 font-weight-bold">Total Price : '+totlaPrice+'</td></tr>\
</table>'
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled',false);
    }
    //${cart.length} `
}
// delete item
function deleteItemFromCart(pid){
    let cart=JSON.parse(localStorage.getItem('cart'));
    
    let newcart = cart.filter((item) => item.productId != pid)

    localStorage.setItem('cart',JSON.stringify(newcart))
    
    updateCart();
}

function goToCheckout(){
    window.location = "checkout.jsp"
}

$(document).ready(function (){
    updateCart(); 
})
       