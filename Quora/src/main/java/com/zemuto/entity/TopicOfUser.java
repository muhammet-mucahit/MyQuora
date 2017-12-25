package com.zemuto.entity;

import org.springframework.context.annotation.Scope;

import javax.persistence.*;

@Entity
@Scope("session")
public class TopicOfUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "userID", referencedColumnName = "id")
    private User user;
    @ManyToOne
    @JoinColumn(name = "topicID", referencedColumnName = "topicID")
    private Topic topic;

    public Long getId() {
        return id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    @Override
    public String toString() {
        return "TopicOfUser{" +
                "id=" + id +
                ", user=" + user +
                ", topic=" + topic +
                '}';
    }
}
