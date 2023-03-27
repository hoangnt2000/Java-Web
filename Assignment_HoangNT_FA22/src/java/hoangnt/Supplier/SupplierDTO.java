/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.Supplier;

import java.io.Serializable;

/**
 *
 * @author nguye
 */
public class SupplierDTO implements Serializable{
    private  int supID;
    private String companyName;
    private String address;
    private String phone;
    

    public SupplierDTO() {
    }

    public SupplierDTO(int supID, String companyName, String address, String phone) {
        this.supID = supID;
        this.companyName = companyName;
        this.address = address;
        this.phone = phone;
    }

    public int getSupID() {
        return supID;
    }

    public void setSupID(int supID) {
        this.supID = supID;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
