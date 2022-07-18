/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AuthorizationDAO;
import DAO.SubjectDAO;
import DAO.PostDAO;
import Model.Account;
import Model.Post;
import Model.Subject;
import Model.UserPermission;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author THANH
 */
@WebServlet (name="HomeServerlet",urlPatterns={"/public/home"})
public class HomeServerlet extends HttpServlet {

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
            out.println("<title>Servlet Home</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Home at " + request.getContextPath() + "</h1>");
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
//        System.out.println(request.getRequestURI());
        SubjectDAO sjd = new SubjectDAO();
        List<Subject> subjectList = sjd.loadSubjectOnHome();
        request.setAttribute("subjectList", subjectList);
        List<Subject> subjectLast = sjd.loadFeaturedSubject();
        request.setAttribute("subjectLast", subjectLast);
        
        //dành cho blog

        PostDAO pd = new PostDAO();
        List<Post> loadAllPost = pd.loadAllPost();
        List<Post> loadLatestPost = pd.loadLatestPost();
        List<Post> loadHotPost = pd.loadHostPost();
        request.setAttribute("loadAllPost", loadAllPost);
        request.setAttribute("loadLatestPost", loadLatestPost);
        request.setAttribute("loadHotPost", loadHotPost);
        
        //danh cho role
        AuthorizationDAO dao = new AuthorizationDAO();
        HttpSession Session = request.getSession();
        Account a = (Account) Session.getAttribute("acc");
        List<UserPermission> userPermission = dao.getListPermissionByAid(a.getId());
        request.setAttribute("listrole", userPermission);
        
        
        request.getRequestDispatcher("/public/index.jsp").forward(request, response);
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
