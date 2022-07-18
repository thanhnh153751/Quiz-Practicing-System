/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDAO;
import Model.Account;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author PREDATOR
 */
@MultipartConfig
@WebServlet(name = "ProfileServlet", urlPatterns = {"/common/profile"})
public class ProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet ProfileServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("gmail");
        String phone = request.getParameter("phone");
        String gender_raw = request.getParameter("gender");
        System.out.println(gender_raw);
        if (gender_raw.equalsIgnoreCase("Female")) {
            gender_raw = "false";
        } else {
            gender_raw = "true";
        }
        HttpSession session = request.getSession();
        Account x = (Account) session.getAttribute("acc");
        try {
            int id = x.getId();
            boolean gender = Boolean.parseBoolean(gender_raw);
            AccountDAO DAO = new AccountDAO();
            Account a = new Account(x.getId(), fullname, email, phone, x.getPassword(), gender, x.getStatus(), x.getAvatar());
            Account lg = DAO.login(email, x.getPassword());
            //img
            String img = "../img/";
            Part part = request.getPart("file");
            String fileName = part.getSubmittedFileName();
            String path = getServletContext().getRealPath("/").replace("\\build", "") + "img" + File.separator + fileName;
            InputStream is = part.getInputStream();
            boolean succs = upoloadFile(is, path);

            is.close();
            img += fileName;
            //-------------------------------
            if(fileName.equals("")) img="";
            

            session.setAttribute("acc", lg);
            request.getRequestDispatcher("/common/profile.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    private boolean upoloadFile(InputStream is, String path) {
        boolean test = false;
        try {
            byte[] byt = new byte[1024];
            int read = 0;

            OutputStream fops = new FileOutputStream(path);
            while ((read = is.read(byt)) != -1) {
                fops.write(byt, 0, read);
            }
            fops.flush();

            fops.close();
            is.close();
//            try {
//                  TimeUnit.SECONDS.sleep(2);                
//            } catch (InterruptedException ex) {
//               
//            }
            test = true;
        } catch (Exception e) {
        }
        return test;
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