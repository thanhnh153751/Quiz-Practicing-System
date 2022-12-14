/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.LessonDAO;
import DAO.SubjectDAO;
import Model.Lesson;
import Model.SubSubjectCategory;
import Model.Subject;
import Model.SubjectCategory;

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
 * @author THANH
 */
@WebServlet(name = "SubjectDetailController", urlPatterns = {"/public/subjectdetail"})
public class SubjectDetailController extends HttpServlet {

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
            out.println("<title>Servlet SubjectDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectDetailController at " + request.getContextPath() + "</h1>");
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
        SubjectDAO sd = new SubjectDAO();
        
        List<SubjectCategory> categorySubject = sd.loadAllSubjectCategory();
        request.setAttribute("categorySubject", categorySubject);
        List<SubSubjectCategory> subCategorySubject=sd.loadAllSubSubjectCategory();
        request.setAttribute("subCategorySubject", subCategorySubject);
        
        LessonDAO ld = new LessonDAO();
        
        
        String id_raw = request.getParameter("ids");
        try {
            int id = Integer.parseInt(id_raw);
            Subject s = sd.loadSubjectDetail(id);
            List<Lesson> lesson = ld.loadLessonBySubject(id);
            request.setAttribute("lesson", lesson);
            List<Subject> featuredSubject = sd.loadLastSubject();
        request.setAttribute("featuredSubject", featuredSubject);
            
            request.setAttribute("subject", s);
            request.getRequestDispatcher("/public/subjectDetail.jsp").forward(request, response);
        } catch (Exception e) {
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
