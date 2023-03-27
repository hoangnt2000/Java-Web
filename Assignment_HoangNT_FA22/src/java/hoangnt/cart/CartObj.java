/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author nguye
 */
public class CartObj implements Serializable{
    
    private Map<Integer, Integer> items;
    
    public Map<Integer,Integer> getItems() {
        return items;
    }
    
     public void updateItem (int proID, int quantity) {
        if (this.items == null) {
            return;
        }
        int quan = quantity;
        if (this.items.containsKey(proID)) {
           this.items.replace(proID, quan);
           if(this.items.get(proID)<= 0){
                this.items.remove(proID);
            }
            if(this.items.isEmpty()){
                this.items = null;
            }
           
        }
    }
    public void addItemToCart(int proID) {
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        int quantity = 1;
        if (this.items.containsKey(proID)) {
            quantity = this.items.get(proID) +1;
        }
        this.items.put(proID, quantity);
    }
    public void addQuantityItemToCart(int proID, int quantity) {
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        if (this.items.containsKey(proID)) {
            int qua = this.items.get(proID);
            quantity = qua + quantity;
        }
        this.items.put(proID, quantity);
    }
    public void removeItemFromCart (int proID) {
        if (this.items == null)
        {
            return;
        }
        if (this.items.containsKey(proID)) {
            this.items.remove(proID);
            if (this.items.isEmpty()){
                this.items = null;
            }
        }
    }
    
}
