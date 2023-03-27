/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.Controller;

import hoangnt.Order.OrderDAO;
import hoangnt.Order.OrderDTO;
import hoangnt.OrderDetail.OrderDetailDAO;
import hoangnt.OrderDetail.OrderDetailDTO;
import hoangnt.Product.ProductDAO;
import hoangnt.Product.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "OrderTrackingServlet", urlPatterns = {"/OrderTrackingServlet"})
public class OrderTrackingServlet extends HttpServlet {

    private final String ORDER_TRACKING_PAGE = "orderTracking.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = ORDER_TRACKING_PAGE;
        String txtOrderID = request.getParameter("txtSearch");
        try {
            int orderID = Integer.parseInt(txtOrderID);
            List<ProductDTO> listProDTO = new ArrayList<>();
            Map<Integer,Integer> listPro = new HashMap<>();
            OrderDAO orderDAO = new OrderDAO();
            orderDAO.getOrderByID(orderID);
            OrderDTO orderDTO = orderDAO.getOrder();
            if (orderDTO != null)
            {
            ProductDAO proDAO = new ProductDAO();
            proDAO.getAllProduct();
            List<ProductDTO> proDTO = proDAO.getProList();
            
            OrderDetailDAO detailDAO = new OrderDetailDAO();
            detailDAO.getDetailByOrderID(orderID);
            List<OrderDetailDTO> detailDTO = new ArrayList<>();
                    detailDTO = detailDAO.getDetailList();
            
            for (OrderDetailDTO x : detailDTO)
            {
                listPro.put(x.getProID(), x.getQuantity());
            }
            for (ProductDTO x : proDTO)
            {
              for(Integer key : listPro.keySet())
              {
                  
                  if(x.getProID() == key)
                  {
                      listProDTO.add(x);
                  }
              }
            }
            }
            for (ProductDTO x : listProDTO)
            {
                System.out.println(x.getProName());
            }
            request.setAttribute("LISTPRODTO", listProDTO);
            request.setAttribute("DETAILDTO", listPro);
            request.setAttribute("ORDERDTO", orderDTO);
            
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
