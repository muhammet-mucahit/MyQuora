package com.zemuto.dao;

import com.zemuto.entity.Question;
import com.zemuto.entity.Topic;
import com.zemuto.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

@Component
public class QuestionDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public void addQuestion(Question question) {

        Session session = sessionFactory.getCurrentSession();
        session.save(question);
    }

    @Transactional
    public List<Question> getQuestionsOfCurrentUser(String currentUserId) {
        Session session = sessionFactory.getCurrentSession();
        NativeQuery query = session.createNativeQuery("SELECT * FROM Question WHERE userID = ? ORDER BY questionID DESC", Question.class);
        query.setString(1, currentUserId);
        List<Question> listOfQuestionsOfCurrentUser = query.list();
        return listOfQuestionsOfCurrentUser;
    }

    @Transactional
    public List<Question> getQuestionsFromOtherUsers(String currentUserId) {
        Session session = sessionFactory.getCurrentSession();
        NativeQuery query = session.createNativeQuery("SELECT * FROM Question WHERE userID != ? ORDER BY askDate DESC", Question.class);
        query.setParameter(1, currentUserId);
        List<Question> listOfQuestionsOfOtherUser = query.list();
        return listOfQuestionsOfOtherUser;
    }

    @Transactional
    public List<Question> getQuestions() {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Question");

        List<Question> listOfQuestions = query.list();
        System.out.println(listOfQuestions);
        return listOfQuestions;
    }

    @Transactional
    public List<Question> getQuestionByTopic(String topicName, HttpSession httpSession) {
        Session session = sessionFactory.getCurrentSession();
        User currentUser = (User) httpSession.getAttribute("CurrentUser");
        List<Question> questionsByTopic = session.createNativeQuery("select * from Question where userID != ? and questionID in (select questionID from TopicOfQuestion where topicID in (select topicID from Topic where topicName = ?))", Question.class)
                .setParameter(1, currentUser.getId())
                .setParameter(2, topicName)
                .list();
        return questionsByTopic;
    }

    @Transactional
    public Question getQuestionById(Long questionID) {
        Session session = sessionFactory.getCurrentSession();
        List<Question> questions = session.createNativeQuery("select * from Question where questionID = ?", Question.class)
                .setParameter(1, questionID)
                .list();
        return questions.get(0);
    }

    @Transactional
    public List<Question> getRelatedQuestions(Long currentQuestionID) {
        Session session = sessionFactory.getCurrentSession();
        List<Question> relatedQuestions = session.createNativeQuery("select * from Question where questionID in (select distinct questionID from TopicOfQuestion where questionID !=  ? and topicID in (select topicID from TopicOfQuestion where questionID = ?))", Question.class)
                .setParameter(1, currentQuestionID)
                .setParameter(2, currentQuestionID)
                .list();

        return relatedQuestions;
    }

    @Transactional
    public List<Question> getFollowingsAndRelatedTopicsQuestions(User currentUser) {
        Session session = sessionFactory.getCurrentSession();
        List<Question> followingsAndRelatedTopicsQuestions = session.createNativeQuery("select * from Question where userID in (select followedID from following where followerID = ?) and questionID in(select questionID from TopicOfQuestion where topicID in (select topicID from TopicOfUser where userID = ?))", Question.class)
                .setParameter(1, currentUser.getId())
                .setParameter(2, currentUser.getId())
                .list();
        return followingsAndRelatedTopicsQuestions;
    }
}
