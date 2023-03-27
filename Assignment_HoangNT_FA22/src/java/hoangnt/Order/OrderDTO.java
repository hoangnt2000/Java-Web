/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.Order;

import java.io.Serializable;

/**
 *
 * @author nguye
 */
public class OrderDTO implements Serializable{
    int orderID;
    int userID;
    String contactName;
    String phone;
    String orderDate;
    String addr;
    String payment;
    boolean paymentStatus;
    float totalPrice;

    public OrderDTO() {
    }

    public OrderDTO(int orderID, int userID, String contactName, String phone, String orderDate, String addr, String payment, boolean paymentStatus, float totalPrice) {
        this.orderID = orderID;
        this.userID = userID;
        this.contactName = contactName;
        this.phone = phone;
        this.orderDate = orderDate;
        this.addr = addr;
        this.payment = payment;
        this.paymentStatus = paymentStatus;
        this.totalPrice = totalPrice;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public boolean isPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(boolean paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
    
}
