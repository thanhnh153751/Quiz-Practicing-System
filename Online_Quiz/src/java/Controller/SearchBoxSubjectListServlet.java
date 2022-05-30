/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.SubjectDAO;
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
@WebServlet(name = "SearchBoxSubjectListServlet", urlPatterns = {"/searchboxsubjectlist"})
public class SearchBoxSubjectListServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchBoxSubjectListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchBoxSubjectListServlet at " + request.getContextPath() + "</h1>");
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
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        SubjectDAO sd = new SubjectDAO();
        List<SubjectCategory> categoryList = sd.loadAllSubjectCategory();

        String[] cid_raw = request.getParameterValues("cid_checkbox");//lấy mảng cid
        int[] cid;
        if (cid_raw != null) {
            cid = new int[cid_raw.length];
            for (int i = 0; i < cid_raw.length; i++) {
                cid[i] = Integer.parseInt(cid_raw[i]);
            }
        } else {
            cid = new int[0];
        }
        request.setAttribute("cidF", cid);

        String nameSearch = request.getParameter("name");//lấy key search
        request.setAttribute("key", nameSearch);
        if (nameSearch == null) {//nếu không thực hiện seach
            nameSearch = "";
        }
        String[] featured = request.getParameterValues("featured");//lấy featured
        request.setAttribute("featured", featured);
        List<Subject> listSubject = sd.getListSubjectBySearch(nameSearch, cid, featured);
        System.out.println(listSubject.size());
        int page, numperpage = 8;
        int size = listSubject.size();
        int numPage = (size % numperpage == 0 ? (size / numperpage) : (size / numperpage) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Subject> listItemsPage = sd.getListByPage(listSubject, start, end);
        request.setAttribute("listSubject", listItemsPage);
        request.setAttribute("page", page);
        request.setAttribute("numPage", numPage);
        request.setAttribute("categorySubject", categoryList);
        request.getRequestDispatcher("listSubject.jsp").forward(request, response);

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
