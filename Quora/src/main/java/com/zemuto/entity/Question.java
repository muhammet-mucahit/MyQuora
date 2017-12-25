package com.zemuto.entity;

import org.springframework.context.annotation.Scope;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Scope("session")
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long questionID;
    private String question;
    @ManyToOne
    @JoinColumn(name = "userID", referencedColumnName = "id")
    private User user;
    private Timestamp askDate;
    private long numberOfVotes;

    public Question() {

    }

    public Long getQuestionID() {
        return questionID;
    }

    public void setQuestionID(Long questionID) {
        this.questionID = questionID;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Timestamp getAskDate() {
        return askDate;
    }

    public long getNumberOfVotes() {
        return numberOfVotes;
    }

    public void setNumberOfVotes(long numberOfVotes) {
        this.numberOfVotes = numberOfVotes;
    }

    @Override
    public String toString() {
        return "Question{" +
                "questionID=" + questionID +
                ", question='" + question + '\'' +
                ", user=" + user +
                ", askDate='" + askDate + '\'' +
                ", numberOfVotes=" + numberOfVotes +
                '}';
    }
}
