package lab02.beans;

import java.io.Serializable;

public class AnswerBean implements Serializable {
    private long id;
    private String text;
    private int isCorrect;

    public AnswerBean() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(int isCorrect) {
        this.isCorrect = isCorrect;
    }

    @Override
    public String toString() {
        return "AnswerBean{" +
                "id=" + id +
                ", text='" + text + '\'' +
                '}';
    }
}
