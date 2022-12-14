/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DAO;
import Model.Account;
import com.google.common.hash.Hashing;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Viet Dung
 */
@WebServlet(name = "RechangepassController", urlPatterns = {"/common/rechange"})
public class RechangepassController extends HttpServlet {

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
            out.println("<title>Servlet RechangepassController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RechangepassController at " + request.getContextPath() + "</h1>");
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
        String ppass = request.getParameter("newpassword");
        String cpass = request.getParameter("connewpassword");
        String hashppass = Hashing.sha256().hashString(ppass, StandardCharsets.UTF_8).toString();
        String hashcpass = Hashing.sha256().hashString(cpass, StandardCharsets.UTF_8).toString();
        String email = request.getParameter("email");
        String tok = request.getParameter("tok");
        
        
        DAO dao = new DAO();
//        HttpSession session = request.getSession();
//        String email = (String)session.getAttribute("email");
        
        Account a = dao.checkAccount(email);

        if (hashppass.equals(hashcpass) && a != null) {
            request.setAttribute("mess", "Change password successful please click home and login again!");
            dao.changepass(hashppass, email);
            dao.updateTokenStatus(tok);
            request.getRequestDispatcher("/common/resetpass.jsp").forward(request, response);
        } else {
            request.setAttribute("mess", "Change password unsuccessful!");
            request.getRequestDispatcher("/common/resetpass.jsp").forward(request, response);
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
