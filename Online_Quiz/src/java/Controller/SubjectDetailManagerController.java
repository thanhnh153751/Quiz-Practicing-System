/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDAO;
import DAO.SubjectDAO;
import DAO.UserPermissionDAO;
import Model.Account;
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
@WebServlet(name = "SubjectDetailManagerController", urlPatterns = {"/courseContent/subjectdetailmanager"})
public class SubjectDetailManagerController extends HttpServlet {

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
            out.println("<title>Servlet SubjectDetailManagerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectDetailManagerController at " + request.getContextPath() + "</h1>");
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
        AccountDAO ad = new AccountDAO();
        SubjectDAO sd = new SubjectDAO();
        
        
        String key = request.getParameter("key");
        if(key!= ""){
            List<Account> listAcc = ad.loadAccountBySearch(key);
            request.setAttribute("listAcc", listAcc);
        }
        
        request.setAttribute("key", key);
        int sid = Integer.parseInt(request.getParameter("sid"));
        

        Subject subject = sd.loadSubjectDetail(sid);//fix sau này

        List<SubjectCategory> category = sd.loadAllSubjectCategory();
        request.setAttribute("category", category);

        SubSubjectCategory SubjectCategory = sd.loadSubSubjectCategoryBySubjectId(sid);//fix sau này
        request.setAttribute("subcategory", SubjectCategory);

        List<SubSubjectCategory> allsubCategory = sd.loadAllSubSubjectCategoryBySid(SubjectCategory.getCid());
        request.setAttribute("allsubcategory", allsubCategory);

        request.setAttribute("subject", subject);
        request.getRequestDispatcher("/courseContent/subject_details.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        SubjectDAO sd = new SubjectDAO();
        try {
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
            if (fileName.equals("")) {
                Subject s = new Subject(12, cid, name, owner, description, status);
                sd.updateGeneralSubjectWithoutImg(s);
                request.setAttribute("mess", "update success course");
            } else {
                Subject s = new Subject(12, cid, img, name, owner, description, status);
                sd.updateGeneralSubject(s);
                request.setAttribute("mess", "update success course");
            }
            
            //gửi lại data
            int sid = Integer.parseInt(request.getParameter("sid"));
            Subject subject = sd.loadSubjectDetail(sid);//fix sau này

            List<SubjectCategory> category = sd.loadAllSubjectCategory();
            request.setAttribute("category", category);

            SubSubjectCategory SubjectCategory = sd.loadSubSubjectCategoryBySubjectId(sid);//fix sau này
            request.setAttribute("subcategory", SubjectCategory);

            List<SubSubjectCategory> allsubCategory = sd.loadAllSubSubjectCategoryBySid(SubjectCategory.getCid());
            request.setAttribute("allsubcategory", allsubCategory);

            request.setAttribute("subject", subject);

            //
            request.getRequestDispatcher("/courseContent/subject_details.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }

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
