package lab02.services;

import dbConnection.ConnectionPool;
import lab02.beans.AnswerBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoService {

    public DaoService() {
    }

    public static List<AnswerBean> getAnswers() {
        List<AnswerBean> answers = new ArrayList<>();
        AnswerBean ab;
        PreparedStatement selData;
        ResultSet rs;
//        String selDataStr = "SELECT * FROM categories;";
        String selDataStr = "SELECT * FROM answers;";

        try ( Connection conn = ConnectionPool.getInstance().getConnection()) {
            selData = conn.prepareStatement(selDataStr);
            rs = selData.executeQuery();

            while (rs.next()) {
                ab = new AnswerBean();
                ab.setId(rs.getInt("ID"));
                ab.setText(rs.getString("TEXT"));
                ab.setQuestion_id(rs.getInt("QUESTION_ID"));

                answers.add(ab);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return answers;
    }
}
