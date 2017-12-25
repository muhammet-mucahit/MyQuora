package com.zemuto.dao;

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
public class UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public void addUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        NativeQuery query = session.createNativeQuery("insert into User(photo, name, surname, job, city, birthday, gender, email, password) VALUES(?,?,?,?,?,?,?,?,?)", User.class);
        if (user.getGender() == false) query.setString(1, "resources/images/avatar3.png");
        else                           query.setString(1, "resources/images/avatar5.png");
        query.setString(2, user.getName());
        query.setString(3, user.getSurname());
        query.setString(4, user.getJob());
        query.setString(5, user.getCity());
        query.setString(6, user.getBirthday());
        query.setBoolean(7, user.getGender());
        query.setString(8, user.getEmail());
        query.setString(9, user.getPassword());
        query.executeUpdate();
    }

    @Transactional
    public boolean verify(User user, HttpSession httpSession) {

        Session session = sessionFactory.getCurrentSession();
        NativeQuery query = session.createNativeQuery("SELECT * FROM USER WHERE email = ? and password = ?", User.class);
        query.setString(1, user.getEmail()); // q.setParameter("i",111);
        query.setString(2, user.getPassword());
        List<User> result = query.list();

        if (result.isEmpty())
            return false;

        httpSession.setAttribute("CurrentUser", result.get(0));
        return true;
    }

    @Transactional
    public User getUser(String userName, String userSurname) {
        Session session = sessionFactory.getCurrentSession();
        NativeQuery query = session.createNativeQuery("SELECT * FROM USER WHERE name = ? and surname = ?", User.class);
        query.setParameter(1, userName);
        query.setParameter(2, userSurname);
        return (User) query.list().get(0);
    }

    @Transactional
    public List<User> getUsers(String currentUserId) {
        Session session = sessionFactory.getCurrentSession();
        NativeQuery query = session.createNativeQuery("SELECT * FROM USER WHERE id != ?", User.class);
        query.setParameter(1, currentUserId);

        List<User> listOfUsers = query.list();
        return listOfUsers;
    }

    @Transactional
    public List<User> getFollowing(User currentUser) {
        Session session = sessionFactory.getCurrentSession();
        List<User> followingOfCurrentUser = session
                .createNativeQuery("select * from User where id in (select followedID from Following where followerID = ?)", User.class)
                .setParameter(1, currentUser.getId()).list();

        return followingOfCurrentUser;
    }

    @Transactional
    public List<User> getFollowers(User currentUser) {
        Session session = sessionFactory.getCurrentSession();
        List<User> followerOfCurrentUser = session
                .createNativeQuery("select * from User where id in (select followerID from Following where followedID = ?)", User.class)
                .setParameter(1, currentUser.getId()).list();

        return followerOfCurrentUser;
    }
}