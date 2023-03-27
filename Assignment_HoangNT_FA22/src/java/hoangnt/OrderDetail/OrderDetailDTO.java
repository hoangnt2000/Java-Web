/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.OrderDetail;

import java.io.Serializable;

/**
 *
 * @author nguye
 */
public class OrderDetailDTO implements Serializable{
    int orderDetailID;
    int orderID;
    int proID;
    int quantity;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(int orderDetailID, int orderID, int proID, int quantity) {
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.proID = proID;
        this.quantity = quantity;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProID() {
        return proID;
    }

    public void setProID(int proID) {
        this.proID = proID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    

       
}
