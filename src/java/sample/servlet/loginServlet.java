/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.dao.AccountDAO;
import sample.dao.OrderDAO;
import sample.dto.Account;
import sample.dto.Order;

/**
 *
 * @author Fang Long
 */
public class loginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");
            Account acc = null;
            acc = AccountDAO.getAccount(email, password);
            if (acc != null) {
                if (acc.getRole() == 1) {
                    //chuyen qua admin home page
                } else {
                    //chuyen qqua user
                    HttpSession session = request.getSession();
                    if (session != null) {
                        session.setAttribute("name", acc.getFullname());
                        session.setAttribute("email", email);
//                        session.invalidate();
                        request.setAttribute("IS_LOGIN", "BAN LOGIN DUOC ROI NE");
                        OrderDAO orderDAO = new OrderDAO();
                        ArrayList<Order> orderList = orderDAO.getOrders(email);
                        session.setAttribute("ORDERS_LIST", orderList);
//                        response.sendRedirect("personalPage.jsp");
                        request.getRequestDispatcher("personalPage.jsp").forward(request, response);

                    }
//                    response.sendRedirect("welcome.html");
                }
            } else {
                response.sendRedirect("invalid.html");
            }

        } catch (Exception e) {
            e.printStackTrace();
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
