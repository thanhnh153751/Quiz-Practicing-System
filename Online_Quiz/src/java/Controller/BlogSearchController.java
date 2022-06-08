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
@WebServlet(name = "BlogSearchController", urlPatterns = {"/public/blogsearch"})
public class BlogSearchController extends HttpServlet {

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
            out.println("<title>Servlet BlogSearchController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogSearchController at " + request.getContextPath() + "</h1>");
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
        String search = request.getParameter("searchname");
        String category = request.getParameter("category");
//        String index_raw = request.getParameter("indexP");
//        if (index_raw == null) {
//            index_raw = "1";
//        }
        if ("".equals(category)) {
            category = null;
        }
        if ("".equals(search)) {
            search = null;
        }
        try {
            PostDAO postdao = new PostDAO();
//            int index = Integer.parseInt(index_raw);
            List<Post> rs = postdao.searchPost(search, category);
//            List<Post> posts = postdao.loadAllPost();
            List<PostCategory> cate = postdao.loadPostCategory();

            List<PostCategory> listpc = postdao.loadPostCategory();
//            int postscount = rs.size();
//            int lastpage = postscount / 3;
//            if (postscount % 3 != 0) {
//                lastpage ++;
//            }
            request.setAttribute("cate", category);
            request.setAttribute("search", search);
            request.setAttribute("postcate", cate);
            request.setAttribute("postlist", rs);
//            request.setAttribute("lastpage", lastpage);
            request.setAttribute("listc", listpc);
            request.getRequestDispatcher("/public/searchblog.jsp").forward(request, response);
        } catch (Exception e) {
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
