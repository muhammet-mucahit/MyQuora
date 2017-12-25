package com.zemuto.dao;

import com.zemuto.entity.Answer;
import com.zemuto.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Component
public class AnswerDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public void answerQuestion(Answer answer) {

        Session session = sessionFactory.getCurrentSession();
        session.save(answer);
    }

    @Transactional
    public List<Answer> getAnswersForSpesificQuestion(Long questionID) {
        Session session = sessionFactory.getCurrentSession();
        List<Answer> answersOfSpesificQuestion = session
                .createNativeQuery("select * from Answer where questionID = ? order by answerDate desc", Answer.class)
                .setParameter(1, questionID)
                .list();
        return answersOfSpesificQuestion;
    }

    @Transactional
    public List<Answer> getAnswersFromOtherUsers(User currentUser) {
        Session session = sessionFactory.getCurrentSession();
        NativeQuery query = session.createNativeQuery("SELECT * FROM Answer WHERE userID != ? ORDER BY answerDate DESC", Answer.class);
        query.setParameter(1, currentUser.getId());
        List<Answer> listOfAnswersOfOtherUser = query.list();
        return listOfAnswersOfOtherUser;
    }
}
