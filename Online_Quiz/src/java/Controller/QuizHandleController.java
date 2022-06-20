/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.QuizDAO;
import Model.Account;
import Model.Answer;
import Model.Question;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author hongd
 */
@WebServlet(name = "QuizHandleController", urlPatterns = {"/learning/quizhandle"})
public class QuizHandleController extends HttpServlet {

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
            out.println("<title>Servlet QuizHandleController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizHandleController at " + request.getContextPath() + "</h1>");
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
        QuizDAO quiz = new QuizDAO();

        String quiz_id_raw = request.getParameter("quiz_id");
        String index_question_raw = request.getParameter("index_quiz");
        String take_id_raw = request.getParameter("quiz_take");
        try {

            int quiz_id = Integer.parseInt(quiz_id_raw);
            int numberOfQuestion = quiz.getTotalQuestion(quiz_id); //Get total question
            int questionIndex; //Get current question index
            if (index_question_raw != null && !index_question_raw.isEmpty()) {
                questionIndex = Integer.parseInt(index_question_raw);
            } else {
                questionIndex = 1;
            }
            if (questionIndex < 0 || questionIndex > numberOfQuestion) {
                questionIndex = 1;
            }
            int take_id = 0;
            if (take_id_raw != null) {
                take_id = Integer.parseInt(take_id_raw);
            }

            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");

            List<Question> questionList = quiz.getQuestionList(quiz_id);
            Question currentQuestion = questionList.get(questionIndex - 1);
            QuizTake quiztake = quiz.getQuizTake(account.getId());
            List<Answer> answerList = quiz.getAnswerList(quiz_id, questionIndex);
            
            QuizTakeDetails qtDetails = quiz.getQtDetails(take_id, questionIndex);

            request.setAttribute("quiz_take_details", qtDetails);
            request.setAttribute("quiz_take", quiztake);
            request.setAttribute("quizId", quiz_id);
            request.setAttribute("answerList", answerList);
            request.setAttribute("questionInfo", currentQuestion);
            request.setAttribute("questionIndex", questionIndex);
            request.setAttribute("numberOfQuestion", numberOfQuestion);

        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        request.getRequestDispatcher("/learning/quizhandle.jsp").forward(request, response);
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
        String take_id_raw = request.getParameter("quiz_take");
        try {
            int take_id = Integer.parseInt(take_id_raw);
            QuizDAO quiz = new QuizDAO();
            QuizTake quiztake = quiz.getQuizTakeById(take_id);
//            System.out.println(quiztake.getQuiz_id());
            Quiz quizObj = quiz.getQuiz(quiztake.getQuiz_id());
//            System.out.println(quiztake.getStart_time().getSeconds());
            java.util.Date date = new java.util.Date();
            PrintWriter out = response.getWriter();
            if (quizObj.getType() == 1) {
                long takeTime = TimeUnit.MILLISECONDS.toSeconds(quiztake.getStart_time().getTime());
                long currentTime = TimeUnit.MILLISECONDS.toSeconds(date.getTime());
                long targetTime = takeTime + quizObj.getDuration() * 60;
                if ((targetTime - currentTime) > (quizObj.getDuration() * 60)) {
                    quiz.submitQuiz(take_id);
                } else {
                    out.println(targetTime - currentTime);
                }
            } else {
                long takeTime = TimeUnit.MILLISECONDS.toSeconds(quiztake.getStart_time().getTime());
                long currentTime = TimeUnit.MILLISECONDS.toSeconds(date.getTime());
                long targetTime = takeTime + quizObj.getDuration() * 60;
                out.println(currentTime - takeTime);

            }
        } catch (Exception e) {
            System.out.println(e);
        }
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
