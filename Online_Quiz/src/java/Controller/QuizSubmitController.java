/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.QuizDAO;
import Model.Answer;
import Model.Quiz;
import Model.QuizTake;
import Model.QuizTakeDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.concurrent.TimeUnit;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hongd
 */
@WebServlet(name = "QuizSubmitController", urlPatterns = {"/learning/quizsubmit"})
public class QuizSubmitController extends HttpServlet {

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
            out.println("<title>Servlet QuizSubmitController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizSubmitController at " + request.getContextPath() + "</h1>");
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
        String take_id = request.getParameter("quiz_take");
        QuizDAO quiz = new QuizDAO();
        
        int total_question_correct=0;
        try {
            int takeid = Integer.parseInt(take_id);
            QuizTake quiztake = quiz.getQuizTakeById(takeid);
            Quiz quizObj = quiz.getQuiz(quiztake.getQuiz_id());

            java.util.Date date = new java.util.Date();
            long takeTime = TimeUnit.MILLISECONDS.toSeconds(quiztake.getStart_time().getTime());
            long currentTime = TimeUnit.MILLISECONDS.toSeconds(date.getTime());
//            System.out.println(quizObj.getDuration() * 60);
            long targetTime = takeTime + quizObj.getDuration() * 60;

            
            long time = targetTime - currentTime;

            List<QuizTakeDetails> qd = quiz.getTakeDetails(takeid);
            
            for (QuizTakeDetails quizTakeDetails : qd) {
//                System.out.println(quizTakeDetails.getQues_id());
                Answer ans = quiz.getCorrectAnswers(quiztake.getQuiz_id(),quizTakeDetails.getQues_id());
//                System.out.println(ans.getAnswer());
                if (quizTakeDetails!=null&&ans!=null&&quizTakeDetails.getAnswer_id() == ans.getId()) {
                    total_question_correct++;
                }
            }
//            System.out.println(Math.round(total_question_correct/100));
            int numberOfAnswer = quiz.getTotalQuestion(quiztake.getQuiz_id());
            System.out.println(numberOfAnswer);
            System.out.println(total_question_correct);
            double score_raw = (double)total_question_correct/(double)numberOfAnswer;
            System.out.println(score_raw);
            if (time <= (quizObj.getDuration() * 60) && time >= 0) {
                quiz.submitQuiz(takeid,score_raw);
                request.setAttribute("message", "Quiz submit successfully");
                request.setAttribute("status", true);
                request.setAttribute("duration", quizObj.getDuration());
                request.setAttribute("take_time", time);
                request.setAttribute("score", Math.round(score_raw*100));
                request.setAttribute("quiz_id", quiztake.getQuiz_id());
                request.setAttribute("quiz_take", takeid);
            } else if (time < 0) {
                request.setAttribute("message", "Quiz submit fail");
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("/learning/quizfinish.jsp").forward(request, response);
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
