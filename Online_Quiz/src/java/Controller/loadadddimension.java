/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DAO;
import Model.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Viet Dung
 */
@WebServlet(name = "loadadddimension", urlPatterns = {"/common/loadadddimension"})
public class loadadddimension extends HttpServlet {

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
            out.println("<title>Servlet loadadddimension</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loadadddimension at " + request.getContextPath() + "</h1>");
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
                request.setCharacterEncoding("UTF-8");
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String txt = request.getParameter("index");
        int index = 0;
        if (txt == null) {
            index = 1;
        } else {
            index = Integer.parseInt(txt);
        }
        
        DAO dao = new DAO();
        dao.insertDimension(1, type, name, description);
        List<Subject> list = dao.getAllSubjectDimension(1,index);
//        String Strdid = request.getParameter("did");
//        int did = Integer.parseInt(Strdid);
//        List<Subject> list1 = dao.getAllSubjectDimensionbyid(did);
//        request.setAttribute("list1", list1);
        request.setAttribute("listD", list);
//        request.setAttribute("did", did);
//        request.getRequestDispatcher("/common/SubjectDimension.jsp").forward(request, response);
        response.sendRedirect("/Online_Quiz/common/subdimension");
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
