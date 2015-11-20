package lab02;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;


@WebServlet(urlPatterns = {"/questioncontroller.do"})
public class QuestionController extends HttpServlet {
    private static final String questDir = "views/questions/";
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //    TODO: create parameter of action
        //    TODO: code switch on action type
        //    TODO: add logic

        RequestDispatcher toShow = req.getRequestDispatcher(questDir + "question.jsp");
        RequestDispatcher toEdit = req.getRequestDispatcher(questDir + "edit.jsp");
        RequestDispatcher toError = req.getRequestDispatcher("views/error_page.jsp");
        String action = req.getParameter("action");

        String q_id = req.getParameter("id");
        if ( q_id.isEmpty() ) {
            toError.forward(req, res);
            return;
        }

        switch (action) {
            case "show":
                toShow.forward(req, res);
                break;
            case "edit":
                toEdit.forward(req, res);
                break;
            default:
//                printRequesBody(req, res);
                toError.forward(req, res);
        }
    }





}

