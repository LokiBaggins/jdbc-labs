package lab02.beans;

import java.io.Serializable;

public class AnswerBean implements Serializable {
    private int id;
    private String text;
    private int question_id;

    public AnswerBean() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    @Override
    public String toString() {
        return "AnswerBean{" +
                "id=" + id +
                ", text='" + text + '\'' +
                '}';
    }
}
