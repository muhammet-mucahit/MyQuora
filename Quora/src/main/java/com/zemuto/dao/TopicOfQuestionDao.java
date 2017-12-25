package com.zemuto.dao;

import com.zemuto.entity.TopicOfQuestion;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Component
public class TopicOfQuestionDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public void addTopicOfQuestion(TopicOfQuestion topicOfQuestion) {
        Session session = sessionFactory.getCurrentSession();
        session.save(topicOfQuestion);
    }
}
