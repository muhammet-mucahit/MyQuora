package com.zemuto.entity;

import org.springframework.context.annotation.Scope;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "Answer")
@Scope("session")
public class Answer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long answerID;
    private String answer;
    @ManyToOne
    @JoinColumn(name = "questionID", referencedColumnName = "questionID")
    private Question question;
    @ManyToOne
    @JoinColumn(name = "userID", referencedColumnName = "id")
    private User user;
    private Timestamp answerDate;
    private long numberOfVotes;

    public Answer() {
    }

    public Long getAnswerID() {
        return answerID;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Timestamp getAnswerDate() {
        return answerDate;
    }

    public void setAnswerDate(Timestamp answerDate) {
        this.answerDate = answerDate;
    }

    public long getNumberOfVotes() {
        return numberOfVotes;
    }

    public void setNumberOfVotes(long numberOfVotes) {
        this.numberOfVotes = numberOfVotes;
    }

    @Override
    public String toString() {
        return "Answer{" +
                "answerID=" + answerID +
                ", answer='" + answer + '\'' +
                ", question=" + question +
                ", user=" + user +
                ", answerDate=" + answerDate +
                '}';
    }
}
