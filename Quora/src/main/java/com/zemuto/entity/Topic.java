package com.zemuto.entity;

import org.springframework.context.annotation.Scope;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Scope("session")
public class Topic {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long topicID;
    private String topicName;

    public Topic() {
    }

    public Long getTopicID() {
        return topicID;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    @Override
    public String toString() {
        return "Topic{" +
                "topicID=" + topicID +
                ", topicName='" + topicName + '\'' +
                '}';
    }
}
