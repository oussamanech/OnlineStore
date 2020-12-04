
package com.entites;


public class Cart {
    
    private int iduser;
    private int idproduct;
    private int QntInCart;

    public Cart() {
    }

    public Cart(int iduser, int idproduct, int QntInCart) {
        this.iduser = iduser;
        this.idproduct = idproduct;
        this.QntInCart = QntInCart;
    }

    public int getIduser() {
        return iduser;
    }

    public int getIdproduct() {
        return idproduct;
    }

    public int getQntInCart() {
        return QntInCart;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public void setIdproduct(int idproduct) {
        this.idproduct = idproduct;
    }

    public void setQntInCart(int QntInCart) {
        this.QntInCart = QntInCart;
    }
    
    
    
}
