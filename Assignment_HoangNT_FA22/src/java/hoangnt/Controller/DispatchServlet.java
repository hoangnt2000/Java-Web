/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangnt.Controller;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DispatchServlet", urlPatterns = {"/DispatchServlet"})
public class DispatchServlet extends HttpServlet {
    
    private final String MAIN_PAGE = "CourseShop.jsp";
    private final String LOGIN_PAGE = "login.html";
    private final String LOGIN_CONTROLLER = "LoginServlet";
    private final String LOGOUT_CONTROLLER = "LogoutServlet";
    private final String VIEW_COURSE_SERVLET = "ViewListCourseServlet";
    private final String VIEW_CART_CONTROLLER = "ViewCartServlet";
    private final String VIEW_DETAIL_COURSE = "ViewDetailCourseServlet";
    private final String MANAE_CONTROLLER = "ManageCourseServlet";
    private final String CHANGE_PAGE_CONTROLLER ="ChangePageServlet";
    private final String CHANGE_PAGE_MANAGE_CONTROLLER = "ChangePageManagerServlet";
    private final String ADD_CONTROLLER = "AddServlet";    
    private final String ADD_COURSE_CONTROLLER = "AddManagerServlet";
    private final String ADD_TO_CART_CONTROLLER = "AddToCartServlet";
    private final String ADD_TO_CART_VIEW_CONTROLLER ="AddToCartViewPageServlet";
    private final String PURCHASE_CONTROLLER ="PurchaseServlet";
    private final String PURCHASE_MANAGE_CONTROLLER = "PurchaseManagerServlet";
    private final String BUY_NOW_CONTROLLER = "BuyNowServlet";
    private final String ORDER_TRACKING_CONTROLLER = "OrderTrackingServlet";
    private final String SEARCH_CONTROLLER = "SearchServlet";
    private final String SEARCH_BY_CATEGORY_CONTROLLER = "SearchByCateServlet";
    private final String UPDATE_CART_CONTROLLER = "UpdateCartServlet";
    private final String DELETE_CART_CONTROLLER = "DeteleCartServlet";      
    private final String DELETE_CONTROLLER = "DeleteServlet";      
    private final String EDIT_CONTROLLER = "EditServlet";      
    private final String EDIT_MANAGER_CONTROLLER = "EditManagerServlet";      
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String button = request.getParameter("btAction");
        String url = MAIN_PAGE;
        try{
            if (button == null)
            {
                url= VIEW_COURSE_SERVLET;
            }
            else if (button.equals("change"))
            {
                url= VIEW_COURSE_SERVLET;
            }
            else if(button.equals("login")){
                url = LOGIN_PAGE;
            }
            else if(button.equals("Login")){
                url = LOGIN_CONTROLLER;
            }
            else if(button.equals("changePage")){
                url = CHANGE_PAGE_CONTROLLER;
            }
            else if(button.equals("show")){
                url = VIEW_CART_CONTROLLER;
            }
            else if(button.equals("managerChange")){
                url = CHANGE_PAGE_MANAGE_CONTROLLER;
            }
            else if(button.equals("detail")){
                url = VIEW_DETAIL_COURSE;
            }
            else if(button.equals("manage")){
                url = MANAE_CONTROLLER;
            }
            else if(button.equals("Create")){
                url = ADD_COURSE_CONTROLLER;
            }
            else if(button.equals("Order")){
                url = ADD_TO_CART_CONTROLLER;
            }
            else if(button.equals("Order2")){
                url =ADD_TO_CART_VIEW_CONTROLLER;
            }
            else if(button.equals("AddCourse")){
                url = ADD_CONTROLLER;
            }
            else if(button.equals("Purchase"))
            {
                url  = PURCHASE_MANAGE_CONTROLLER;
            }
            else if(button.equals("OrderYourCard")){
                url = PURCHASE_CONTROLLER;
            }
            else if(button.equals("BuyNow")){
                url = BUY_NOW_CONTROLLER;
            }
            else if(button.equals("Search")){
                url = SEARCH_CONTROLLER;
            }else if(button.equals("UpdateCart")){
                url = UPDATE_CART_CONTROLLER;
            }
            else if(button.equals("searchByCate")){
                url = SEARCH_BY_CATEGORY_CONTROLLER;
            }

            else if(button.equals("OrderTracking")){
                url = ORDER_TRACKING_CONTROLLER;
            }       
            else if(button.equals("UpdateCart")){
                url = UPDATE_CART_CONTROLLER;
            }
            else if(button.equals("DeleteCart")){
                url = DELETE_CART_CONTROLLER;
            }
            else if(button.equals("Delete"))
            {
                url = DELETE_CONTROLLER;
            }
            else if(button.equals("Edit"))
            {
                url= EDIT_CONTROLLER;
            }
            else if (button.equals("Update"))
            {
                url = EDIT_MANAGER_CONTROLLER;
            }
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
