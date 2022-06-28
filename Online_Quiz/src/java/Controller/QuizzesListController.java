/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DAO;
import Model.Quiz;
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
@WebServlet(name = "QuizzesListController", urlPatterns = {"/common/quizzeslist"})
public class QuizzesListController extends HttpServlet {

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
            out.println("<title>Servlet QuizzesListController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizzesListController at " + request.getContextPath() + "</h1>");
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
        DAO dao = new DAO();
        
        
        String didStr = request.getParameter("did");
        int did = -1;
        if (didStr != null) {
            did = Integer.parseInt(didStr);
        }
        String lidStr = request.getParameter("tid");
        int tid = -1;
        if (didStr != null) {
            tid = Integer.parseInt(lidStr);
        }
        String search = request.getParameter("search");
        String txt = request.getParameter("index");
        int index = 0;
        if (txt == null) {
            index = 1;
        } else {
            index = Integer.parseInt(txt);
        }
        int numpage = dao.totalPagesimulation(did,tid, search);
        List<Quiz> list = dao.getAllQuizzest(did, tid, search,index);
        List<Subject> list2 = dao.getAllQuizByname();
        List<Quiz> listtype = dao.getAllQuizBytype();
        request.setAttribute("listquizname", list2);
        request.setAttribute("listquiztype", listtype);
        request.setAttribute("listQ", list);
        request.setAttribute("numpage", numpage);
        request.setAttribute("index", index);
        request.setAttribute("did", did);
        request.setAttribute("tid", tid);
        request.setAttribute("ts", search);
        request.getRequestDispatcher("/common/QuizzesList.jsp").forward(request, response);
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
