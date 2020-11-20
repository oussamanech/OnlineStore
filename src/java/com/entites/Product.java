
package com.entites;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Product {
   
                            Connection connection = null; 
                            Statement statement = null; 
                            ResultSet resultSet = null; 

                             String url = "jdbc:mysql://localhost/store"; 
                             String user = "root"; 
                             String password = ""; 

                             int id;
                             String pName;
                             String pDesc;
                             String pPic;
                             int pPrice;
                             int pDiscount;
                             int pQuantity;
                             int catId;

    public Product() {
    }

    public Product(int id, String pName, String pDesc, String pPic, int pPrice, int pDiscount, int pQuantity, int catId) {
        this.id = id;
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPic = pPic;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.catId = catId;
    }
    public Product( String pName, String pDesc, String pPic, int pPrice, int pDiscount, int pQuantity, int catId) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPic = pPic;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.catId = catId;
    }

    public int getId() {
        return id;
    }

    public String getpName() {
        return pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public String getpPic() {
        return pPic;
    }

    public int getpPrice() {
        return pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public int getCatId() {
        return catId;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }
      
      
                             
    // calculate price after discount
    public int getPriceAfterDiscount(){
         int d= (int)  ( (this.getpDiscount()/100.0) * this.getpPrice() );
         
         return this.getpPrice() - d;
                      
    }
                             
                             

}
