/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.Controller;

import hoangnt.Category.CategoryDAO;
import hoangnt.Category.CategoryDTO;
import hoangnt.Product.ProductDAO;
import hoangnt.Product.ProductDTO;
import hoangnt.Supplier.SupplierDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nguye
 */
@WebServlet(name = "AddManagerServlet", urlPatterns = {"/AddManagerServlet"})
public class AddManagerServlet extends HttpServlet {

    private final String MANAGE_CONTROLLER ="ManageCourseServlet";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String url = MANAGE_CONTROLLER;
        PrintWriter out = response.getWriter();
        String txtName = request.getParameter("txtName");
        String txtSupName = request.getParameter("txtSupName");
        String txtCateName = request.getParameter("txtCateName");
        String txtQuantity = request.getParameter("txtQuantity");
        String txtPrice = request.getParameter("txtPrice");
        String img = request.getParameter("file");
        String txtStatus = request.getParameter("txtStatus");
        String txtDelete = request.getParameter("txtDelete");
        String txtStart = request.getParameter("txtStart");
        String txtEnd = request.getParameter("txtEnd");
        String txtUserID = request.getParameter("txtUserID");
        try  {
            SupplierDAO supDAO = new SupplierDAO();
            CategoryDAO cateDAO = new CategoryDAO();
            ProductDAO proDAO = new ProductDAO();
            int userID = Integer.parseInt(txtUserID);
            int cateID = cateDAO.getCateID(txtCateName);
            int supID = supDAO.getSupID(txtSupName);
            int quantity = Integer.parseInt(txtQuantity);
            int price = Integer.parseInt(txtPrice);
            CategoryDTO cateDTO = cateDAO.getCateByID(cateID);
            String signal="";
            boolean status = false;
            if (txtStatus.equals("Avaliable"))
            {
                status = true;
            }else {status = false;}
            boolean isDelete = false;
            if (txtDelete.equals("No"))
            {
                isDelete = false;
            }else {isDelete = true;}
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = sdf.parse(txtStart); 
            Date date2 = sdf.parse(txtEnd);
            int check = date1.compareTo(date2);
            if (check <=0)
            {
               ProductDTO proDTO = new ProductDTO(txtName, supID, cateID, quantity, price, img, status, isDelete, txtStart, txtEnd, cateDTO);
                boolean rs = proDAO.createProduct(proDTO,userID);
                
                if (rs)
                {
                    signal="successfull";
                }else{
                    signal="fail";
                } 
            }else {
                signal="failDate";
            }
            
            request.setAttribute("SIGNAL", signal);
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        catch (NamingException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AddManagerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AddManagerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
