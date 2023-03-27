/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.Controller;

import hoangnt.Order.OrderDAO;
import hoangnt.Order.OrderDTO;
import hoangnt.OrderDetail.OrderDetailDAO;
import hoangnt.cart.CartObj;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nguye
 */
@WebServlet(name = "PurchaseManagerServlet", urlPatterns = {"/PurchaseManagerServlet"})
public class PurchaseManagerServlet extends HttpServlet {

    private final String VIEW_CART_PAGE = "viewCart.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String txtUserID = request.getParameter("txtUserID");
        String txtName = request.getParameter("txtName");
        String txtPhone = request.getParameter("txtPhone");
        String txtAdd = request.getParameter("txtAdd");
        String txtPayment = request.getParameter("txtPayment");
        String txtPrice = request.getParameter("txtPrice");
        String type = request.getParameter("txtType");
        String url = VIEW_CART_PAGE;
        try {
            HttpSession session = request.getSession();
            OrderDAO orderDAO = new OrderDAO();
            OrderDTO orderDTO =  new OrderDTO();
            OrderDetailDAO detailDAO = new OrderDetailDAO();
            int userID = Integer.parseInt(txtUserID);
            float total = Float.parseFloat(txtPrice);
            boolean paymentStt = false;
            if (txtPayment.equals("Credit card"))
            {
                paymentStt = true;
            }
            
            if (type.equals("Logined"))
            {
                orderDAO.addOrderUserID(userID, txtName, txtPhone, txtAdd, txtPayment, paymentStt, total);
            }else{
                orderDAO.addOrderGuest(txtName, txtPhone, txtAdd, txtPayment, paymentStt, total);
            }
            int orderID = orderDAO.getLastOrderID();
            CartObj cart = (CartObj) session.getAttribute("CART");
            for(Integer key : cart.getItems().keySet())
            {
                detailDAO.addOrderDetail(orderID, key, cart.getItems().get(key));
            }
            session.removeAttribute("CART");
            request.setAttribute("NOTE", "Success");
        request.setAttribute("ORDERID", orderID);
            
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
