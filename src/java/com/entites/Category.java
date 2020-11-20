
package com.entites;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;

public class Category {
                             int catId;
                             String catTitle;
                             String catDesc;

    public Category(int catId, String catTitle, String catDesc) {
        this.catId = catId;
        this.catTitle = catTitle;
        this.catDesc = catDesc;
    }

    public int getCatId() {
        return catId;
    }

    public String getCatTitle() {
        return catTitle;
    }

    public String getCatDesc() {
        return catDesc;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public void setCatTitle(String catTitle) {
        this.catTitle = catTitle;
    }

    public void setCatDesc(String catDesc) {
        this.catDesc = catDesc;
    }
  public Category(){                   
  }
                              
                              
                              
                              
}
