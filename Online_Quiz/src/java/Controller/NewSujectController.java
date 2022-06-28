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
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author THANH
 */
@MultipartConfig
@WebServlet(name = "NewSujectController", urlPatterns = {"/courseContent/newsuject"})
public class NewSujectController extends HttpServlet {

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
            out.println("<title>Servlet NewSujectController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewSujectController at " + request.getContextPath() + "</h1>");
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

        SubjectDAO sd = new SubjectDAO();
        List<SubjectCategory> category = sd.loadAllSubjectCategory();
        request.setAttribute("category", category);

        request.getRequestDispatcher("/courseContent/new_subject.jsp").forward(request, response);
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
        SubjectDAO sd = new SubjectDAO();
        try {
            List<SubjectCategory> category = sd.loadAllSubjectCategory();
            request.setAttribute("category", category);

            String name = request.getParameter("title");
            String cid_raw = request.getParameter("subcategory");//phai khac 0
            String featured = request.getParameter("featured");
            String owner = request.getParameter("owner");
            String status_raw = request.getParameter("status");
            String description = request.getParameter("paragraph_text");
            if (featured != null) {
                System.out.println("checked");
            }
            int status = Integer.parseInt(status_raw);
            int cid = Integer.parseInt(cid_raw);
            //img
            String img = "../img/";
            Part part = request.getPart("file");
            String fileName = part.getSubmittedFileName();
            String path = getServletContext().getRealPath("/").replace("\\build", "") + "img" + File.separator + fileName;
            InputStream is = part.getInputStream();
            boolean succs = upoloadFile(is, path);

            is.close();
            img += fileName;
            //-------------------------------
            if (name == null || owner == null || cid == 0 || fileName.equals("")) {
                request.setAttribute("mess", "check the input fields again, there are invalid fields left");
            } else {
                Subject s = new Subject(cid, img, name, owner, description, status);
                sd.insertNewSubject(s);
                request.setAttribute("mess", "add new success course");
            }

        } catch (Exception e) {

        }
        request.getRequestDispatcher("/courseContent/new_subject.jsp").forward(request, response);
    }

    private boolean upoloadFile(InputStream is, String path) {
        boolean test = false;
        try {
            byte[] byt = new byte[1024];
            int read = 0;

            OutputStream fops = new FileOutputStream(path);
            while ((read = is.read(byt)) != -1) {
                fops.write(byt, 0, read);
            }
            fops.flush();

            fops.close();
            is.close();
//            try {
//                  TimeUnit.SECONDS.sleep(2);                
//            } catch (InterruptedException ex) {
//               
//            }
            test = true;
        } catch (Exception e) {
        }
        return test;
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
