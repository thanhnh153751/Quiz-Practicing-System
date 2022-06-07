/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DAO;
import Model.Account;
import Model.Mess;
import com.google.common.hash.Hashing;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Viet Dung
 */
@WebServlet(name = "ChangepassController", urlPatterns = {"/common/changepass"})
public class ChangepassController extends HttpServlet {

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
            out.println("<title>Servlet ChangepassController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangepassController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("changepass.jsp").forward(request, response);
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
        String pass = request.getParameter("password");
        String ppass = request.getParameter("newpassword");
        String cpass = request.getParameter("connewpassword");
        String hashpass = Hashing.sha256().hashString(pass, StandardCharsets.UTF_8).toString();
        String hashppass = Hashing.sha256().hashString(ppass, StandardCharsets.UTF_8).toString();
        String hashcpass = Hashing.sha256().hashString(cpass, StandardCharsets.UTF_8).toString();
        Gson gson = new Gson();
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        Account ac = (Account)session.getAttribute("acc");
        
        Account a = dao.login(ac.getEmail(), hashpass);

        if (hashppass.equals(hashcpass) && a != null) {
            Mess mess = new Mess("success", "Change password successful!");
            
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println(gson.toJson(mess));
//            request.setAttribute("mess", "Change password successful!");
            dao.changepass(hashppass, ac.getEmail());
//            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            Mess mess = new Mess("danger", "Wrong password please change password again!");          
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println(gson.toJson(mess));
//            request.setAttribute("mess", "Wrong password please login again!");
//            request.getRequestDispatcher("/common/login.jsp").forward(request, response);
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
