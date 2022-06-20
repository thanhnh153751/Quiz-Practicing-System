/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hongd
 */
@WebServlet(name = "QuizLoadAnswer", urlPatterns = {"/learning/quizloadanswer"})
public class QuizLoadAnswer extends HttpServlet {

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
            out.println("<title>Servlet QuizLoadAnswer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizLoadAnswer at " + request.getContextPath() + "</h1>");
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
        String quiz_id_raw = request.getParameter("quiz_id");
        String index_quiz_raw = request.getParameter("index_quiz");
        String quiz_take_raw = request.getParameter("quiz_take");
        String quiz_choice_raw = request.getParameter("quiz_choice");

        try {
            int quiz_id = Integer.parseInt(quiz_id_raw);
            int index_quiz = Integer.parseInt(index_quiz_raw);
            int quiz_take = Integer.parseInt(quiz_take_raw);
            int quiz_choice = Integer.parseInt(quiz_choice_raw);

            QuizDAO quizdao = new QuizDAO();
            boolean checkQtDetails = quizdao.checkQtDetails(quiz_take, index_quiz);
            if (checkQtDetails == false) {
                quizdao.createQuizTakeDetails(quiz_take, index_quiz, quiz_choice);

            }else{
                quizdao.updateQtDetails(quiz_take, index_quiz, quiz_choice);
            }
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
