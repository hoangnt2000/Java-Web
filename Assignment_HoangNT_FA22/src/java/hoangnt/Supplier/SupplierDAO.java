/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.Supplier;

import hoangnt.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author nguye
 */
public class SupplierDAO {

    private List<SupplierDTO> supList;

    public List<SupplierDTO> getSupList() {
        return supList;
    }

    public void getAllSupplier() throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "Select SupplierID, CompanyName, Address, Phone "
                        + "From Suppliers ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int supID = rs.getInt("SupplierID");
                    String CompanyName = rs.getString("CompanyName");
                    String Address = rs.getString("Address");
                    String Phone = rs.getString("Phone");
                    SupplierDTO dto = new SupplierDTO(supID, CompanyName, Address, Phone);
                    if (this.supList == null) {
                        this.supList = new ArrayList<>();
                    }
                    this.supList.add(dto);
                }
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }

    public int getSupID(String supName) throws SQLException, NamingException {
        int sID = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "Select SupplierID "
                        + "From Suppliers "
                        + "Where CompanyName LIKE ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, supName);
                rs = stm.executeQuery();
                while (rs.next()) {
                    sID = rs.getInt("SupplierID");
                }
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return sID;
    }

}
