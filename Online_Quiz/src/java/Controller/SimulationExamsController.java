/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DAO;
import Model.Level;
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
@WebServlet(name = "SimulationExamsController", urlPatterns = {"/common/simulationexams"})
public class SimulationExamsController extends HttpServlet {

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
            out.println("<title>Servlet SimulationExamsController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SimulationExamsController at " + request.getContextPath() + "</h1>");
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
        String didStr = request.getParameter("did");
        int did = -1;
        if (didStr != null) {
            did = Integer.parseInt(didStr);
        }
        String lidStr = request.getParameter("lid");
        int lid = -1;
        if (didStr != null) {
            lid = Integer.parseInt(lidStr);
        }
        String search = request.getParameter("search");
        String txt = request.getParameter("index");
        int index = 0;
        if (txt == null) {
            index = 1;
        } else {
            index = Integer.parseInt(txt);
        }
        List<Subject> list = dao.getAllSimulation(did,lid,search,index);
        int numpage = dao.totalPagesimulation(did,lid, search);
        List<Subject> list2 = dao.getAllSimulationByname();
        List<Level> listlevel = dao.getAllSimulationBylevel();
        
        
        request.setAttribute("listbylevel", listlevel);
        request.setAttribute("listbysubject", list2);
        request.setAttribute("listS", list);
        request.setAttribute("numpage", numpage);
        request.setAttribute("index", index);
        request.setAttribute("did", did);
        request.setAttribute("lid", lid);
        request.setAttribute("ts", search);
        request.getRequestDispatcher("/common/SimulationExams.jsp").forward(request, response);
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
