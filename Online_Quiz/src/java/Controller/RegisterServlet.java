/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDAO;
import Model.Account;
import Model.Mess;
import Util.SendMailUtil;
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

/**
 *
 * @author PREDATOR
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/common/register"})
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("email");
        if (email != null) {
            AccountDAO DAO = new AccountDAO();
            DAO.ChangeStatus(email);
        }

//        Gson gson = new Gson();
//        Mess mess = new Mess("success", "Register successfully!");
//        response.setContentType("application/json;charset=UTF-8");
        response.sendRedirect(request.getContextPath() + "/public/home?status=success&message=Register%20successfully");        
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
        request.setCharacterEncoding("UTF-8");
        String img = "https://www.stregasystem.com/img/users/user.png";

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String gender_raw = request.getParameter("gender");
        String hash = Hashing.sha256().hashString(password, StandardCharsets.UTF_8).toString();
//        System.out.println(fullname + " " + email + " " + phone + " " + password + " " + gender_raw);
        try {
            boolean gender = Boolean.parseBoolean(gender_raw);
            AccountDAO DAO = new AccountDAO();
            Account a = DAO.checkAccountExist(email);
            Gson gson = new Gson();
            if (a == null) {
                DAO.Register(fullname, email, phone, hash, gender, img);
                SendMailUtil sendMailUltil = new SendMailUtil();
                Mess mess = new Mess("success", "Plase check your email!");
                response.setContentType("application/json;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println(gson.toJson(mess));
                out.flush();
                out.close();
                sendMailUltil.sendHTMLEmail(email, "register", "http://localhost:8080/Online_Quiz/common/register?email=" + email);
//                request.setAttribute("mess", "Plase check your email!");
//                request.getRequestDispatcher("/common/login.jsp").forward(request, response);
//                response.sendRedirect(request.getContextPath()+"/common/confirmEmail.jsp");
            } else {
                Mess mess = new Mess("danger", "Email is existed!");

                response.setContentType("application/json;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println(gson.toJson(mess));
                out.flush();
                out.close();
//                request.setAttribute("mess", "Email is existed!");
//                request.getRequestDispatcher("/common/register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            System.out.println(e);
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
