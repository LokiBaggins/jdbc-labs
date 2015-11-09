package lab02.services;

import dbConnection.ConnectionPool;
import lab02.beans.AnswerBean;
import lab02.beans.QuestionBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionService {

    public QuestionService() {
    }

    public static List<QuestionBean> getAllQuestions() {
        List<QuestionBean> questions = new ArrayList<>();
        QuestionBean qb;
        PreparedStatement selData;
        ResultSet rs;
        String selDataStr = "SELECT * FROM questions;";

        try ( Connection conn = ConnectionPool.getInstance().getConnection()) {
            selData = conn.prepareStatement(selDataStr);
            rs = selData.executeQuery();

            while (rs.next()) {
                qb = new QuestionBean();
                qb.setId(rs.getLong("ID"));
                qb.setText(rs.getString("TEXT"));

                questions.add(qb);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }

    public static QuestionBean getQuestionById(long questId) {
        QuestionBean qb = new QuestionBean();
        PreparedStatement selData;
        ResultSet rs;
        String selDataStr = "SELECT * FROM questions WHERE ID = ?;";

        try ( Connection conn = ConnectionPool.getInstance().getConnection()) {
            selData = conn.prepareStatement(selDataStr);
            selData.setLong(1, questId);
            rs = selData.executeQuery();

            while (rs.next()) {
                qb.setId(rs.getLong("ID"));
                qb.setText(rs.getString("TEXT"));
                qb.setCorrectAnswerId(rs.getLong("CORRECT_ANSWER"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return qb;
    }
}
