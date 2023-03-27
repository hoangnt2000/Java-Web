/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.OrderDetail;

import hoangnt.utils.DBHelper;
import java.io.Serializable;
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
public class OrderDetailDAO implements Serializable{
    private List<OrderDetailDTO> detailList;

    public List<OrderDetailDTO> getDetailList() {
        return detailList;
    }
    
    public void getDetailByOrderID (int orderID) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.makeConnection();
            if(conn != null){
                String sql ="Select OrderDetailID, OrderID, CourseID, Quantity "
                        + "From OrderDetails "
                        + "Where OrderID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, orderID);
                rs= stm.executeQuery();
                while (rs.next()){
                    int OrderDetailID = rs.getInt("OrderDetailID");
                    int OrderID = rs.getInt("OrderID");
                    int ProductID = rs.getInt("CourseID");
                    int Quantity = rs.getInt("Quantity");
                    OrderDetailDTO dto = new OrderDetailDTO(OrderDetailID, OrderID, ProductID, Quantity);
                    if(this.detailList == null){
                        this.detailList = new ArrayList<>();
                    }
                    this.detailList.add(dto);
                }
            }
        } finally {
            if (conn != null)
            {
                conn.close();
            }
            if (stm != null)
            {
                stm.close();
            }
            if(rs != null)
            {
                rs.close();
            }
        }
    
    }
    
    public boolean addOrderDetail(int orderID, int proID, int quantity) 
            throws SQLException, NamingException{
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.makeConnection();
            if(conn != null){
                String sql ="INSERT OrderDetails (OrderID, CourseID, Quantity) "
                        + "Values (?, ?, ?)";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, orderID);
                stm.setInt(2, proID);
                stm.setInt(3, quantity);
                int effectRow = stm.executeUpdate();
                if(effectRow > 0){
                    return true;
                }
            }
        } finally {
            if (conn != null)
            {
                conn.close();
            }
            if (stm != null)
            {
                stm.close();
            }
            if(rs != null)
            {
                rs.close();
            }
        }
        return false;
    }
}
