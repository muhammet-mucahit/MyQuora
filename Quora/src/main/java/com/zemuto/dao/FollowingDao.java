package com.zemuto.dao;

import com.zemuto.entity.Following;
import com.zemuto.entity.Question;
import com.zemuto.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Component
public class FollowingDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public void follow(Following following) {

        Session session = sessionFactory.getCurrentSession();
        session.save(following);
    }

    @Transactional
    public void unfollow(User follower, User followed) {
        Session session = sessionFactory.getCurrentSession();
        session.createNativeQuery("delete from Following where followerID = ? and followedID = ?")
                .setParameter(1, follower.getId())
                .setParameter(2, followed.getId())
                .executeUpdate();
    }

    @Transactional
    public List<Following> isFollowing(User follower, User followed) {
        Session session = sessionFactory.getCurrentSession();
        List<Following> isFollowing = session.createNativeQuery("select * from Following where followerID = ? and followedID = ?", Following.class)
                .setParameter(1, follower.getId())
                .setParameter(2, followed.getId())
                .list();

        return isFollowing;
    }
}
