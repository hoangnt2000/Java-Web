/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.Product;

import hoangnt.Category.CategoryDTO;

/**
 *
 * @author nguye
 */
public class ProductDTO {
    private int proID;
    private String proName;
    private int supID;
    private int cateID;
    private int quantity;
    private int price;
    private String image;
    private boolean status;
    private boolean isDelete;
    private String startDate;
    private String endDate;
    private String updateDate;
    private int userID;
    private CategoryDTO cate;

    public ProductDTO() {
    }

    public ProductDTO(int proID, String proName, int supID, int cateID, int quantity, int price, String image, boolean status, boolean isDelete, String startDate, String endDate, CategoryDTO cate) {
        this.proID = proID;
        this.proName = proName;
        this.supID = supID;
        this.cateID = cateID;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.status = status;
        this.isDelete = isDelete;
        this.startDate = startDate;
        this.endDate = endDate;
        this.cate = cate;
    }

    public ProductDTO(String proName, int supID, int cateID, int quantity, int price, String image, boolean status, boolean isDelete, String startDate, String endDate, CategoryDTO cate) {
        this.proName = proName;
        this.supID = supID;
        this.cateID = cateID;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.status = status;
        this.isDelete = isDelete;
        this.startDate = startDate;
        this.endDate = endDate;
        this.cate = cate;
    }

    public int getProID() {
        return proID;
    }

    public void setProID(int proID) {
        this.proID = proID;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public int getSupID() {
        return supID;
    }

    public void setSupID(int supID) {
        this.supID = supID;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public CategoryDTO getCate() {
        return cate;
    }

    public void setCate(CategoryDTO cate) {
        this.cate = cate;
    }
    
    
}
