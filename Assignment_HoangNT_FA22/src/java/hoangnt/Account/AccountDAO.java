/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.Account;

import hoangnt.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.locks.StampedLock;
import javax.naming.NamingException;

/**
 *
 * @author nguye
 */
public class AccountDAO implements Serializable{
    public boolean checkLogin (String userName, String password) 
            throws SQLException,NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null)
            {
                String sql = "Select Username "
                    + "From Account "
                    + "Where Username = ? And Password = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, userName);
                stm.setString(2, password);   
                rs = stm.executeQuery();
            
                if (rs.next())
                {
                    return true;
                }
            } 
        }
        finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null)
            {
                con.close();
                
            }
        }
        return false;
    }
    private List<AccountDTO> acc;
    public List<AccountDTO> getAccount() {
        return acc;
    }
    private AccountDTO accDTO;
    public AccountDTO getAccDTO(){
        return accDTO;
    }
    public void Account(String username, String password) throws SQLException, NamingException{
        Connection con =  null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
        con = DBHelper.makeConnection();
        if (con !=null)
        {
            String sql = "Select ID, Username, Password, FullName, Email, Phone, Role  "
                    + "From Account "
                    + "Where Username = ? And Password = ? ";
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while(rs.next()){
                int ID = rs.getInt("ID");
                String User = rs.getString("Username");
                String pass= rs.getString("Password");
                String name = rs.getString("FullName");
                String mail = rs.getString("Email");
                String phone = rs.getString("Phone");
                boolean role = rs.getBoolean("Role");
                if (this.accDTO == null)
                {
                    accDTO = new AccountDTO();
                }
                accDTO.setID(ID);
                accDTO.setUsername(User);
                accDTO.setPassword(pass);
                accDTO.setFullname(name);
                accDTO.setEmail(mail);
                accDTO.setPhone(phone);
                accDTO.setRole(role);
            }
        }
        }
        finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null)
            {
                con.close();
                
            }
        }
}
}
