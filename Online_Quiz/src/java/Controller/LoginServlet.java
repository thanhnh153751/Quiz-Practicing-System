/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDAO;
import DAO.DAO;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PREDATOR
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        request.getRequestDispatcher("login_1.jsp").forward(request, response);
//        processRequest(request, response);

        request.getRequestDispatcher("login.jsp").forward(request, response);

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
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String r = request.getParameter("rem");
        DAO dao = new DAO();
        Account a = dao.login(email, password);
        if (a == null) {
            request.setAttribute("mess", " USER OR PASSWORD WAS INCORRECT, PLEASE TRY AGAIN");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
//            request.getRequestDispatcher("home").forward(request, response);
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            Cookie cu = new Cookie("email", email);
            Cookie cp = new Cookie("password", password);
            Cookie cr = new Cookie("rem", r);
            if (r != null) {
                cu.setMaxAge(60 * 60 ^ 24);
                cp.setMaxAge(60 * 60 ^ 24);
                cr.setMaxAge(60 * 60 ^ 24);
            } else {
                cu.setMaxAge(0);
                cp.setMaxAge(0);
                cr.setMaxAge(0);
            }
            response.addCookie(cu);
            response.addCookie(cp);
            response.addCookie(cr);
            session.setMaxInactiveInterval(60 * 60 ^ 24);
            response.sendRedirect("home.jsp");

//        AccountDAO dao = new AccountDAO();
//        Account a = dao.login(email, password);
        if (a == null || a.getStatus() == 0) {
            request.setAttribute("mess", "Wrong email or password!!!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession Session = request.getSession();
            Session.setAttribute("acc", a);
            response.sendRedirect("home");

        }
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
