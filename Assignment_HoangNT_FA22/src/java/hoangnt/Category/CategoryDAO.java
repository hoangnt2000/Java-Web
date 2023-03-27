/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.Category;

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
public class CategoryDAO {
    private List<CategoryDTO> cateList;
    public List<CategoryDTO> getCateList(){
        return cateList;
    }
    
    public CategoryDTO getCateByID(int id) throws SQLException, NamingException{
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CategoryDTO dto = new CategoryDTO();
        try {
            conn = DBHelper.makeConnection();
            if(conn != null){
                String sql ="Select CategoryID, CategoryName, Description "
                        + "From Categories "
                        + "Where CategoryID = "+id;
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()){
                    int cateID = rs.getInt("CategoryID");
                    String cateName = rs.getString("CategoryName");
                    String Description = rs.getString("Description");
                    dto.setCateID(cateID);
                    dto.setCateName(cateName);
                    dto.setDescription(Description);
                }
            }
        } finally 
        {
            if (conn != null)
            {
                conn.close();
            }
            if (stm != null)
            {
                stm.close();
            }
            if (rs != null)
            {
                rs.close();
            }
        }
        return dto;
    }
    
    public void getAllCate() throws SQLException, NamingException{
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs= null;
        try {
            conn = DBHelper.makeConnection();
            if(conn != null){
                String sql = "Select CategoryID, CategoryName, Description "
                        + "From Categories ";
                stm = conn. prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()){
                    int CateID = rs.getInt("CategoryID");
                    String cateName = rs.getString("CategoryName");
                    String Description = rs.getString("Description");
                    CategoryDTO dto = new CategoryDTO(CateID, cateName, Description);
                    if(this.cateList == null){
                        this.cateList = new ArrayList<>();
                    }
                    this.cateList.add(dto);
                }
            }
        } finally 
        {
            if (conn != null)
            {
                conn.close();
            }
            if (stm != null)
            {
                stm.close();
            }
            if (rs != null)
            {
                rs.close();
            }
        }
    }
        
    public int getCateID(String cateName) throws SQLException, NamingException{
        int cID = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.makeConnection();
            if(conn != null){
                String sql ="Select CategoryID "
                        + "From Categories "
                        + "Where CategoryName LIKE ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, cateName);
                rs = stm.executeQuery();
                while(rs.next()){
                    cID = rs.getInt("CategoryID");
                }
            }
        } finally 
        {
            if (conn != null)
            {
                conn.close();
            }
            if (stm != null)
            {
                stm.close();
            }
            if (rs != null)
            {
                rs.close();
            }
        }
        return  cID;
    }
}
