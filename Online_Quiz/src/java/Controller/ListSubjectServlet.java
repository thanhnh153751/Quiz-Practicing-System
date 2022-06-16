/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.SubjectDAO;
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
@WebServlet(name = "ListSubjectServlet", urlPatterns = {"/public/listsubject"})
public class ListSubjectServlet extends HttpServlet {

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
            out.println("<title>Servlet ListSubjectServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListSubjectServlet at " + request.getContextPath() + "</h1>");
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
        try {
            
            
           SubjectDAO sd = new SubjectDAO();
            List<SubjectCategory> categorySubject=sd.loadAllSubjectCategory();
            request.setAttribute("categorySubject", categorySubject);
            List<SubSubjectCategory> subCategorySubject=sd.loadAllSubSubjectCategory();
            request.setAttribute("subCategorySubject", subCategorySubject);
            
            
            
            //phân trang mới(8 item/page)
            int count = sd.getTotalSubject();
            int endPage = count/8;
            if(count%8 != 0){
                endPage++;
            }
            
            
            
            String indexPage = request.getParameter("index");
            if(indexPage == null){
                indexPage ="1";
            }
            int index = Integer.parseInt(indexPage);
            
            List<Subject> list = sd.pagingSubject(index);
            request.setAttribute("listSubject", list);
            request.setAttribute("page", index);
            request.setAttribute("endPage", endPage);
            
            List<Subject> featuredSubject = sd.loadLastSubject();
            request.setAttribute("featuredSubject", featuredSubject);
            
            //phân trang cũ
//            List<Subject> listSubject = sd.loadAllSubject();
//            int page, numperpage = 2;
//            int size = listSubject.size();
//            int numPage = (size % numperpage == 0 ? (size / numperpage) : (size / numperpage) + 1);
//            String xpage = request.getParameter("page");
//            if (xpage == null) {
//                page = 1;
//            } else {
//                page = Integer.parseInt(xpage);
//            }
//            int start, end;
//            start = (page - 1) * numperpage;
//            end = Math.min(page * numperpage, size);
//            List<Subject> listItemsPage = sd.getListByPage(listSubject, start, end);
//            request.setAttribute("listSubject", listItemsPage);
//            request.setAttribute("page", page);
//            request.setAttribute("numPage", numPage);
            request.getRequestDispatcher("/public/listSubject.jsp").forward(request, response);
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
