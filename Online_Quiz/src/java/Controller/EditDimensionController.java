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
@WebServlet(name = "EditDimensionController", urlPatterns = {"/common/editdimension"})
public class EditDimensionController extends HttpServlet {

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
            String sid = request.getParameter("sid");
            Subject list = dao.getAllSubjectDimensionbypid(id);
//        String Strdid = request.getParameter("did");
//        int did = Integer.parseInt(Strdid);
//        List<Subject> list1 = dao.getAllSubjectDimensionbyid(did);
//        request.setAttribute("list1", list1);
            request.setAttribute("listD", list);
            request.setAttribute("id", id);
            request.setAttribute("sid", sid);
            request.getRequestDispatcher("/common/EditDimension.jsp").forward(request, response);
        } else {

            String sid = request.getParameter("sid");
//            System.out.println(sid);
            String did = request.getParameter("id");
//            System.out.println(did);
            int id = Integer.parseInt(did);
            String type = request.getParameter("type");
//            System.out.println(type);
            String name = request.getParameter("name");
//            System.out.println(name);
            String description = request.getParameter("description");
            System.out.println(description);
            dao.editDimension(id, Integer.parseInt(sid), type, name, description);

            response.sendRedirect("/Online_Quiz/common/subdimension");

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
