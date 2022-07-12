/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.LessonDAO;
import Model.Lesson;
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
 * @author PREDATOR
 */
@WebServlet(name = "SubjectLessonController", urlPatterns = {"/courseContent/subjectlesson"})
public class SubjectLessonController extends HttpServlet {

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
        LessonDAO dao = new LessonDAO();
        String service = request.getParameter("do");
        if(service == null){
            service = "list";
        }
        
        if(service.equalsIgnoreCase("list")){
            int sid = Integer.parseInt(request.getParameter("sid"));

            List<Lesson> lesson = dao.ListOfLesson(sid);
            
            int page,numberpage = 5;
        int size = lesson.size();
        int num = (size%5==0?(size/5):((size/5)+1));
        String xpage = request.getParameter("index");
        if(xpage==null){
            page = 1;
        }else{
            page = Integer.parseInt(xpage);
        }
        int start,end;
        start= (page-1)*numberpage;
        end = Math.min(page*numberpage,size );
        
            
        List<Lesson> list1 = dao.getListbyPage(lesson, start, end);
        
        request.setAttribute("listl", list1);
        request.setAttribute("index", page);
        request.setAttribute("num", num);
        request.setAttribute("sid", sid);
        request.getRequestDispatcher("/courseContent/SubjectLessons.jsp").forward(request, response);
        }else if (service.equalsIgnoreCase("changing")){
            String id = request.getParameter("id");
            String status = request.getParameter("status");
            dao.changestatus(Integer.parseInt(id), Integer.parseInt(status));
            response.sendRedirect("subjectlesson");
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
