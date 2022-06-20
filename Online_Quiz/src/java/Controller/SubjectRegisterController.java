/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.OrderDAO;
import DAO.OrderTDAO;
import DAO.PackageDAO;
import DAO.SubjectDAO;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import Model.Package;
import Model.Subject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author THANH
 */
@WebServlet(name = "SubjectRegisterController", urlPatterns = {"/public/subjectregister"})
public class SubjectRegisterController extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        PackageDAO d = new PackageDAO();
        SubjectDAO sd = new SubjectDAO();
        OrderTDAO od = new OrderTDAO();
        String id_raw = request.getParameter("ids");
        String id_pac_raw = request.getParameter("idpac");
        if (id_pac_raw != null) {
            int id_pac = Integer.parseInt(id_pac_raw);
            Package p = d.loadPackagesByPid(id_pac);
            Subject s = sd.loadSubjectDetail(p.getSid());

            HttpSession session = request.getSession();
            Account x = (Account) session.getAttribute("acc");
            if (x != null) {
                od.addOrder(x, s, p);
                out.println("succesfully");
            } else {
                out.println("Please log in to your account");
                out.println("<div class=\"auth\">\n"
                        + "            <input type=\"button\" value=\"Login\" id=\"nav-login\" onclick=\"login()\">"
                        + "        </div>");
            }

        } else {
            try {
                //int id = Integer.parseInt(id_raw);
                List<Model.Package> packages = d.loadPackagesByCid(Integer.parseInt(id_raw));
                request.setAttribute("packages", packages);

                /* TODO output your page here. You may use following sample code. */
                out.println("<h4>select the appropriate subscription package</h4>");
                out.println("<fmt:setLocale value = \"en_US\"/>");
                for (Package pac : packages) {
                    // out.println("<p>" + pac.getName() + "</p>");
                    if (pac.getSale_price() != 0) {
                        out.println("<span style=\"color: red;\" >Sale :" + pac.getSale_price() + "$</span>");
                    } else {
                        out.println("<span>" + pac.getList_price() + "$</span>");
                    }

                    out.println("<input type=\"radio\" id=\"html\" name=\"package\" value=\"" + pac.getId() + "\"" + pac.getId() + "\">");
                    out.println("<label for=\"vehicle1\"> " + pac.getName() + "</label><br>");

                }

                out.println("<a id=\"myBtn2\" class=\"btn btn-outline-primary\" onclick=\"getData()\" > Register</a>");

            } catch (Exception e) {
            }
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
