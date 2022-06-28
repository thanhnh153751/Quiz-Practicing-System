/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DAO;
import Model.Lesson;
import Model.Level;
import Model.Question;
import Model.Subject;
import Model.SubjectDimension;
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
@WebServlet(name = "QuestionListController", urlPatterns = {"/common/questionlist"})
public class QuestionListController extends HttpServlet {

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
            out.println("<title>Servlet QuestionListController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuestionListController at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        DAO dao = new DAO();
        String sidStr = request.getParameter("sid");       
        int sid = -1;
        if (sidStr != null) {
            sid = Integer.parseInt(sidStr);
        }       
        String lidStr = request.getParameter("lid");
        String lid;
        if (lidStr == null) {
            lid = "all";
        }else{
            lid = lidStr;
        }
        
        String sdidStr = request.getParameter("sdid");        
        int sdid = -1;
        if (sdidStr != null) {
            sdid = Integer.parseInt(sdidStr);
        }
        
        String lvidStr = request.getParameter("lvid");
        int lvid = -1;
        if (lvidStr != null) {
            lvid = Integer.parseInt(lvidStr);
        }
        
        String statusStr = request.getParameter("status");
        int status = -1;
        if (statusStr != null) {
            status = Integer.parseInt(statusStr);
        }
        
        String search = request.getParameter("search");
     
        List<Question> list = dao.getAllQuestion(sid, lid, sdid, lvid, status, search);
        
        int page, numperpage = 5;
         int size = list.size();
         int num = (size%5==0?(size/5):((size/5))+1);
         String xpage = request.getParameter("index");
         if(xpage == null){
             page = 1;
         }else{
             page = Integer.parseInt(xpage);
         }
         int start, end;
         start = (page-1)*numperpage;
         end = Math.min(page*numperpage,size );
        
        List<Question> list1 = dao.getListByPage(list, start, end);

       
        List<Subject> list2 = dao.getAllSimulationByname();
        List<Level> listlevel = dao.getAllSimulationBylevel();
        List<Lesson> listLesson = dao.getAllQuestionBylession();
        List<SubjectDimension> listdimension = dao.getAllQuestionByDimension();
        request.setAttribute("listLesson", listLesson);
        request.setAttribute("listdimension", listdimension);
        request.setAttribute("listbylevel", listlevel);
        request.setAttribute("listbysubject", list2);
        request.setAttribute("listQ", list1);
        
          request.setAttribute("index", page);
          request.setAttribute("num", num);
        
        request.setAttribute("sid", sid);
        request.setAttribute("lid", lid);
        request.setAttribute("sdid", sdid);
        request.setAttribute("lvid", lvid);
        request.setAttribute("status", status);
              
        request.setAttribute("ts", search);
        request.getRequestDispatcher("/common/QuestionsList.jsp").forward(request, response);
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
