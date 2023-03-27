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
@WebServlet(name = "ChangePageServlet", urlPatterns = {"/ChangePageServlet"})
public class ChangePageServlet extends HttpServlet {

    private final String INVALID ="invalid.html";
    private final String MAIN_PAGE = "CourseShop.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = INVALID;
        int ID=0;
        if(request.getParameter("cateID") != null)
        {
            ID = Integer.parseInt(request.getParameter("cateID"));
        }
        String page = request.getParameter("index").trim();
        String txtMin = request.getParameter("min").trim();
        String txtMax = request.getParameter("max").trim();
        String searchValue = request.getParameter("txtSearch").trim();
        String searchType = request.getParameter("search");
        int pa =0;
        int endPage =0;
        int size =0;
        try {
             pa = Integer.parseInt(page);
            CategoryDAO cateDAO = new CategoryDAO();
            cateDAO.getAllCate();
            List<CategoryDTO> cateDTO = cateDAO.getCateList();
            request.setAttribute("CATELIST", cateDTO);
            if(searchType.equals("byprice"))
            {
                int max = Integer.parseInt(txtMax);
                int min = Integer.parseInt(txtMin);
                List<ProductDTO> result = null;
                ProductDAO dao = new ProductDAO();
                dao.searchProductByPrice(min, max, pa);
                result = dao.getProList();
                size=dao.getCountSearchByPrice(min, max);
            if(result == null)
            {
                String note = "notFound";
                request.setAttribute("NOTE",note);
            }else {
                String note = "Found";
                request.setAttribute("NOTE",note);
            }
            
            endPage = size/6;
            if (size%6 !=0)
            {
                endPage++;
            }
            request.setAttribute("SEARCH", "byprice");
            request.setAttribute("MAX", max);
            request.setAttribute("MIN", min);
            request.setAttribute("ENDPAGE", endPage);
             request.setAttribute("PROLIST",result);
            }else if (searchType.equals("byname"))
            {
            List<ProductDTO> result = null;
            if (searchValue.trim().length()  > 0) {
                ProductDAO dao = new ProductDAO();
                dao.searchProduct(searchValue,pa);
                result = dao.getProList();
                size=dao.getCountSearch(searchValue);
            }
            if(result == null)
            {
                String note = "notFound";
                request.setAttribute("NOTE",note);
            }else {
                String note = "Found";
                request.setAttribute("NOTE",note);
            }
            
           endPage = size/6;
            if (size%6 !=0)
            {
                endPage++;
            }
            request.setAttribute("SEARCH", "byname");
            request.setAttribute("TXTSEARCH", searchValue);
            request.setAttribute("ENDPAGE", endPage);
             request.setAttribute("PROLIST",result);
            }else if (searchType.equals("byCate"))
            {
            ProductDAO proDAO = new ProductDAO();
            proDAO.getProByCate(ID,pa);
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
            request.setAttribute("ENDPAGE", endPage);
            request.setAttribute("CHECK", true);
            request.setAttribute("CateID", ID);
            }else {
            ProductDAO proDAO = new ProductDAO();
            List<ProductDTO> proDTO = proDAO.getShop(pa);
            request.setAttribute("PROLIST", proDTO);
            size = proDAO.getCount();
            
            endPage = size/6;
            if (size%6 !=0)
            {
                endPage++;
            }
            request.setAttribute("ENDPAGE", endPage);
            }
           
            request.setAttribute("INDEX", page);
            url="CourseShop.jsp?index="+page;
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
