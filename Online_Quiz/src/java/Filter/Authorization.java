/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import DAO.AuthorizationDAO;
import Model.Account;
import Model.Action;
import Util.CheckActionUtil;
import java.io.IOException;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hongd
 */
public class Authorization implements Filter {

    private static final boolean debug = true;

    private ServletContext context;

    public Authorization() {
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        String path_raw = request.getRequestURI();
        String path = path_raw.substring(12, path_raw.length());

        CheckActionUtil cautil = new CheckActionUtil();
        if (path.startsWith("/admin")) {
            if (account != null) {
                AuthorizationDAO authordao = new AuthorizationDAO();
                List<Action> actions = authordao.getActionByAccount(account.getId());
                for (Action action : actions) {
                    System.out.println(action.getAction_code());
                }
                if (cautil.checkActionInList(actions, "FULL")) {
                    chain.doFilter(req, res);
                } else {
                    request.setAttribute("mess", "You don't have permission!");
                    request.getRequestDispatcher("/common/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("mess", "Please login!");
                request.getRequestDispatcher("/common/login.jsp").forward(request, response);
            }
        } else {
            chain.doFilter(req, res);
        }

    }

    @Override
    public void destroy() {
        System.out.println("Destroy"); //To change body of generated methods, choose Tools | Templates.
    }

}
