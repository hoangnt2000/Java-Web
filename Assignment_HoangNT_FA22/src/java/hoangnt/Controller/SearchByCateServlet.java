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
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
@WebServlet(name = "SearchByCateServlet", urlPatterns = {"/SearchByCateServlet"})
public class SearchByCateServlet extends HttpServlet {

    private final String MAIN_PAGE = "CourseShop.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int ID=0;
        if(request.getParameter("cateID") != null)
        {
            ID = Integer.parseInt(request.getParameter("cateID"));
        } 
        String url = MAIN_PAGE;
        int size =0;
        String indexpage = request.getParameter("index");
        int endPage =0;
        if(indexpage == null)
        {
            indexpage = "1";
        }
        int index = Integer.parseInt(indexpage);
        try {
            CategoryDAO cateDAO = new CategoryDAO();
            cateDAO.getAllCate();
            List<CategoryDTO> cateDTO = cateDAO.getCateList();
            request.setAttribute("CATELIST", cateDTO);
            
            ProductDAO proDAO = new ProductDAO();
            proDAO.getProByCate(ID,index);
            List<ProductDTO> proDTO = proDAO.getProList();
            if(proDTO == null)
            {
                String note = "notFound";
                request.setAttribute("NOTE",note);
            }else {
                String note = "Found";
                request.setAttribute("NOTE",note);
            }
            request.setAttribute("PROLIST", proDTO);
            size=proDAO.getCountProByCate(ID);
            endPage = size/6;
            if (size%6 !=0)
            {
                endPage++;
            }

            request.setAttribute("SEARCH", "byCate");
            request.setAttribute("CateID", ID);
            request.setAttribute("ENDPAGE", endPage);
            request.setAttribute("CHECK", true);
            request.setAttribute("INDEX", "1");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
