package lab02.services;

import dbConnection.ConnectionPool;
import lab02.beans.AnswerBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class AnswersServices {

    public static List<AnswerBean> getAnswersSet(long correctId) {
        return getAnswersSet(correctId, 5L);
    }

    public static List<AnswerBean> getAnswersSet(long correctId, long answersNum) {
        List<AnswerBean> answersPack = new ArrayList<>();
        AnswerBean ab;
        //1. Get right answer by ID
        AnswerBean correctAns = getAnswerById(correctId);
        answersPack.add(correctAns);
//        2. Get a pack of 5 rows from DB
//          2.1 Get a pack of 5 rows random range from DB
        PreparedStatement ps;
        ResultSet rs;
        String psStr = "SELECT * FROM answers LIMIT ?;";

        try ( Connection conn = ConnectionPool.getInstance().getConnection()) {
            ps = conn.prepareStatement(psStr);
            ps.setLong(1, answersNum);
            rs = ps.executeQuery();

            while (rs.next()) {
//        3. Rejecting duplicate of correct answer if it's trapped
                if (rs.getLong("ID") != correctAns.getId()) {
                    ab = new AnswerBean();
                    ab.setId(rs.getLong("ID"));
                    ab.setText(rs.getString("TEXT"));

                    answersPack.add(ab);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        4. Choose 4 random objects from selection.
        answersPack = randomizeList(answersPack);

        return answersPack;
    }

    private static List randomizeList(List list) {
        List randomizedList = new ArrayList<>();
        Random rndGenerator = new Random();
        while (list.size() != 0) {
            int rnd = rndGenerator.nextInt(list.size());
            randomizedList.add(list.get(rnd));
            list.remove(rnd);
            double d = .5;
        }

        return randomizedList;
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
                ab.setId(rs.getLong("ID"));
                ab.setText(rs.getString("TEXT"));

                answers.add(ab);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return answers;
    }

    public static AnswerBean getAnswerById(long answerId) {
        AnswerBean ab = null;
        PreparedStatement ps;
        String psStr = "SELECT * FROM answers WHERE ID=?;";
        ResultSet rs;
        try ( Connection conn = ConnectionPool.getInstance().getConnection()) {
            ps = conn.prepareStatement(psStr);
            ps.setLong(1, answerId);
            rs = ps.executeQuery();

            while (rs.next()) {
                ab = new AnswerBean();
                ab.setId(rs.getLong("ID"));
                ab.setText(rs.getString("TEXT"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ab;
    }
}
