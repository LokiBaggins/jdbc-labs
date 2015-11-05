package lab02.beans;

import java.io.Serializable;

public class AnswerBean implements Serializable {
    private int id;
    private String text;

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

    @Override
    public String toString() {
        return "AnswerBean{" +
                "id=" + id +
                ", text='" + text + '\'' +
                '}';
    }
}
