/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.Product;

import hoangnt.Category.CategoryDTO;
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
public class ProductDAO implements Serializable{
    private List<ProductDTO> proList;
    private ProductDTO proDTO =  new ProductDTO();
    public ProductDTO getProDTO() {
        return proDTO;
    }

    public List<ProductDTO> getProList() {
        return proList;
    }
    
    public void getAllProduct() throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBHelper.makeConnection();
            if (con != null)
            {
                String sql = "Select p.CourseID, p.CourseName, p.SupplierID, p.CategoryID, p.QuantityPerUnit, p.UnitPrice, p.CourseImage, p.StartDate, p.EndDate,p.Status,p.isDelete, c.CategoryID, c.CategoryName, c.Description "
                        + "FROM Course p INNER JOIN Categories c ON p.CategoryID = c.CategoryID ";              
                stm=con.prepareStatement(sql);
                rs = stm.executeQuery();
                
                while (rs.next())
                {
                    ProductDTO dto = new ProductDTO();
                    dto.setProID(rs.getInt("CourseID"));
                    dto.setProName(rs.getString("CourseName"));
                    dto.setSupID(rs.getInt("SupplierID"));
                    dto.setCateID(rs.getInt("CategoryID"));
                    dto.setQuantity(rs.getInt("QuantityPerUnit"));
                    dto.setPrice(rs.getInt("UnitPrice"));
                    dto.setImage(rs.getString("Courseimage"));
                    dto.setStatus(rs.getBoolean("Status"));
                    dto.setIsDelete(rs.getBoolean("isDelete"));
                    dto.setStartDate(rs.getString("StartDate"));
                    dto.setEndDate(rs.getString("EndDate"));
                    
                    CategoryDTO cateDTO = new CategoryDTO();
                    cateDTO.setCateID(rs.getInt("CategoryID"));
                    cateDTO.setCateName(rs.getString("CategoryName"));
                    cateDTO.setDescription(rs.getString("Description"));
                    
                    dto.setCate(cateDTO);

                     if (this.proList == null)
                     {
                         this.proList = new ArrayList<>();
                     }
                     this.proList.add(dto);
                }
            }
        }
        finally {
            if (con != null)
            {
                con.close();
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
    public int getCountSearch(String search) throws SQLException, NamingException{
    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
    ArrayList<ProductDTO> list = new ArrayList();
    
    int count = 0;
    try {
        con = DBHelper.makeConnection();
        String sql = "SELECT count(CourseID) "
                 + "FROM Course p INNER JOIN Categories c ON p.CategoryID = c.CategoryID "
                + "Where p.isDelete = 0 and p.CourseName LIKE '%" + search + "%' ";
        stm = con.prepareStatement(sql);
        rs = stm.executeQuery();
        while (rs.next()) {
            count = rs.getInt(1);
        }
    } finally {
            if (con != null)
            {
                con.close();
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
    
    return count;
} 
    
    public void searchProduct(String search, int index) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null)
            {
                String sql = "Select p.CourseID, p.CourseName, p.SupplierID, p.CategoryID, p.QuantityPerUnit, p.UnitPrice, p.CourseImage, p.StartDate, p.EndDate,p.Status,p.isDelete, c.CategoryID, c.CategoryName, c.Description "
                        + "FROM Course p INNER JOIN Categories c ON p.CategoryID = c.CategoryID where p.isDelete = 0 and p.CourseName LIKE '%"+search+"%' "
                        + "order by CourseID "
                        + " offset "+(index-1)*6+" rows fetch next 6 rows only";
                stm=con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next())
                {
                    ProductDTO dto = new ProductDTO();
                    dto.setProID(rs.getInt("CourseID"));
                    dto.setProName(rs.getString("CourseName"));
                    dto.setSupID(rs.getInt("SupplierID"));
                    dto.setCateID(rs.getInt("CategoryID"));
                    dto.setQuantity(rs.getInt("QuantityPerUnit"));
                    dto.setPrice(rs.getInt("UnitPrice"));
                    dto.setImage(rs.getString("CourseImage"));
                    dto.setStatus(rs.getBoolean("Status"));
                    dto.setIsDelete(rs.getBoolean("isDelete"));
                    dto.setStartDate(rs.getString("StartDate"));
                    dto.setEndDate(rs.getString("EndDate"));
                    
                    CategoryDTO cateDTO = new CategoryDTO();
                    cateDTO.setCateID(rs.getInt("CategoryID"));
                    cateDTO.setCateName(rs.getString("CategoryName"));
                    cateDTO.setDescription(rs.getString("Description"));
                    
                    dto.setCate(cateDTO);

                     if (this.proList == null)
                     {
                         this.proList = new ArrayList<>();
                     }
                     this.proList.add(dto);
                }
            }
        }
        finally {
            if (con != null)
            {
                con.close();
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
    
    public int getCountProByCate(int id) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int size =0;
        try {
            con = DBHelper.makeConnection();
            if (con != null)
            {
                String sql = "Select count(CourseID) "
                + "FROM Course p INNER JOIN Categories c ON p.CategoryID = c.CategoryID "
                        + "Where p.isDelete = 0 and c.CategoryID = ? ";
                stm=con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                
                while (rs.next())
                {
                   size = rs.getInt(1);
                }
            }
        }
        finally {
            if (con != null)
            {
                con.close();
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
        return size;
    }
    public void getProByCate(int id, int index) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null)
            {
                String sql ="Select p.CourseID, p.CourseName, p.SupplierID, p.CategoryID, p.QuantityPerUnit, p.UnitPrice, p.CourseImage, "
                        + "p.StartDate, p.EndDate,p.Status,p.isDelete, c.CategoryID, c.CategoryName, c.Description "
                        + "FROM Course p INNER JOIN Categories c ON p.CategoryID = c.CategoryID "
                        + "where p.isDelete = 0 and c.CategoryID = ? order by CourseID "
                        + "offset ? rows fetch next 6 rows only"   ;     
                stm=con.prepareStatement(sql);
                stm.setInt(1, id);
                stm.setInt(2, (index-1)*6);
                rs = stm.executeQuery();
                
                while (rs.next())
                {
                    ProductDTO dto = new ProductDTO();
                    dto.setProID(rs.getInt("CourseID"));
                    dto.setProName(rs.getString("CourseName"));
                    dto.setSupID(rs.getInt("SupplierID"));
                    dto.setCateID(rs.getInt("CategoryID"));
                    dto.setQuantity(rs.getInt("QuantityPerUnit"));
                    dto.setPrice(rs.getInt("UnitPrice"));
                    dto.setImage(rs.getString("CourseImage"));
                    dto.setStatus(rs.getBoolean("Status"));
                    dto.setIsDelete(rs.getBoolean("isDelete"));
                    dto.setStartDate(rs.getString("StartDate"));
                    dto.setEndDate(rs.getString("EndDate"));
                    
                    CategoryDTO cateDTO = new CategoryDTO();
                    cateDTO.setCateID(rs.getInt("CategoryID"));
                    cateDTO.setCateName(rs.getString("CategoryName"));
                    cateDTO.setDescription(rs.getString("Description"));
                    
                    dto.setCate(cateDTO);

                     if (this.proList == null)
                     {
                         this.proList = new ArrayList<>();
                     }
                     this.proList.add(dto);
                }
            }
        }
        finally {
            if (con != null)
            {
                con.close();
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
    
   public void getProByID(int id) throws SQLException, NamingException
    {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null)
            {
                String sql = "Select p.CourseID, p.CourseName, p.SupplierID, p.CategoryID, p.QuantityPerUnit, p.UnitPrice, p.CourseImage, "
                        + "p.StartDate, p.EndDate,p.Status,p.isDelete, p.lastUpdateDate , p.userIDUpdate , "
                        + "c.CategoryID, c.CategoryName, c.Description "
                        + "FROM Course p INNER JOIN Categories c ON p.CategoryID = c.CategoryID "
                        + "Where p.CourseID = ? ";
                stm=con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                
                while (rs.next())
                {
                    proDTO.setProID(rs.getInt("CourseID"));
                    proDTO.setProName(rs.getString("CourseName"));
                    proDTO.setSupID(rs.getInt("SupplierID"));
                    proDTO.setCateID(rs.getInt("CategoryID"));
                    proDTO.setQuantity(rs.getInt("QuantityPerUnit"));
                    proDTO.setPrice(rs.getInt("UnitPrice"));
                    proDTO.setImage(rs.getString("CourseImage"));
                    proDTO.setStatus(rs.getBoolean("Status"));
                    proDTO.setIsDelete(rs.getBoolean("isDelete"));
                    proDTO.setStartDate(rs.getString("StartDate"));
                    proDTO.setEndDate(rs.getString("EndDate"));
                    proDTO.setUpdateDate(rs.getString("lastUpdateDate"));
                    proDTO.setUserID(rs.getInt("userIDUpdate"));
                    
                    CategoryDTO cateDTO = new CategoryDTO();
                    cateDTO.setCateID(rs.getInt("CategoryID"));
                    cateDTO.setCateName(rs.getString("CategoryName"));
                    cateDTO.setDescription(rs.getString("Description"));
                    
                    proDTO.setCate(cateDTO);
                }
            }
        }
        finally {
            if (con != null)
            {
                con.close();
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
    
   public void getAllProductByIndex(int index) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBHelper.makeConnection();
            if (con != null)
            {
                String sql = "Select p.CourseID, p.CourseName, p.SupplierID, p.CategoryID, p.QuantityPerUnit, p.UnitPrice, p.CourseImage, p.StartDate, p.EndDate,p.Status,p.isDelete, c.CategoryID, c.CategoryName, c.Description "
                        + "FROM Course p INNER JOIN Categories c ON p.CategoryID = c.CategoryID "
                        + "order by CourseID "
                        + "offset ? rows fetch next 6 rows only";
                stm=con.prepareStatement(sql);
                stm.setInt(1, (index-1)*6);
                rs = stm.executeQuery();
                
                while (rs.next())
                {
                    ProductDTO dto = new ProductDTO();
                    dto.setProID(rs.getInt("CourseID"));
                    dto.setProName(rs.getString("CourseName"));
                    dto.setSupID(rs.getInt("SupplierID"));
                    dto.setCateID(rs.getInt("CategoryID"));
                    dto.setQuantity(rs.getInt("QuantityPerUnit"));
                    dto.setPrice(rs.getInt("UnitPrice"));
                    dto.setImage(rs.getString("CourseImage"));
                    dto.setStatus(rs.getBoolean("Status"));
                    dto.setIsDelete(rs.getBoolean("isDelete"));
                    dto.setStartDate(rs.getString("StartDate"));
                    dto.setEndDate(rs.getString("EndDate"));
                    
                    CategoryDTO cateDTO = new CategoryDTO();
                    cateDTO.setCateID(rs.getInt("CategoryID"));
                    cateDTO.setCateName(rs.getString("CategoryName"));
                    cateDTO.setDescription(rs.getString("Description"));
                    
                    dto.setCate(cateDTO);

                     if (this.proList == null)
                     {
                         this.proList = new ArrayList<>();
                     }
                     this.proList.add(dto);
                }
            }
        }
        finally {
            if (con != null)
            {
                con.close();
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
   
    public int getAllCount() throws SQLException, NamingException{
    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
    ArrayList<ProductDTO> list = new ArrayList();
    
    int count = 0;
    try {
        con = DBHelper.makeConnection();
       String sql = "Select count(CourseID) "
                    + "From Course";
        stm = con.prepareStatement(sql);
        rs = stm.executeQuery();
        while (rs.next()) {
            count = rs.getInt(1);
        }
    } finally {
            if (con != null)
            {
                con.close();
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
    
    return count;
}
    
    public int getCount() throws SQLException, NamingException{
    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
    ArrayList<ProductDTO> list = new ArrayList();
    
    int count = 0;
    try {
        con = DBHelper.makeConnection();
        String sql = "Select count(CourseID) "
                   + "From Course "
                   + "Where isDelete = 0 ";
        stm = con.prepareStatement(sql);
        rs = stm.executeQuery();
        while (rs.next()) {
            count = rs.getInt(1);
        }
    } finally {
            if (con != null)
            {
                con.close();
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
    
    return count;
}
    
  public ArrayList<ProductDTO> getShop(int index) throws SQLException, NamingException{
       Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
    ArrayList<ProductDTO> list = new ArrayList();
    try {
        con = DBHelper.makeConnection();
        String sql = "Select p.CourseID, p.CourseName, p.SupplierID, p.CategoryID, p.QuantityPerUnit, p.UnitPrice, p.CourseImage, p.StartDate, p.EndDate,p.Status,p.isDelete, c.CategoryID, c.CategoryName, c.Description "
                    + "FROM Course p INNER JOIN Categories c ON p.CategoryID = c.CategoryID where p.isDelete = 0 "
                    + "order by CourseID "
                    + "offset ? rows fetch next 6 rows only";
        stm = con.prepareStatement(sql);
        stm.setInt(1, (index-1)*6);
        rs = stm.executeQuery();
        while (rs.next())
                {
                    ProductDTO dto = new ProductDTO();
                    dto.setProID(rs.getInt("CourseID"));
                    dto.setProName(rs.getString("CourseName"));
                    dto.setSupID(rs.getInt("SupplierID"));
                    dto.setCateID(rs.getInt("CategoryID"));
                    dto.setQuantity(rs.getInt("QuantityPerUnit"));
                    dto.setPrice(rs.getInt("UnitPrice"));
                    dto.setImage(rs.getString("CourseImage"));
                    dto.setStatus(rs.getBoolean("Status"));
                    dto.setIsDelete(rs.getBoolean("isDelete"));
                    dto.setStartDate(rs.getString("StartDate"));
                    dto.setEndDate(rs.getString("EndDate"));
                    
                    CategoryDTO cateDTO = new CategoryDTO();
                    cateDTO.setCateID(rs.getInt("CategoryID"));
                    cateDTO.setCateName(rs.getString("CategoryName"));
                    cateDTO.setDescription(rs.getString("Description"));
                    
                    dto.setCate(cateDTO);

                     if (list == null)
                     {
                         list = new ArrayList<>();
                     }
                     list.add(dto);
                }
    } finally {
            if (con != null)
            {
                con.close();
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
    return list;
    }  
   public boolean updateProduct(ProductDTO dto, int ID) throws SQLException, NamingException{
       Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null)
            {
                int stt =0, delete = 0;
                if (dto.isStatus()!= false)
                {
                    stt=1;
                }else {stt=0;}
                if (dto.isIsDelete() != false){
                    delete=1;
                }else {delete=0;}
                
                String sql = "update Course " 
                        + "set [CourseName] = '" + dto.getProName() + "' , [SupplierID] = " + dto.getSupID() + " , [CategoryID] = " + dto.getCateID() + " ,[QuantityPerUnit] = " + dto.getQuantity() + " , "
                        + "[UnitPrice] = " + dto.getPrice() + " , [CourseImage] = '" + dto.getImage() + "' , [Status] = " + stt + " , [isDelete] = " + delete + " , [lastUpdateDate]= GETDATE() , [userIDUpdate] = " + ID
                        + " ,[StartDate] = '" + dto.getStartDate()+ "' , [EndDate] = '" + dto.getEndDate()+ "' "
                        + "Where [CourseID] = " + dto.getProID() + " ";

                stm = con.prepareStatement(sql);
                int effectRow = stm.executeUpdate();
                if (effectRow > 0) {
                return true;
                }
            }
        }
        finally {
            if (con != null)
            {
                con.close();
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
    
   
   public void searchProductByPrice(int min, int max, int index) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null)
            {
                String sql = "Select p.CourseID, p.CourseName, p.SupplierID, p.CategoryID, p.QuantityPerUnit, p.UnitPrice, p.CourseImage, p.StartDate, p.EndDate,p.Status,p.isDelete, c.CategoryID, c.CategoryName, c.Description "
                        + "FROM Course INNER JOIN Categories ON p.CategoryID = c.CategoryID "
                        + "Where p.isDelete = 0 and p.UnitPrice between ? and ? "
                        + "Order by CourseID "
                        + "offset "+(index-1)*6+" rows fetch next 6 rows only";
                stm=con.prepareStatement(sql);
                stm.setInt(1, min);
                stm.setInt(2, max);
                rs = stm.executeQuery();
                while (rs.next())
                {
                    ProductDTO dto = new ProductDTO();
                    dto.setProID(rs.getInt("CourseID"));
                    dto.setProName(rs.getString("CourseName"));
                    dto.setSupID(rs.getInt("SupplierID"));
                    dto.setCateID(rs.getInt("CategoryID"));
                    dto.setQuantity(rs.getInt("QuantityPerUnit"));
                    dto.setPrice(rs.getInt("UnitPrice"));
                    dto.setImage(rs.getString("CourseImage"));
                    dto.setStatus(rs.getBoolean("Status"));
                    dto.setIsDelete(rs.getBoolean("isDelete"));
                    dto.setStartDate(rs.getString("StartDate"));
                    dto.setEndDate(rs.getString("EndDate"));
                    
                    CategoryDTO cateDTO = new CategoryDTO();
                    cateDTO.setCateID(rs.getInt("CategoryID"));
                    cateDTO.setCateName(rs.getString("CategoryName"));
                    cateDTO.setDescription(rs.getString("Description"));
                    
                    dto.setCate(cateDTO);

                     if (this.proList == null)
                     {
                         this.proList = new ArrayList<>();
                     }
                     this.proList.add(dto);
                }
            }
        }
        finally {
            if (con != null)
            {
                con.close();
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
   
 public int getCountSearchByPrice(int min, int max) throws SQLException, NamingException{
    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
    ArrayList<ProductDTO> list = new ArrayList();
    
    int count = 0;
    try {
        con = DBHelper.makeConnection();
        String sql = "Select count(CourseID) "
                    + "From Course p "
                    + "INNER JOIN Categories c ON p.CategoryID = c.CategoryID "
                    + "Where p.isDelete = 0 and p.UnitPrice "
                    + "Between ? and ? ";
        stm = con.prepareStatement(sql);
        stm.setInt(1, min);
        stm.setInt(2, max);
        rs = stm.executeQuery();
        while (rs.next()) {
            count = rs.getInt(1);
        }
    } finally {
            if (con != null)
            {
                con.close();
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
    
    return count;
}  
 
 public boolean createProduct(ProductDTO dto, int ID) throws SQLException, NamingException{
       Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null)
            {
                int stt =0, delete = 0;
                if (dto.isStatus()!= false)
                {
                    stt=1;
                }else {stt=0;}
                if (dto.isIsDelete() != false){
                    delete=1;
                }else {delete=0;}
                String sql = "Insert [dbo].[Course] ([CourseName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], "
                        + "[CourseImage], [Status], [isDelete], [StartDate], [EndDate], [userIDUpdate]) "
                        + "Values(?, ?, ?, ?, ?, ?, "+stt+", "+delete+", '"+dto.getStartDate()+"', '"+dto.getEndDate()+"', ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getProName());
                stm.setInt(2, dto.getSupID());
                stm.setInt(3, dto.getCateID());
                stm.setInt(4, dto.getQuantity());
                stm.setInt(5, dto.getPrice());
                stm.setString(6, dto.getImage());
                stm.setInt(7, ID);
                int effectRow = stm.executeUpdate();
                if (effectRow > 0) {
                return true;
                }
            }
        }
        finally {
            if (con != null)
            {
                con.close();
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

   public boolean deleteProduct(int id) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = DBHelper.makeConnection();
            if (con != null)
            {
                String sql = "Update Course set isDelete = 1 where CourseID = ? ";
                stm=con.prepareStatement(sql);
                stm.setInt(1, id);
                int effectRow = stm.executeUpdate();
                if (effectRow > 0) {
                    return true;
                }
            }
        }
        finally {
            if (con != null)
            {
                con.close();
            }
            if (stm != null)
            {
                stm.close();
            }
        }
        return false;
    }
 
 
 
}
