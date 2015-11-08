package lab02.services;

import dbConnection.ConnectionPool;
import lab02.beans.AnswerBean;
import lab02.beans.QuestionBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

public class DaoService {

    public DaoService() {
    }

    public static List<AnswerBean> getAnswersByQuestionId(int questId) {
        List<AnswerBean> answers = new ArrayList<>();
        AnswerBean ab;
        PreparedStatement selData;
        ResultSet rs;
        String selDataStr = "SELECT answers.ID, answers.TEXT, questions_to_answers.is_correct" +
                            "   FROM questions " +
                            "LEFT JOIN questions_to_answers " +
                            "   ON questions.ID = questions_to_answers.FK_quest_id " +
                            "LEFT JOIN answers" +
                            "   ON questions_to_answers.FK_answer_id = answers.ID " +
                            "WHERE questions.ID = ?";

        try ( Connection conn = ConnectionPool.getInstance().getConnection()) {
            selData = conn.prepareStatement(selDataStr);
            selData.setInt(1, questId);
            rs = selData.executeQuery();

            while (rs.next()) {
                ab = new AnswerBean();
                ab.setId(rs.getInt("ID"));
                ab.setText(rs.getString("TEXT"));
                ab.setIsCorrect(rs.getInt("IS_CORRECT"));
                answers.add(ab);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return answers;
    }

    public static List<AnswerBean> getAllAnswers() {
        List<AnswerBean> answers = new ArrayList<>();
        AnswerBean ab;
        PreparedStatement selData;
        ResultSet rs;
        String selDataStr = "SELECT * FROM answers;";

        try ( Connection conn = ConnectionPool.getInstance().getConnection()) {
            selData = conn.prepareStatement(selDataStr);
            rs = selData.executeQuery();

            while (rs.next()) {
                ab = new AnswerBean();
                ab.setId(rs.getInt("ID"));
                ab.setText(rs.getString("TEXT"));

                answers.add(ab);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return answers;
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
                qb.setId(rs.getInt("ID"));
                qb.setText(rs.getString("TEXT"));

                questions.add(qb);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }

    public static QuestionBean getQuestionById(int questId) {
        QuestionBean qb = new QuestionBean();
        PreparedStatement selData;
        ResultSet rs;
        String selDataStr = "SELECT * FROM questions WHERE ID = ?;";

        try ( Connection conn = ConnectionPool.getInstance().getConnection()) {
            selData = conn.prepareStatement(selDataStr);
            selData.setInt(1, questId);
            rs = selData.executeQuery();

            while (rs.next()) {
                qb.setId(rs.getInt("ID"));
                qb.setText(rs.getString("TEXT"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return qb;
    }
}
