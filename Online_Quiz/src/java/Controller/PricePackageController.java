/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.PackageDAO;
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
 * @author PREDATOR
 */
@WebServlet(name = "PricePackageController", urlPatterns = {"/courseContent/pricepackage"})
public class PricePackageController extends HttpServlet {

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
        PackageDAO dao = new PackageDAO();
        
        String service = request.getParameter("do");
        List<Subject> listsub = dao.ListOfSubjectP();
        
        
        request.setAttribute("listS", listsub);
        if (service == null) {
            service = "list";
        }
        if (service.equalsIgnoreCase("list")) {
            int sid = Integer.parseInt(request.getParameter("sid"));
            List<Model.Package> listPk = dao.ListOfPackage(sid);
            
            
            //phantrang
        int page,numberpage = 3;
        int size = listPk.size();
        int num = (size%3==0?(size/3):((size/3)+1));
        String xpage = request.getParameter("index");
        if(xpage==null){
            page = 1;
        }else{
            page = Integer.parseInt(xpage);
        }
        int start,end;
        start= (page-1)*numberpage;
        end = Math.min(page*numberpage,size );
        request.setAttribute("index", page);
        request.setAttribute("num", num);
        request.setAttribute("sid", sid);
            
        List<Model.Package> list1 = dao.getListbyPage(listPk, start, end);
        request.setAttribute("listPP", list1);
            request.getRequestDispatcher("/courseContent/Package.jsp").forward(request, response);
        } else if (service.equalsIgnoreCase("add")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String sid = request.getParameter("sid");
                request.setAttribute("sid", sid);
                request.getRequestDispatcher("/courseContent/inputPackage.jsp").forward(request, response);
            } else {
                String subject = request.getParameter("subject");
                String sid = request.getParameter("sid");
                String name = request.getParameter("name");
                String duration = request.getParameter("duration");
                String status = request.getParameter("status");
                String list_price = request.getParameter("list_price");
                String sale_price = request.getParameter("sale_price");
                String description = request.getParameter("description");
                
                dao.inputPackage(Integer.parseInt(subject), name, Integer.parseInt(duration), Integer.parseInt(list_price), Integer.parseInt(sale_price), Integer.parseInt(status), description);
                request.setAttribute("sid", sid);
                response.sendRedirect("pricepackage?sid="+sid);
                
            }
            
        } else if (service.equalsIgnoreCase("edit")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String id = request.getParameter("id");
                String sid = request.getParameter("sid");
                Model.Package pack = dao.loadPackagesByPid(Integer.parseInt(id));
                request.setAttribute("sid", sid);
                request.setAttribute("details", pack);
                request.getRequestDispatcher("/courseContent/editPackage.jsp").forward(request, response);
            } else {
                String sid = request.getParameter("sid");
                String subject = request.getParameter("subject");
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String duration = request.getParameter("duration");
                String status = request.getParameter("status");
                if(status.equalsIgnoreCase("active")){
                    status = "1";
                }else{
                    status = "0";
                }
                String list_price = request.getParameter("list_price");
                String sale_price = request.getParameter("sale_price");
                String description = request.getParameter("description");
                request.setAttribute("sid", sid);
                dao.editPackage(Integer.parseInt(id), Integer.parseInt(subject), name, Integer.parseInt(duration), Integer.parseInt(list_price), Integer.parseInt(sale_price), Integer.parseInt(status), description);
                response.sendRedirect("pricepackage?sid="+sid);
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
