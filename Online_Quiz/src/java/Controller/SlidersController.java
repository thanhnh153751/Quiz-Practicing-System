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
@WebServlet(name = "SlidersController", urlPatterns = {"/marketing/sliders"})
public class SlidersController extends HttpServlet {

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
            out.println("<title>Servlet SlidersController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SlidersController at " + request.getContextPath() + "</h1>");
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
        String service = request.getParameter("do");
        if (service == null) {
            service = "list";
        }

        if (service.equalsIgnoreCase("list")) {
            String statusStr = request.getParameter("status");
            int status = -1;
            if (statusStr != null) {
                status = Integer.parseInt(statusStr);
            }

            String search = request.getParameter("search");
            List<Sliders> list = dao.getAllSliders(status, search);
            int page, numperpage = 3;
            int size = list.size();
            int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1);
            String xpage = request.getParameter("index");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);
            List<Sliders> list1 = dao.getListByPageSlider(list, start, end);
            request.setAttribute("listS", list1);
            request.setAttribute("status", status);

            request.setAttribute("ts", search);
            request.setAttribute("index", page);
            request.setAttribute("num", num);
            request.getRequestDispatcher("Sliderslist.jsp").forward(request, response);
        } else if (service.equalsIgnoreCase("changing")) {
            String id = request.getParameter("id");
            String status = request.getParameter("status");
            dao.changestatusSliders(Integer.parseInt(id), status);
            response.sendRedirect("/Online_Quiz/marketing/sliders");
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
