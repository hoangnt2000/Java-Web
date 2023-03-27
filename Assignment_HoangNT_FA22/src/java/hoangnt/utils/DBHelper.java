/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author nguye
 */
public class DBHelper implements Serializable{
        public static Connection makeConnection() throws SQLException, NamingException{
        Context currentContext = new InitialContext(); //get OS Naming and Directory
            Context tomcatContext = (Context) currentContext.lookup("java:comp/env");
            DataSource ds = (DataSource)tomcatContext.lookup("HoangNT_FA22");
            Connection con = ds.getConnection();
            return con;
    }
}
