/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DAO;
import Model.Account;
import Model.TokenEmail;
import Util.CheckTimeToken;
import Util.ReSendMailUtil;
import Util.TokenUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Viet Dung
 */
@WebServlet(name = "ResetpassController", urlPatterns = {"/common/reset"})
public class ResetpassController extends HttpServlet {

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
            out.println("<title>Servlet ResetpassController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetpassController at " + request.getContextPath() + "</h1>");
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
        String tok = request.getParameter("tok");
        DAO dao = new DAO();
        
        TokenEmail token = dao.getEmailToken(tok);
        
        CheckTimeToken checktimetoken = new CheckTimeToken();
        
        if(checktimetoken.CheckTime(token.getTime())<=10&&token.isStatus()==false){
            request.setAttribute("tok", tok);
            request.setAttribute("email", token.getEmail());
            request.getRequestDispatcher("/common/resetpass.jsp").forward(request, response);
        }else{
            request.setAttribute("mess", "TimeOut and enter email again !!!");
            request.getRequestDispatcher("/common/sendmail.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        DAO dao = new DAO();
        
        Account a = dao.checkAccount(email);
        if (a == null) {
            request.setAttribute("mess", " This email not existed!");
            request.getRequestDispatcher("/router/common/sendmail.jsp").forward(request, response);
        } else {
            
            
                
            try {
                TokenUtil token = new TokenUtil();
                String tok = token.tokenGenerate();
                dao.addTokenEmail(tok, email);
                
                ReSendMailUtil send = new ReSendMailUtil();
                send.sendHTMLEmail(email, "Reset Password", "http://localhost:8080/Online_Quiz/common/reset?tok=" + tok);
                
//            request.getRequestDispatcher("home").forward(request, response);           
//            response.sendRedirect("home.jsp");
            } catch (MessagingException ex) {
                Logger.getLogger(ResetpassController.class.getName()).log(Level.SEVERE, null, ex);
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
