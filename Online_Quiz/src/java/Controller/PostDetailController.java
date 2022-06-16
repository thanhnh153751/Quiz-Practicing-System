/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.PostDAO;
import Model.Post;
import Model.PostCategory;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hongd
 */
@WebServlet(name = "PostDetailController", urlPatterns = {"/marketing/postdetails"})
public class PostDetailController extends HttpServlet {

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

        PostDAO post = new PostDAO();
        String service = request.getParameter("do");
        String filter = request.getParameter("filter");

        String filteredit = request.getParameter("filteredit");

        if (service == null) {
            service = "list";
        }
        if (service.equalsIgnoreCase("details")) {

            String pid_raw = request.getParameter("id");
            int pid = Integer.parseInt(pid_raw);
            Post p = post.loadPostDetails(pid);

            request.setAttribute("details", p);
            request.getRequestDispatcher("/marketing/postdetails.jsp").forward(request, response);

        } else if (service.equalsIgnoreCase("add")) {

            if (filter == null) {
                List<PostCategory> allcate = post.loadPostCategory();
                request.setAttribute("listPC", allcate);
                request.setAttribute("do", service);
                request.getRequestDispatcher("/marketing/inputPost.jsp").forward(request, response);

            } else {
                String post_title = request.getParameter("posttitle");
                String brif = request.getParameter("biref");
                String details = request.getParameter("details");
                String author = request.getParameter("author");

                String contact = request.getParameter("contact");

//            String thumbail = request.getParameter("thumbail");
                String category = request.getParameter("category");
                String status_raw = request.getParameter("status");
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                String date1 = String.valueOf(dateFormat.format(date));
                post.inputPost(post_title, brif, details, author, date1, contact, category, Integer.parseInt(status_raw));
                request.getRequestDispatcher("/public/home").forward(request, response);
            }
        } else if (service.equalsIgnoreCase("list")) {

            List<Post> listp = post.loadAllPost();
            request.setAttribute("listP", listp);
            request.getRequestDispatcher("/marketing/post.jsp").forward(request, response);
        } else if (service.equalsIgnoreCase("edit")) {
            if (filteredit == null) {
                String pid_raw = request.getParameter("id");
                int pid = Integer.parseInt(pid_raw);
                Post p = post.loadPostDetails(pid);

                request.setAttribute("details", p);
                List<PostCategory> allcate = post.loadPostCategory();
                request.setAttribute("listPC", allcate);
                request.setAttribute("do", service);

                request.getRequestDispatcher("/marketing/editPost.jsp").forward(request, response);
            } else {
                String pid_raw = request.getParameter("id");
                int pid = Integer.parseInt(pid_raw);
                String post_title = request.getParameter("posttitle");
                String brif = request.getParameter("biref");

                String details = request.getParameter("details");
                String category = request.getParameter("category");

//                String thumbail = request.getParameter("thumbail");
                String status_raw = request.getParameter("status");

//            postdetailInput
//            postdatailExit
                post.EditPost(post_title, brif, details, category, Integer.parseInt(status_raw), pid);
                response.sendRedirect("/Online_Quiz/marketing/postdetails?id=" + pid_raw);
                return;
            }

        } else if (service.equalsIgnoreCase("changing")) {

            String pid_raw = request.getParameter("id");
           String status_raw = request.getParameter("status");
           post.changestatus(Integer.parseInt(pid_raw), Integer.parseInt(status_raw));

            response.sendRedirect("/Online_Quiz/marketing/postdetails");
            return;
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
