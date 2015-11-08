package lab02.beans;

import java.io.Serializable;

public class QuestionBean implements Serializable {
    private String text;
    private long id;
    private long correctAnswerId;

    public QuestionBean() {
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public long getCorrectAnswerId() {
        return correctAnswerId;
    }

    public void setCorrectAnswerId(long correctAnswerId) {
        this.correctAnswerId = correctAnswerId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "QuestionBean{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", correctAnswerId=" + correctAnswerId +
                '}';
    }
}
