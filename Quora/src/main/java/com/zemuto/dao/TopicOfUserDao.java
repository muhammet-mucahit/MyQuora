package com.zemuto.dao;

import com.zemuto.entity.TopicOfUser;
import com.zemuto.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

@Component
public class TopicOfUserDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public boolean isNewUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        NativeQuery query = session.createNativeQuery("SELECT * FROM TopicOfUser WHERE userID = ?", TopicOfUser.class);
        query.setLong(1, user.getId());
        List<TopicOfUser> topicOfUsers = query.list();

        if (topicOfUsers.isEmpty())
            return true;

        return false;
    }

    @Transactional
    public void addTopicOfUser(TopicOfUser topicOfUser) {
        Session session = sessionFactory.getCurrentSession();
        session.save(topicOfUser);
    }

    @Transactional
    public List<TopicOfUser> getRelatedTopicsIDs(User currentUser) {
        Session session = sessionFactory.getCurrentSession();
        NativeQuery query = session.createNativeQuery("SELECT * FROM TopicOfUser WHERE userID = ?", TopicOfUser.class);
        query.setLong(1, currentUser.getId());
        List<TopicOfUser> relatedTopicsIDs = query.list();
        return relatedTopicsIDs;
    }
}