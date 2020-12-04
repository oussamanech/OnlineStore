//alert("testing");
// Material Select Initialization
$(document).ready(function() {
$('.mdb-select').materialSelect();
});
/*
function myFunction() {
 var x = document.getElementById("prodid1").value;
   document.getElementById('prodid').value = x; 
document.myform.submit(); 
$('#modalQuickView').modal('show');
}
js 
  <!-- <a href="index.jsp?idproduct=<%=product.getId()%>" class="list-group-item-action">Add to Cart </a>    
onclick="add_to_cart('<%=product.getId()%>', '<%=product.getpName()%>',<%=product.getPriceAfterDiscount()%>)" -->
*/
        function add_to_cart(pid, pname, price){

        let cart = localStorage.getItem("cart1");
                if (cart1 == null){
        let products1 = [];
                let product1 = { productId: pid }
        products1.push(product1);
                localStorage.setItem("cart1", JSON.stringify(products1));
                console.log("Product is added for the first time1 ... ")
        } else{
        //cart alredy to present*************************************************** ...
        let pcart1 = JSON.parse(cart1);
                let oldProduct1 = pcart1.find((item) = > item.productId == pid)

                // we have to add the product 
                let product1 = { productId:pid}
        pcar1t.push(product1);
                localStorage.setItem("cart1", JSON.stringify(pcart1));
                console.log("Product is added1 ")



        }
        updateCart();
        }

// update cart :

        function updateCart(){

        let cartString = localStorage.getItem("cart");
                let cart = JSON.parse(cartString);
                if (cart == null || cart.length == 0){
        console.log("Cart is empty !! ")
                $(".cart-items").html("( 0 )");
                $(".cart-body").html("<h3>Cart does not have any items </h3>");
                $(".checkout-btn").attr('disabled', true);
        } else{
        // there is some is cart to show 
        console.log(cart)
                let x = cart.length;
                let c = 2;
                $(".cart-items").html('( ' + x + ' )');
                let table = '<table class="table">\n\
                    <thead class="thead-light">\n\
                        <tr>\n\
                        <th> Item Name </th>\n\
                        <th> Price </th>\n\
                        <th> Quantity </th>\n\
                        <th> Total Price </th>\n\
                        <th> Action </th>\n\
                    </thead>';
                let totlaPrice = 0;
                cart.map((item) = > {
                table += '<tr><td>' + item.productName + '   </td>\n\
                    <td>' + item.productPrice + '   </td>\n\
                    <td>' + item.productQuantity + '   </td>\n\
                    <td>' + item.productQuantity * item.productPrice + '   </td>\n\
                    <td> <button onclick="deleteItemFromCart(' + item.productId + ')" class="btn btn-danger btn-sm">Remove</button> </td>\n\
                    </tr>'
                        totlaPrice += item.productQuantity * item.productPrice;
                })
                table = table + '<tr><td colspan="5" class="text-right m-5 font-weight-bold">Total Price : ' + totlaPrice + '</td></tr>\
</table>'
                $(".cart-body").html(table);
                $(".checkout-btn").attr('disabled', false);
        }
        //${cart.length} `
        }
// delete item
        function deleteItemFromCart(pid){
        let cart = JSON.parse(localStorage.getItem('cart'));
                let newcart = cart.filter((item) = > item.productId != pid)

                localStorage.setItem('cart', JSON.stringify(newcart))

                updateCart();
        }

        function goToCheckout(){
        window.location = "checkout.jsp"
        }

        $(document).ready(function (){
        updateCart();
        })
       