/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DAO;
import Model.Sliders;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Viet Dung
 */
@WebServlet(name = "EditSlidersController", urlPatterns = {"/marketing/editsliders"})
public class EditSlidersController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String submit = request.getParameter("submit");
        DAO dao = new DAO();
        if (submit == null) {
            String did = request.getParameter("id");
//            System.out.println(did);
            int id = Integer.parseInt(did);
            Sliders list = dao.getAllSlidersbyid(id);
//        String Strdid = request.getParameter("did");
//        int did = Integer.parseInt(Strdid);
//        List<Subject> list1 = dao.getAllSubjectDimensionbyid(did);
//        request.setAttribute("list1", list1);
            request.setAttribute("listD", list);
            request.setAttribute("id", id);
            request.getRequestDispatcher("/marketing/Editsliders.jsp").forward(request, response);
        } else {

            String did = request.getParameter("id");
            int id = Integer.parseInt(did);
            String title = request.getParameter("title");
            String image = request.getParameter("image");
            String backlink = request.getParameter("backlink");
            String statuss = request.getParameter("status");
            int status = Integer.parseInt(statuss);
            String note = request.getParameter("note");
            dao.editSliders(id, title, image, backlink, status, note);
            response.sendRedirect("/Online_Quiz/marketing/sliders");
//            response.sendRedirect("/Online_Quiz/common/subdimension");

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
