package com.zemuto.dao;

import com.zemuto.entity.Topic;
import com.zemuto.entity.TopicOfUser;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Component
public class TopicDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public List<Topic> getRelatedTopics(String[] topicNames) {
        Session session = sessionFactory.getCurrentSession();
        NativeQuery query = session.createNativeQuery("SELECT * FROM Topic WHERE topicName IN (?, ?, ?, ?, ?)", Topic.class);
        query.setString(1, topicNames[0]);
        query.setString(2, topicNames[1]);
        query.setString(3, topicNames[2]);
        query.setString(4, topicNames[3]);
        query.setString(5, topicNames[4]);
        List<Topic> relatedTopics = query.list();

        return relatedTopics;
    }

    @Transactional
    public List<Topic> getRelatedTopics(List<TopicOfUser> topicsOfUser) {
        Session session = sessionFactory.getCurrentSession();
        NativeQuery query = session.createNativeQuery("SELECT * FROM Topic WHERE topicID IN (?, ?, ?, ?, ?)", Topic.class);
        query.setLong(1, topicsOfUser.get(0).getTopic().getTopicID());
        query.setLong(2, topicsOfUser.get(1).getTopic().getTopicID());
        query.setLong(3, topicsOfUser.get(2).getTopic().getTopicID());
        query.setLong(4, topicsOfUser.get(3).getTopic().getTopicID());
        query.setLong(5, topicsOfUser.get(4).getTopic().getTopicID());
        List<Topic> relatedTopics = query.list();

        return relatedTopics;
    }
}
