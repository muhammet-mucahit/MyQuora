package com.zemuto.entity;

import org.springframework.context.annotation.Scope;

import javax.persistence.*;

@Entity
@Scope("session")
public class TopicOfQuestion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "questionID", referencedColumnName = "questionID")
    private Question question;
    @ManyToOne
    @JoinColumn(name = "topicID", referencedColumnName = "topicID")
    private Topic topic;

    public TopicOfQuestion() {
    }

    public Long getId() {
        return id;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    @Override
    public String toString() {
        return "TopicOfQuestion{" +
                "id=" + id +
                ", question=" + question +
                ", topic=" + topic +
                '}';
    }
}
